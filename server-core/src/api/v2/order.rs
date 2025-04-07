use crate::ErrorResponse;
use crate::db::{Cake, CakeRow, OrderRow};
use crate::{AppState, Error};
use axum::Json;
use axum::extract::{Path, Query, State};
use axum::http::StatusCode;
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;
use uuid::Uuid;
type PostOrderResponse = crate::Result<(StatusCode, Json<OrderRow>)>;

#[derive(Serialize, Deserialize, Default, ToSchema)]
pub struct OrderPayload {
    name: String,
    #[serde(default)]
    email: Option<String>,
    phone_number: String,
    pick_up: DateTime<Utc>,
    #[serde(default = "default_status")]
    status: String,
    cart_id: Uuid,
}

fn default_status() -> String {
    "Pending".to_string()
}

#[utoipa::path(
	post,
	path="/api/v2/order",
	responses(
		(status=201,description="Order submitted successfully",body=OrderRow),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Submit an order
pub async fn submit_order(
    State(state): State<AppState>,
    Json(payload): Json<OrderPayload>,
) -> PostOrderResponse {
    let order: OrderRow = sqlx::query_as!(
        OrderRow,
        "
		INSERT INTO orders
		(pick_up,name,email,status,phone_number,cart)
		VALUES ($1,$2,$3,$4,$5,$6)
		RETURNING *
		",
        payload.pick_up,
        payload.name,
        payload.email,
        payload.status,
        payload.phone_number,
        payload.cart_id,
    )
    .fetch_one(state.pool())
    .await?;

    Ok((StatusCode::CREATED, Json(order)))
}
