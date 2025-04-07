pub mod cart;
pub mod orders;
use crate::AppState;
use crate::db::{CakeFlavor, CakeSize};
use axum::Json;
use axum::extract::State;

pub async fn get_cake_flavors(
    State(state): State<AppState>,
) -> crate::Result<Json<Vec<CakeFlavor>>> {
    let flavors = sqlx::query_as::<_, CakeFlavor>("SELECT * FROM cake_flavors")
        .fetch_all(state.pool())
        .await?;

    Ok(Json(flavors))
}

pub async fn get_cake_sizes(State(state): State<AppState>) -> crate::Result<Json<Vec<CakeSize>>> {
    let sizes = sqlx::query_as::<_, CakeSize>("SELECT * FROM cake_sizes")
        .fetch_all(state.pool())
        .await?;

    Ok(Json(sizes))
}

#[cfg(test)]
mod tests {
    use super::*;
    use dotenv::dotenv;

    #[sqlx::test]
    async fn insert_cake_flavor() {
        let _ = dotenv();
        let state = AppState::new().await.unwrap();

        sqlx::query(
            "
			INSERT INTO cake_flavors(name,price,currency_code)
			VALUES ('Chocolate',100,'ZMW')
		",
        )
        .execute(state.pool())
        .await
        .unwrap();
    }

    #[tokio::test]
    async fn fetch_cake_flavors() {
        let _ = dotenv();

        let app_state = AppState::new().await.unwrap();
        let state = State(app_state);

        let _ = get_cake_flavors(state).await.unwrap();
    }

    #[tokio::test]
    async fn fetch_cake_sizes() {
        let _ = dotenv();

        let app_state = AppState::new().await.unwrap();
        let state = State(app_state);

        let _ = get_cake_sizes(state).await.unwrap();
    }
}
