use axum::{
    Json, Router,
    http::{HeaderName, HeaderValue, Method, header},
    routing::{delete, get, patch, post},
};
use server_core::AppState;
use server_core::api::{
    self,
    v1::{cart::*, orders::*, *},
};
use server_core::middleware::{auth_middleware, logging_middleware};
pub use server_core::{Error, Result};
use std::env;
use tower::ServiceBuilder;
use tower_http::cors::CorsLayer;
use utoipa::OpenApi;
use utoipa_swagger_ui::SwaggerUi;

#[derive(OpenApi)]
#[openapi(paths(
    openapi,
    api::v2::create_cart,
    api::v2::get_cart_items,
    api::v2::add_to_cart,
    api::v2::submit_order,
    api::v2::remove_from_cart
))]
struct ApiDoc;

#[utoipa::path(
	get,
	path="/api-docs/openapi.json",
	responses(
		(status=200,description="JSON file",body=())
	)
)]
async fn openapi() -> Json<utoipa::openapi::OpenApi> {
    Json(ApiDoc::openapi())
}

fn cors() -> CorsLayer {
    CorsLayer::new()
        .allow_origin([
            "http://localhost:3000".parse::<HeaderValue>().unwrap(),
            "http://localhost:3100".parse::<HeaderValue>().unwrap(),
            "http://192.168.4.22:3000".parse::<HeaderValue>().unwrap(),
            "https://frontend-website-160650575490.africa-south1.run.app"
                .parse::<HeaderValue>()
                .unwrap(),
            "https://admin-website-160650575490.africa-south1.run.app"
                .parse::<HeaderValue>()
                .unwrap(),
            "https://zigscakes.com".parse::<HeaderValue>().unwrap(),
            "https://admin.zigscakes.com"
                .parse::<HeaderValue>()
                .unwrap(),
        ])
        .allow_headers([
            header::CONTENT_TYPE,
            header::AUTHORIZATION,
            header::ACCEPT,
            header::ORIGIN,
            header::CONNECTION,
            header::HOST,
            header::USER_AGENT,
            header::REFERER,
            header::ACCEPT_ENCODING,
            header::COOKIE,
            header::ACCEPT_LANGUAGE,
            HeaderName::from_static("x-requested-with"),
            HeaderName::from_static("x-api-key"),
        ])
        .allow_methods([
            Method::GET,
            Method::DELETE,
            Method::PATCH,
            Method::PUT,
            Method::POST,
            Method::HEAD,
            Method::OPTIONS,
        ])
        .allow_credentials(true)
}

async fn server() -> crate::Result<()> {
    let port = env::var("PORT").ok().unwrap_or(String::from("3000"));

    let state = AppState::new().await?;

    let ui = SwaggerUi::new("/docs").url("/api-docs/open-api.json", ApiDoc::openapi());

    let middleware = ServiceBuilder::new()
        .layer(cors())
        .layer(axum::middleware::from_fn(logging_middleware));

    let admin_api = Router::new()
        .route("/orders", get(get_orders))
        .route("/order/{id}", get(fetch_order))
        .route("/order/{id}/status/{status}", patch(update_order_status))
        .route("/cart/{id}/items", get(fetch_cakes))
        .layer(axum::middleware::from_fn_with_state(
            state.clone(),
            auth_middleware,
        ));

    let public_api = Router::new()
        .route("/cakes/flavors", get(get_cake_flavors))
        .route("/cakes/sizes", get(get_cake_sizes))
        .route("/cart", get(create_cart))
        .route("/cart/items", get(get_cart_items))
        .route("/cart", post(add_to_cart))
        .route("/cart/item", delete(remove_from_cart))
        .route("/order", post(post_order));

    let public_api_v2 = Router::new()
        .route("/cart", get(api::v2::create_cart))
        .route("/cart/{id}/item", post(api::v2::add_to_cart))
        .route(
            "/cart/{cart_id}/item/{item_id}",
            delete(api::v2::remove_from_cart),
        )
        .route("/cart/{id}/items", get(api::v2::get_cart_items))
        .route("/order", post(api::v2::submit_order));

    let app = Router::new()
        .route("/active", get(|| async { "The server is up and running!" }))
        .route("/api-docs", get(openapi))
        .nest("/api/v1", public_api)
        .nest("/api/v2", public_api_v2)
        .nest("/api/v1/admin", admin_api)
        .merge(ui)
        .layer(middleware)
        .with_state(state);

    let listener = tokio::net::TcpListener::bind(format!("0.0.0.0:{port}")).await?;

    let socket = listener.local_addr()?;

    log::info!("Starting server on: {socket}");

    axum::serve(listener, app).await?;

    Ok(())
}

#[tokio::main]
async fn main() -> Result<()> {
    let _ = dotenv::dotenv();

    if cfg!(debug_assertions) {
        tracing_subscriber::fmt().init();
    } else {
        tracing_subscriber::fmt().json().init();
    }

    server().await?;

    tracing::error!("Shutting down");
    Ok(())
}
