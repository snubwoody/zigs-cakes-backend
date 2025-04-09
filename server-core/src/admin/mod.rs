mod flavor;
pub use flavor::*;
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
