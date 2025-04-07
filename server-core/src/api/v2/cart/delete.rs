use crate::{AppState, ErrorResponse};
use axum::{
    extract::{Path, State},
    http::StatusCode,
};
use uuid::Uuid;

#[utoipa::path(
	delete,
	path="/api/v2/cart/{cart_id}/item/{item_id}",
	responses(
		(status=200,description="Cart item removed successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Remove an item from the cart
pub async fn remove_from_cart(
    Path((cart_id, item_id)): Path<(Uuid, i32)>,
    State(state): State<AppState>,
) -> crate::Result<StatusCode> {
	// TODO check if the user has access to this cart
    sqlx::query!("DELETE FROM cakes WHERE id = $1", item_id)
        .execute(state.pool())
        .await?;
    Ok(StatusCode::OK)
}
