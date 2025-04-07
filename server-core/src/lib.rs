mod state;
mod auth;
mod error;
pub mod api;
pub mod db;
pub mod admin;
pub mod middleware;
pub mod secrets;
pub use error::*;
pub use state::AppState;

#[cfg(test)]
/// Creates a test user returning the [`Claims`] and the user jwt.
async fn create_test_user(
    jwt_secret: &str,
    pool: &sqlx::PgPool,
) -> crate::Result<(crate::auth::Claims, String)> {
    use auth::Claims;
    use jsonwebtoken::{EncodingKey, Header};

    let claims = Claims::default();

    sqlx::query("INSERT INTO profiles(id) VALUES($1)")
        .bind(claims.sub)
        .execute(pool)
        .await?;

    let encoding_key = EncodingKey::from_secret(jwt_secret.as_ref());
    let user_token = jsonwebtoken::encode(&Header::default(), &claims, &encoding_key)?;

    Ok((claims, user_token))
}

#[cfg(test)]
mod tests {
    use crate::{AppState, create_test_user};

    #[sqlx::test(migrations = "../migrations")]
    fn add_dummy_user(pool: sqlx::PgPool) {
        let state = AppState::new().await.unwrap();

        let (_, _) = create_test_user(state.jwt_secret(), &pool).await.unwrap();
    }
}
