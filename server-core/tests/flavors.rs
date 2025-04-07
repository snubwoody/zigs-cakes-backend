use axum::extract::{Path, State,Json};
use server_core::{
	AppState, 
	db::CakeFlavor,
	admin::{
		UpdateFlavorPayload,
		update_flavor,
		delete_flavor
	}
};

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

	let payload = UpdateFlavorPayload {
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
fn delete_cake_flavor(pool: sqlx::PgPool) {
	let app_state = AppState::with_pool(pool).await.unwrap();
	let state = State(app_state);

	let flavor = sqlx::query_as::<_, CakeFlavor>(
		"INSERT INTO cake_flavors(name,price) VALUES('Vanilla',500) RETURNING *",
	)
	.fetch_one(state.pool())
	.await
	.unwrap();

	let id = Path(flavor.id);
	delete_flavor(state.clone(), id)
		.await
		.unwrap();

	let flavor = sqlx::query_as::<_, CakeFlavor>(
		"SELECT * FROM cake_flavors WHERE id = $1",
	)
	.bind(flavor.id)
	.fetch_optional(state.pool())
	.await
	.unwrap();

	assert_eq!(flavor,None)
}