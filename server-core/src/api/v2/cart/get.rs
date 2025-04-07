use crate::api::HttpExt;
use crate::{
    AppState, ErrorResponse,
    db::{Cake, CakeFlavor, CakeSize, Cart},
};
use axum::extract::Path;
use axum::{
    Json,
    extract::State,
    http::{HeaderMap, StatusCode},
};
use rust_decimal::Decimal;
use sqlx::prelude::FromRow;
use uuid::Uuid;

#[utoipa::path(
	get,
	path="/api/v2/cart",
	responses(
		(status=200,description="Cart created successfully",body=Uuid),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Create a cart and return the id.
///
/// # Errors
/// Fails if the user token is not included in the `Authorization` header.
pub async fn create_cart(
    State(state): State<AppState>,
    headers: HeaderMap,
) -> crate::Result<(StatusCode, axum::Json<Uuid>)> {
    let jwt_secret = state.jwt_secret();

    let claims = headers.get_jwt(jwt_secret)?;
    let user_id = claims.sub;

    let cart = sqlx::query_as::<_, Cart>("INSERT INTO cart(user_id) VALUES($1) RETURNING *")
        .bind(user_id)
        .fetch_one(state.pool())
        .await?;

    Ok((StatusCode::OK, Json(cart.id)))
}

#[utoipa::path(
	get,
	path="/api/v2/cart/{id}/items",
	responses(
		(status=200,description="Successfully fetched cart items",body=Vec<Cake>),
	)
)]
/// Fetch the items from the cart
pub async fn get_cart_items(
    Path(cart_id): Path<Uuid>,
    State(state): State<AppState>,
) -> crate::Result<Json<Vec<Cake>>> {
    #[derive(FromRow)]
    struct Row {
        id: i32,
        flavour_id: i32,
        size_id: i32,
        message: Option<String>,
        message_type: Option<String>,
        additional_instructions: Option<String>,
        cart: Uuid,
        quantity: i32,
        flavor_name: String,
        flavor_price: Decimal,
        flavor_currency_code: String,
        size_label: String,
        size_inches: i32,
        size_price: Decimal,
        size_layers: i32,
        size_currency_code: String,
    }

    let rows: Vec<Row> = sqlx::query_as(
        "
		SELECT 
			cake.id,
			cake.flavour_id,
			cake.size_id,
			cake.message,
			cake.message_type,
			cake.cart,
			cake.additional_instructions,
			cake.quantity,

			flavor.name as flavor_name,
			flavor.price as flavor_price,
			flavor.currency_code as flavor_currency_code,
			
			size.label as size_label,
			size.inches as size_inches,
			size.price as size_price,
			size.layers as size_layers,
			size.currency_code as size_currency_code
			
		FROM cakes cake
		JOIN cake_flavors flavor
		ON flavor.id = cake.flavour_id
		JOIN cake_sizes size
		ON size.id = cake.size_id
		WHERE cake.cart = $1
	",
    )
    .bind(cart_id)
    .fetch_all(state.pool())
    .await?;

    let cart_items: Vec<Cake> = rows
        .iter()
        .map(|record| {
            let flavor = CakeFlavor {
                id: record.flavour_id,
                name: record.flavor_name.clone(),
                price: record.flavor_price,
                currency_code: record.flavor_currency_code.clone(),
            };

            let size = CakeSize {
                id: record.size_id,
                label: record.size_label.clone(),
                inches: record.size_inches,
                price: record.size_price,
                currency_code: record.size_currency_code.clone(),
                layers: record.size_layers,
            };

            Cake {
                id: record.id,
                flavor,
                size,
                message: record.message.clone(),
                message_type: record.message_type.clone(),
                additional_instructions: record.additional_instructions.clone(),
                cart_id: record.cart,
                quantity: record.quantity,
            }
        })
        .collect();

    Ok(Json(cart_items))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{AppState, create_test_user};
    use axum::{extract::{Path, State}, http::HeaderValue};

    #[sqlx::test(migrations = "../migrations")]
    async fn init_cart(pool: sqlx::PgPool) {
        let app_state = AppState::with_pool(pool).await.unwrap();

        let state = State(app_state);

        let (claims, user_token) = create_test_user(state.jwt_secret(), state.pool())
            .await
            .unwrap();

        let mut headers = HeaderMap::new();
        headers.insert(
            "Authorization",
            HeaderValue::from_str(&format!("Bearer {user_token}")).unwrap(),
        );

        let (status, Json(id)) = create_cart(state.clone(), headers).await.unwrap();

        assert_eq!(status, StatusCode::OK);

        let cart = sqlx::query_as::<_, Cart>("SELECT * FROM cart where id=$1")
            .bind(id)
            .fetch_one(state.pool())
            .await
            .unwrap();

        assert_eq!(cart.id, id);
        assert_eq!(cart.user_id, Some(claims.sub));
    }

    #[sqlx::test(migrations = "../migrations")]
    async fn fetch_cart_items(pool: sqlx::PgPool) {
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

        let (_, Json(cart_id)) = create_cart(state.clone(), headers).await.unwrap();

        let _ = get_cart_items(Path(cart_id), state.clone()).await.unwrap();
    }
}
