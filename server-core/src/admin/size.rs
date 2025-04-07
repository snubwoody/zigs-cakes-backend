use crate::{db::{CakeFlavor, CakeSize}, AppState, ErrorResponse};
use axum::{
    extract::{Path, State}, http::StatusCode, Json
};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;

/// The payload used when creating or updating a size
#[derive(Serialize, Deserialize, ToSchema)]
pub struct SizePayload {
    pub inches: i32,
    pub layers: i32,
    pub price: Decimal,
}


#[utoipa::path(
	post,
	path="/api/v2/admin/cakes/size",
	responses(
		(status=201,description="Flavour created successfully",body=CakeSize),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Create a new size
pub async fn create_size(
    State(state): State<AppState>,
    Json(payload): Json<SizePayload>,
) -> crate::Result<(StatusCode,Json<CakeSize>)> {
	let size = sqlx::query_as::<_,CakeSize>(
		"
		INSERT INTO cake_sizes(inches,layers,price,label) 
		VALUES($1,$2,$3,'TODO: Remove column') 
		RETURNING *
		"
	)
	.bind(payload.inches)
	.bind(payload.layers)
	.bind(payload.price)
	.fetch_one(state.pool())
	.await?;

	Ok((
		StatusCode::CREATED,
		Json(size)
	))
}

#[utoipa::path(
	patch,
	path="/api/v2/admin/cakes/flavor/{id}",
	responses(
		(status=200,description="Flavour created successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Update a size
pub async fn update_size(
    State(state): State<AppState>,
    Path(id): Path<i32>,
    Json(payload): Json<SizePayload>,
) -> crate::Result<()> {
	sqlx::query("UPDATE cake_flavors SET name = $1 WHERE id = $2")
		.bind(id)
		.execute(state.pool())
		.await?;
	Ok(())
}

#[utoipa::path(
	delete,
	path="/api/v2/admin/cakes/sizes/{id}",
	responses(
		(status=200,description="Flavour deleted successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Delete a size
pub async fn delete_size(
    State(state): State<AppState>,
    Path(id): Path<i32>,
) -> crate::Result<()> {
	sqlx::query("DELETE FROM cake_flavors WHERE id = $1")
		.bind(id)
		.execute(state.pool())
		.await?;
	Ok(())
}

