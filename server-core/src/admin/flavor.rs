use crate::{db::CakeFlavor, AppState, ErrorResponse};
use axum::{
    extract::{Path, State}, http::StatusCode, Json
};
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;

/// The payload used when creating or updating a flavour
#[derive(Serialize, Deserialize, ToSchema)]
pub struct FlavorPayload {
    pub name: String,
}


#[utoipa::path(
	post,
	path="/api/v2/admin/cakes/flavor",
	responses(
		(status=201,description="Flavour created successfully",body=CakeFlavor),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Create a new flavour
pub async fn create_flavor(
    State(state): State<AppState>,
    Json(payload): Json<FlavorPayload>,
) -> crate::Result<(StatusCode,Json<CakeFlavor>)> {
	let flavor = sqlx::query_as::<_,CakeFlavor>("INSERT INTO cake_flavors(name) VALUES($1) RETURNING *")
		.bind(payload.name)
		.fetch_one(state.pool())
		.await?;

	Ok((
		StatusCode::CREATED,
		Json(flavor)
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
/// Update a flavour
pub async fn update_flavor(
    State(state): State<AppState>,
    Path(id): Path<i32>,
    Json(payload): Json<FlavorPayload>,
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

