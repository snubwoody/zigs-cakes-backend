use crate::{AppState, ErrorResponse};
use axum::{
    Json,
    extract::{Path, State},
};
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;

#[derive(Serialize, Deserialize, ToSchema)]
pub struct UpdateFlavorPayload {
    pub name: String,
}

#[utoipa::path(
	patch,
	path="/api/v2/admin/cakes/flavor/{id}",
	responses(
		(status=200,description="Flavour created successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Update a flavour
pub async fn update_flavor(
    State(state): State<AppState>,
    Path(id): Path<i32>,
    Json(payload): Json<UpdateFlavorPayload>,
) -> crate::Result<()> {
	sqlx::query("UPDATE cake_flavors SET name = $1 WHERE id = $2")
		.bind(payload.name)
		.bind(id)
		.execute(state.pool())
		.await?;
	Ok(())
}

#[utoipa::path(
	delete,
	path="/api/v2/admin/cakes/flavor/{id}",
	responses(
		(status=200,description="Flavour deleted successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Delete a flavour
pub async fn delete_flavor(
    State(state): State<AppState>,
    Path(id): Path<i32>,
) -> crate::Result<()> {
	sqlx::query("DELETE FROM cake_flavors WHERE id = $1")
		.bind(id)
		.execute(state.pool())
		.await?;
	Ok(())
}

