use crate::Error;
use axum::http::{HeaderMap, StatusCode};
use chrono::Utc;
use jsonwebtoken::{Algorithm, DecodingKey, EncodingKey, Header};
use serde::{Deserialize, Serialize};
use sqlx::PgPool;
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize)]
pub struct Claims {
    /// The issuer of the JWT.
    pub iss: String,
    /// The subject of the JWT (user id)
    pub sub: Uuid,
    pub aud: String,
    /// The expiry of the JWT
    pub exp: i64,
    /// The time the JWT was issued
    pub iat: i64,
    pub role: String,
}

impl Default for Claims {
    fn default() -> Self {
        let iat = Utc::now().timestamp();

        Claims {
            iss: String::from("https://example.com"),
            sub: Uuid::new_v4(),
            aud: String::from("authenticated"),
            exp: iat + chrono::Duration::hours(1).num_seconds(),
            iat,
            role: String::new(),
        }
    }
}

/// Extract the authorization token
pub fn get_auth(jwt_secret: &str, headers: &HeaderMap) -> crate::Result<Claims> {
    let jwt = headers
        .get("Authorization")
        .ok_or(Error::request(
            "Missing authorization header",
            "",
            StatusCode::UNAUTHORIZED,
        ))?
        .to_str()
        .map_err(|_| {
            Error::request(
                "Failed to process authorization header",
                "",
                StatusCode::UNPROCESSABLE_ENTITY,
            )
        })?
        .strip_prefix("Bearer ")
        .ok_or(Error::request(
            "Invalid authorization header",
            "Authorization header is not prefixed with Bearer",
            StatusCode::UNPROCESSABLE_ENTITY,
        ))?;

    match decode_jwt(jwt, jwt_secret) {
        Ok(token) => Ok(token),
        Err(err) => Err(Error::request(
            "Invalid auth token",
            &format!("{}", err),
            StatusCode::FORBIDDEN,
        )),
    }
}

/// Checks if a user has admin permissions
pub async fn check_auth(uid: &Uuid, pool: &PgPool) -> crate::Result<()> {
    let role = sqlx::query!(
        "
		SELECT label FROM roles
		RIGHT JOIN user_roles ON roles.id = user_roles.role
		WHERE user_roles.uid = $1
		",
        uid
    )
    .fetch_one(pool)
    .await
    .map_err(|_| {
        Error::request(
            "Unauthenticated",
            "You do not have access to this resource",
            StatusCode::FORBIDDEN,
        )
    })?;

    if role.label != "admin" {
        log::warn!(
            "Unauthenticated user trying to access admin resources: {}",
            &uid
        );
        return Err(Error::request(
            "Unauthenticated",
            "You do not have access to this resource",
            StatusCode::FORBIDDEN,
        ));
    }

    Ok(())
}

pub fn decode_jwt(jwt: &str, jwt_secret: &str) -> Result<Claims, crate::Error> {
    let mut validation = jsonwebtoken::Validation::new(Algorithm::HS256);

    validation.set_audience(&["authenticated", "anon"]);
    let decoding_key = DecodingKey::from_secret(jwt_secret.as_ref());

    let token = jsonwebtoken::decode::<Claims>(jwt, &decoding_key, &validation)?;

    Ok(token.claims)
}

pub fn encode_jwt(claims: Claims, jwt_secret: &str) -> Result<String, crate::Error> {
    let encoding_key = EncodingKey::from_secret(jwt_secret.as_ref());

    let token = jsonwebtoken::encode(&Header::default(), &claims, &encoding_key)?;
    Ok(token)
}

#[cfg(test)]
mod tests {
    use super::*;
    use sqlx::PgPool;

    #[test]
    fn encode_and_decode_jwt() -> Result<(), crate::Error> {
        let claims = Claims::default();
        let id = claims.sub;

        let secret = "my-very-private-secret";
        let jwt = encode_jwt(claims, secret)?;

        let claims = decode_jwt(&jwt, secret)?;
        assert_eq!(claims.sub, id);

        Ok(())
    }

    #[sqlx::test(migrations = "../migrations")]
    async fn get_user_roles(pool: PgPool) {
        let uid = Uuid::max();

        sqlx::query!("INSERT INTO profiles (id) VALUES ($1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        sqlx::query!("INSERT INTO user_roles(uid,role) VALUES ($1,1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        check_auth(&uid, &pool).await.unwrap();
    }

    #[sqlx::test]
    #[should_panic]
    async fn missing_admin_access(pool: PgPool) {
        let uid = Uuid::max();

        sqlx::query!("INSERT INTO profiles (id) VALUES ($1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        check_auth(&uid, &pool).await.unwrap();
    }
}
