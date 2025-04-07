mod flavor;
mod size;
pub use flavor::*;
pub use size::*;
use crate::{AppState,middleware::auth_middleware};
use axum::{
    Router,
    routing::{delete, get, patch, post},
};
use crate::api::v1::orders::*;

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