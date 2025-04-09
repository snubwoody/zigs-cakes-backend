use axum::{
    extract::{Json, Path, State},
    http::StatusCode,
};
use server_core::{
    AppState,
    admin::{FlavorPayload, create_flavor, delete_flavor, update_flavor},
    db::CakeFlavor,
};

#[sqlx::test(migrations = "../migrations")]
fn create_cake_flavor(pool: sqlx::PgPool) {
    let app_state = AppState::with_pool(pool).await.unwrap();
    let state = State(app_state);

    let payload = FlavorPayload {
        name: "Red velvet".to_string(),
    };

    let (status, Json(new_flavor)) = create_flavor(state.clone(), Json(payload)).await.unwrap();

    assert_eq!(status, StatusCode::CREATED);

    let flavor = sqlx::query_as::<_, CakeFlavor>("SELECT * FROM cake_flavors WHERE id = $1")
        .bind(new_flavor.id)
        .fetch_one(state.pool())
        .await
        .unwrap();

    assert_eq!(flavor, new_flavor);
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

    let flavor = sqlx::query_as::<_, CakeFlavor>("SELECT * FROM cake_flavors WHERE id = $1")
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
    delete_flavor(state.clone(), id).await.unwrap();

    let flavor = sqlx::query_as::<_, CakeFlavor>("SELECT * FROM cake_flavors WHERE id = $1")
        .bind(flavor.id)
        .fetch_optional(state.pool())
        .await
        .unwrap();

    assert_eq!(flavor, None)
}
