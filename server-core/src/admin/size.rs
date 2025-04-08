use crate::{db::CakeSize, services::size::SizeService, AppState, ErrorResponse};
use axum::{
    extract::{Path, State}, http::StatusCode, Json
};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;


/// The payload used when creating a size
#[derive(Serialize, Deserialize, ToSchema)]
pub struct CreateSizePayload {
    pub inches: i32,
    pub layers: i32,
    pub price: Decimal,
}

/// Describes the details when updating a size.
/// 
/// Only fields that are not left out will be updated, the rest will
/// be kept as is.
#[derive(Serialize,Deserialize,ToSchema,Default)]
#[serde(default)]
pub struct UpdateSizePayload{
	pub inches: Option<i32>,
	pub layers: Option<i32>,
	pub price: Option<Decimal>
}

impl UpdateSizePayload{
	/// Fill in the empty fields with the ones from the database
	async fn fill_empty(&self,id:i32,pool: &sqlx::PgPool) -> crate::Result<()>{
		let size = sqlx::query_as::<_,CakeSize>(
			"SELECT * FROM cake_sizes WHERE id = $1"
		)
		.bind(id)
		.fetch_one(pool)
		.await?;

		Ok(())
	}
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
    Json(payload): Json<UpdateSizePayload>,
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
/// Delete a [`CakeSize`]
pub async fn delete_size(
    State(state): State<AppState>,
    Path(id): Path<i32>,
) -> crate::Result<()> {
	let sizes = SizeService::new(state.clone());
	sizes.delete(id).await
}

#[cfg(test)]
mod tests{
	use super::*;

	#[sqlx::test(migrations="../migrations")]
	async fn fill_empty_fields_in_update_size_payload(
		pool: sqlx::PgPool
	) -> crate::Result<()>
	{
		let app_state = AppState::new().await?;
		let state = State(app_state);

		let price = Decimal::new(250, 2);
		let payload = Json(CreateSizePayload{
			inches: 10,
			layers: 3,
			price 
		});

		let size = create_size(state, payload).await?;
		let payload = UpdateSizePayload{
			inches: Some(10),
			layers: None,
			price:None
		};

		Ok(())
	}
}