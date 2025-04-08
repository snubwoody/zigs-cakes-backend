use crate::{db::CakeSize, AppState, ErrorResponse};
use axum::{
    extract::{Path, State}, http::StatusCode, Json
};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;
use crate::Result;

pub struct SizeService{
	state: AppState
}

impl SizeService{
	pub fn new(state:AppState) -> Self{
		Self { state }
	}

	/// Create a new [`CakeSize`]
	pub async fn create(
		&self,
		inches:i32,
		layers:i32,
		price:Decimal
	) -> Result<CakeSize>{
		let pool = self.state.pool();

		let size = sqlx::query_as::<_,CakeSize>(
			"
			INSERT INTO cake_sizes(inches,layers,price,label) 
			VALUES($1,$2,$3,'TODO: Remove column') 
			RETURNING *
			"
		)
		.bind(inches)
		.bind(layers)
		.bind(price)
		.fetch_one(pool)
		.await?;
	
		Ok(size)
	}

	/// Delete a [`CakeSize`]
	pub async fn delete(&self,id:i32) -> Result<()>{
		let pool = self.state.pool();

		sqlx::query("DELETE FROM cake_sizes WHERE id = $1")
			.bind(id)
			.execute(pool)
			.await?;

		Ok(())
	}


}