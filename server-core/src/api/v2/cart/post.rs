use crate::AppState;
use crate::api::HttpExt;
use axum::{
    Json,
    extract::{Path, State},
    http::{HeaderMap, StatusCode},
};
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;
use uuid::Uuid;

#[derive(Serialize, Deserialize, ToSchema, Default)]
pub struct AddToCartPayload {
    /// The id of the cake flavour
    pub flavor_id: i32,
    pub size_id: i32,
    #[serde(default)]
    pub message: Option<String>,
    /// The type of message i.e `Topper` or `Icing`
    // TODO change this to an enum or use a look up table
    #[serde(default)]
    pub message_type: Option<String>,
    #[serde(default)]
    pub additional_instructions: Option<String>,
    pub quantity: i32,
}

#[utoipa::path(
	post,
	path="/api/v2/cart/{id}/item",
	request_body=AddToCartPayload,
	responses(
		(status=200,description="Successfully added item to cart"),
		(status=401,description="User token not found in header")
	)
)]
/// Add an item to the cart.
pub async fn add_to_cart(
    Path(cart_id): Path<Uuid>,
    State(state): State<AppState>,
    headers: HeaderMap,
    Json(payload): Json<AddToCartPayload>,
) -> crate::Result<StatusCode> {
    // TODO handle auth
    let jwt_secret = state.jwt_secret();

    let claims = headers.get_jwt(jwt_secret)?;
    let user_id = claims.sub;

    sqlx::query(
        "INSERT INTO cakes(
			flavour_id,
			size_id,
			message,
			message_type,
			additional_instructions,
			quantity,
			cart
		) 
		VALUES($1,$2,$3,$4,$5,$6,$7) 
		",
    )
    .bind(payload.flavor_id)
    .bind(payload.size_id)
    .bind(payload.message)
    .bind(payload.message_type)
    .bind(payload.additional_instructions)
    .bind(payload.quantity)
    .bind(cart_id)
    .execute(state.pool())
    .await?;

    Ok(StatusCode::CREATED)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{
        AppState, api, create_test_user,
        db::{CakeFlavor, CakeSize},
    };
    use axum::{extract::State, http::HeaderValue};

    #[sqlx::test(migrations = "../migrations")]
    fn add_cake_to_cart(pool: sqlx::PgPool) {
        let app_state = AppState::with_pool(pool).await.unwrap();

        let state = State(app_state);

        let (_, user_token) = create_test_user(state.jwt_secret(), state.pool())
            .await
            .unwrap();

        let mut headers = HeaderMap::new();
        headers.insert(
            "Authorization",
            HeaderValue::from_str(&format!("Bearer {user_token}")).unwrap(),
        );

        let flavor: CakeFlavor =
            sqlx::query_as("SELECT id,price,name, currency_code FROM cake_flavors LIMIT 1")
                .fetch_one(state.pool())
                .await
                .unwrap();

        let size: CakeSize = sqlx::query_as(
            "
			SELECT id,label,inches,price,currency_code,layers 
			FROM cake_sizes 
			LIMIT 1
			",
        )
        .fetch_one(state.pool())
        .await
        .unwrap();

        let payload = AddToCartPayload {
            size_id: size.id,
            flavor_id: flavor.id,
            quantity: 1,
            ..Default::default()
        };

        let (_, Json(cart_id)) = api::v2::create_cart(state.clone(), headers.clone())
            .await
            .unwrap();

        let status = add_to_cart(Path(cart_id), state.clone(), headers, Json(payload))
            .await
            .unwrap();

        assert_eq!(status, StatusCode::CREATED);
    }

    #[sqlx::test]
    async fn cart_user_id_doesnt_math_token() {}
}
