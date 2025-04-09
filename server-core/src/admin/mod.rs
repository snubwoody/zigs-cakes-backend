use crate::{AppState,middleware::auth_middleware};
use axum::{
    Router,
    routing::{delete, get, patch, post},
};
use crate::api::v1::orders::*;
use crate::{db::CakeSize, services::size::{SizeService, UpdateSizeDesc}, 
ErrorResponse};
use axum::{
    extract::{Path, State}, http::StatusCode, Json
};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;
use crate::db::CakeFlavor;


pub fn admin_api(state: AppState) -> Router<AppState>{
	Router::new()
        .route("/orders", get(get_orders))
        .route("/order/{id}", get(fetch_order))
        .route("/order/{id}/status/{status}", patch(update_order_status))
        .route("/cart/{id}/items", get(fetch_cakes))
		.route("/cakes/flavor/{id}", patch(update_flavor))
		.route("/cakes/flavor", post(create_flavor))
		.route("/cakes/flavor", delete(delete_flavor))
        .layer(axum::middleware::from_fn_with_state(
            state.clone(),
            auth_middleware,
        ))
}


/// The payload used when creating a size
#[derive(Serialize, Deserialize, ToSchema)]
pub struct CreateSizePayload {
    pub inches: i32,
    pub layers: i32,
    pub price: Decimal,
}


#[utoipa::path(
	post,
	path="/api/v2/admin/cakes/size",
	responses(
		(status=201,description="Cake size created successfully",body=CakeSize),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Create a new size
pub async fn create_size(
    State(state): State<AppState>,
    Json(payload): Json<CreateSizePayload>,
) -> crate::Result<(StatusCode,Json<CakeSize>)> {
	let sizes = SizeService::new(state.clone());
	let CreateSizePayload { inches, layers, price } = payload;
	let size = sizes.create(inches, layers, price).await?;
	
	Ok((
		StatusCode::CREATED,
		Json(size)
	))
}

#[utoipa::path(
	patch,
	path="/api/v2/admin/cakes/size/{id}",
	responses(
		(status=200,description="Flavour created successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Update a size
pub async fn update_size(
    State(state): State<AppState>,
    Path(id): Path<i32>,
    Json(desc): Json<UpdateSizeDesc>,
) -> crate::Result<()> {
	let sizes = SizeService::new(state.clone());
	sizes.update(id,desc).await
}

#[utoipa::path(
	delete,
	path="/api/v2/admin/cakes/sizes/{id}",
	responses(
		(status=200,description="Flavour deleted successfully"),
		(status=401,description="Missing authorization header",body=ErrorResponse)
	)
)]
/// Delete a [`CakeSize`]
pub async fn delete_size(
    State(state): State<AppState>,
    Path(id): Path<i32>,
) -> crate::Result<()> {
	let sizes = SizeService::new(state.clone());
	sizes.delete(id).await
}

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
