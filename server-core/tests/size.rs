use axum::{extract::{Json, Path, State}, http::StatusCode};
use rust_decimal::Decimal;
use server_core::{
	admin::{
		create_size, delete_flavor, delete_size, update_flavor, FlavorPayload, CreateSizePayload
	}, db::{CakeFlavor, CakeSize}, AppState, Error
};

#[sqlx::test(migrations = "../migrations")]
fn create_cake_size(pool: sqlx::PgPool) -> Result<(),Error> {
	let app_state = AppState::with_pool(pool).await?;
	let state = State(app_state);

	let payload = CreateSizePayload {
		inches: 23,
		layers: 5,
		price: Decimal::new(500, 2)
	};
 
	let (
		status,
		Json(new_size)
	) = create_size(state.clone(), Json(payload))
		.await?;

	assert_eq!(status,StatusCode::CREATED);

	let size = sqlx::query_as::<_, CakeSize>(
		"SELECT * FROM cake_sizes WHERE id = $1",
	)
	.bind(new_size.id)
	.fetch_one(state.pool())
	.await?;

	assert_eq!(size, new_size);
	Ok(())
}

#[sqlx::test(migrations = "../migrations")]
fn update_cake_flavor(pool: sqlx::PgPool) {
	let app_state = AppState::with_pool(pool).await.unwrap();
	let state = State(app_state);

	let flavor = sqlx::query_as::<_, CakeFlavor>(
		"INSERT INTO cake_flavors(name,price) VALUES('Vanilla',500) RETURNING *",
	)
	.fetch_one(state.pool())
	.await
	.unwrap();

	let payload = FlavorPayload {
		name: "Red velvet".to_string(),
	};
	let id = Path(flavor.id);

	update_flavor(state.clone(), id, Json(payload))
		.await
		.unwrap();

	let flavor = sqlx::query_as::<_, CakeFlavor>(
		"SELECT * FROM cake_flavors WHERE id = $1",
	)
	.bind(flavor.id)
	.fetch_one(state.pool())
	.await
	.unwrap();

	assert_eq!(flavor.name, "Red velvet")
}

#[sqlx::test(migrations = "../migrations")]
fn delete_cake_size(pool: sqlx::PgPool) -> Result<(),Error> {
	let app_state = AppState::with_pool(pool).await?;
	let state = State(app_state);

	let payload = CreateSizePayload {
		inches: 23,
		layers: 5,
		price: Decimal::new(500, 2)
	};

	let (_,size) = create_size(state.clone(), Json(payload)).await?;

	let id = Path(size.id);
	delete_size(state.clone(), id)
		.await?;

	let size = sqlx::query_as::<_, CakeSize>(
		"SELECT * FROM cake_sizes WHERE id = $1",
	)
	.bind(size.id)
	.fetch_optional(state.pool())
	.await?;

	assert_eq!(size,None);

	Ok(())
}