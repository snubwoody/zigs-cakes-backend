use crate::{AppState, Error};
use axum::Json;
use axum::extract::State;
use axum::http::StatusCode;
use axum_extra::extract::CookieJar;
use serde::{Deserialize, Serialize};
use uuid::Uuid;

#[derive(Serialize, Deserialize, Clone, PartialEq, Eq, PartialOrd, Ord)]
pub struct AddToCartPayload {
    pub flavour_id: i32,
    pub size_id: i32,
    pub message: Option<String>,
    pub message_type: Option<String>,
    pub additional_instructions: Option<String>,
    pub quantity: i32,
}

pub async fn add_to_cart(
    State(state): State<AppState>,
    jar: CookieJar,
    Json(payload): Json<AddToCartPayload>,
) -> crate::Result<(CookieJar, StatusCode)> {
    let cart = jar.get("cart").ok_or(Error::request(
        "Missing cart",
        "Missing cart in cookies",
        StatusCode::BAD_REQUEST,
    ))?;

    let cart_id = Uuid::parse_str(cart.value()).map_err(|err| {
        log::error!("{}", &err);
        Error::request(
            "Invalid cart id",
            &format!("{}", err),
            StatusCode::BAD_REQUEST,
        )
    })?;

    let result = sqlx::query(
        "
		INSERT INTO cakes 
		(flavour_id,size_id,message,message_type,cart,additional_instructions,quantity)
		VALUES ($1,$2,$3,$4,$5,$6,$7)
	",
    )
    .bind(payload.flavour_id)
    .bind(payload.size_id)
    .bind(payload.message)
    .bind(payload.message_type)
    .bind(cart_id)
    .bind(payload.additional_instructions)
    .bind(payload.quantity)
    .execute(state.pool())
    .await;

    match result {
        Ok(_) => Ok((jar, StatusCode::CREATED)),
        Err(err) => {
            tracing::error!("{}", err);
            Err(Error::internal())
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use cookie::Cookie;

    #[sqlx::test(migrations = "../migrations")]
    fn add_cake_to_cart(pool: sqlx::PgPool) {
        let app_state = AppState::with_pool(pool).await.unwrap();
        let id = Uuid::new_v4();
        let cookies = CookieJar::new().add(Cookie::new("cart", id.to_string()));

        sqlx::query!("INSERT INTO cart VALUES($1)", id)
            .execute(app_state.pool())
            .await
            .unwrap();

        let payload = AddToCartPayload {
            flavour_id: 1,
            size_id: 1,
            message: None,
            message_type: None,
            additional_instructions: None,
            quantity: 1,
        };

        add_to_cart(State(app_state), cookies, Json(payload))
            .await
            .unwrap();
    }

    #[sqlx::test]
    #[should_panic]
    fn missing_cart_when_ordering(pool: sqlx::PgPool) {
        let app_state = AppState::with_pool(pool).await.unwrap();

        let cookies = CookieJar::new();

        let payload = AddToCartPayload {
            flavour_id: 1,
            size_id: 1,
            message: None,
            message_type: None,
            additional_instructions: None,
            quantity: 1,
        };

        add_to_cart(State(app_state), cookies, Json(payload))
            .await
            .unwrap();
    }
}
