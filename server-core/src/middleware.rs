use crate::{
    AppState,
    auth::{check_auth, get_auth},
};
use axum::{
    extract::{Request, State},
    middleware::Next,
    response::{IntoResponse, Response},
};
use std::time::Instant;

/// Logs useful information about each request.
pub async fn logging_middleware(request: Request, next: Next) -> Response {
    let now = Instant::now();
    let method = request.method().clone();
    let uri = request.uri().clone();
    let headers = request.headers().clone();
    let user_agent = headers
        .get("User-Agent")
        .map_or("", |value| value.to_str().unwrap_or_default());

    let response = next.run(request).await;

    let status = response.status();
    let latency = now.elapsed().as_millis();

    if status.is_client_error() {
        tracing::warn!(
            uri = format!("{} {}", method, uri),
            status = status.to_string(),
            response = format!("{:#?}", response.body()),
            latency = format!("{}ms", latency),
            user_agent,
        );
    } else if status.is_server_error() {
        tracing::error!(
			severity="ERROR",
            uri = format!("{} {}", method, uri),
            status = status.to_string(),
            latency = format!("{}ms", latency),
            response = format!("{:#?}", response.body()),
            user_agent,
        );
    } else {
        tracing::info!(
			severity="INFO",
            uri = format!("{} {}", method, uri),
            status = status.to_string(),
            latency = format!("{}ms", latency),
            user_agent,
        );
    }

    response
}

pub async fn auth_middleware(
    State(state): State<AppState>,
    request: Request,
    next: Next,
) -> Response {
    let jwt_secret = state.jwt_secret();

    match get_auth(jwt_secret, request.headers()) {
        Ok(claims) => {
            let result = check_auth(&claims.sub, state.pool()).await;
            match result {
                Ok(_) => {}
                Err(err) => {
                    log::error!("Authorization error: {}", &err);
                    return err.into_response();
                }
            }
        }
        Err(error) => {
            log::error!("Authorization error: {}", &error);
            return error.into_response();
        }
    }

    next.run(request).await
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::auth::check_auth;
    use axum::{Router, body::Body, http::StatusCode, routing::get};
    use sqlx::PgPool;
    use tower::Service;
    use uuid::Uuid;

    #[sqlx::test(migrations = "../migrations")]
    async fn get_user_roles(pool: PgPool) {
        let uid = Uuid::max();

        sqlx::query!("INSERT INTO profiles (id) VALUES ($1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        sqlx::query!("INSERT INTO user_roles(uid,role) VALUES ($1,1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        check_auth(&uid, &pool).await.unwrap();
    }

    #[sqlx::test]
    #[should_panic]
    async fn missing_admin_access(pool: PgPool) {
        let uid = Uuid::max();

        sqlx::query!("INSERT INTO profiles (id) VALUES ($1)", uid)
            .execute(&pool)
            .await
            .unwrap();

        check_auth(&uid, &pool).await.unwrap();
    }

    #[tokio::test]
    async fn missing_auth_header() {
        let state = AppState::new().await.unwrap();

        let mut router = Router::new()
            .route("/", get(|| async { "Hello world" }))
            .layer(axum::middleware::from_fn_with_state(state, auth_middleware));

        let request = Request::builder().uri("/").body(Body::empty()).unwrap();

        let response = router.call(request).await.unwrap();

        assert_eq!(response.status(), StatusCode::UNAUTHORIZED);
    }

    #[tokio::test]
    async fn invalid_header() {
        let state = AppState::new().await.unwrap();
        let mut router = Router::new()
            .route("/", get(|| async { "Hello world" }))
            .layer(axum::middleware::from_fn_with_state(state, auth_middleware));

        let request = Request::builder()
            .header("Authorization", "Bearer kdksdoks")
            .uri("/")
            .body(Body::empty())
            .unwrap();

        let response = router.call(request).await.unwrap();

        assert_eq!(response.status(), StatusCode::FORBIDDEN);
    }
}
