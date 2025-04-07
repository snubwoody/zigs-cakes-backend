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
	path="/api/v2/admin/flavor/{id}",
	responses(
		(status=200,description="Order submitted successfully"),
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

#[cfg(test)]
mod tests {
    use super::*;
    use axum::extract::{Path, State};

    use crate::{AppState, db::CakeFlavor};

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
}
