use crate::AppState;
use axum::{
    extract::{Query, State},
    http::StatusCode,
};
use axum_extra::extract::CookieJar;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize, Clone, Copy)]
pub struct DeleteQuery {
    id: i32,
}

pub async fn remove_from_cart(
    State(state): State<AppState>,
    Query(query): Query<DeleteQuery>,
    _cookies: CookieJar,
) -> crate::Result<StatusCode> {
    sqlx::query!("DELETE FROM cakes WHERE id = $1", query.id)
        .execute(state.pool())
        .await?;
    Ok(StatusCode::OK)
}

#[cfg(test)]
mod tests {
    use axum::Json;

    use super::*;
    use crate::api::v1::cart::{AddToCartPayload, add_to_cart, get_cart_items, init_cart};

    #[sqlx::test(migrations = "../migrations")]
    async fn delete_from_cart(pool: sqlx::PgPool) {
        let cookies = init_cart(&pool, CookieJar::new()).await.unwrap();
        let app_state = AppState::with_pool(pool).await.unwrap();
        let state = State(app_state);

        let cake = AddToCartPayload {
            flavour_id: 1,
            size_id: 1,
            message: None,
            message_type: None,
            additional_instructions: None,
            quantity: 1,
        };

        add_to_cart(state.clone(), cookies.clone(), Json(cake.clone()))
            .await
            .unwrap();
        add_to_cart(state.clone(), cookies.clone(), Json(cake.clone()))
            .await
            .unwrap();
        add_to_cart(state.clone(), cookies.clone(), Json(cake.clone()))
            .await
            .unwrap();

        let items = get_cart_items(state.clone(), cookies.clone())
            .await
            .unwrap();

        assert_eq!(items.len(), 3);

        let query = DeleteQuery { id: items[0].id };

        remove_from_cart(state.clone(), Query(query), cookies.clone())
            .await
            .unwrap();

        let items = get_cart_items(state.clone(), cookies.clone())
            .await
            .unwrap();

        assert_eq!(items.len(), 2);
    }
}
