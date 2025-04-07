use crate::db::{Cake, CakeRow, OrderRow};
use crate::{AppState, Error};
use axum::Json;
use axum::extract::{Path, Query, State};
use axum::http::StatusCode;
use axum_extra::extract::CookieJar;
use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use tracing::error;
use uuid::Uuid;

type PostOrderResponse = crate::Result<(StatusCode, CookieJar, Json<OrderRow>)>;

#[derive(Debug, Serialize, Deserialize, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
#[serde(rename_all = "lowercase")]
pub enum UpdateOrderStatus {
    Pending,
    Completed,
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum OrderStatus {
    All,
    Pending,
    Completed,
}

#[derive(Debug, Serialize, Deserialize)]
pub struct Filter {
    status: OrderStatus,
}

#[derive(Serialize, Deserialize, Default)]
pub struct OrderPayload {
    name: String,
    email: String,
    phone_number: String,
    pick_up: DateTime<Utc>,
    status: String,
}

/// Get an order by it's id `/admin/order/{id}`.
pub async fn fetch_order(
    State(state): State<AppState>,
    Path(id): Path<i32>,
) -> crate::Result<Json<OrderRow>> {
    let order = sqlx::query_as!(OrderRow, "SELECT * FROM orders WHERE id = $1", id)
        .fetch_one(state.pool())
        .await?;

    Ok(Json(order))
}

// FIXME just use joins
/// Get all the cakes in a cart id `/admin/cart/{id}/items`.
pub async fn fetch_cakes(
    State(state): State<AppState>,
    Path(cart_id): Path<uuid::Uuid>,
) -> crate::Result<Json<Vec<Cake>>> {
    let cake_rows = sqlx::query_as!(CakeRow, "SELECT * FROM cakes WHERE cart = $1", cart_id)
        .fetch_all(state.pool())
        .await?;

    let mut cakes = vec![];
    for cake in cake_rows {
        let c = cake.build(state.pool()).await?;
        cakes.push(c);
    }

    Ok(Json(cakes))
}

/// Get the orders from the database `/admin/orders`.
///
/// Orders can be filtered through status their [`OrderStatus`] by using
/// a query param e.g. `/admin/orders?status=pending`.
pub async fn get_orders(
    State(state): State<AppState>,
    filter: Query<Filter>,
) -> crate::Result<Json<Vec<OrderRow>>> {
    let orders = match filter.status {
        OrderStatus::All => {
            sqlx::query_as!(OrderRow, "SELECT * FROM orders")
                .fetch_all(state.pool())
                .await?
        }
        OrderStatus::Pending => {
            sqlx::query_as!(
                OrderRow,
                "SELECT * FROM orders WHERE status = $1",
                "Pending"
            )
            .fetch_all(state.pool())
            .await?
        }
        OrderStatus::Completed => {
            sqlx::query_as!(
                OrderRow,
                "SELECT * FROM orders WHERE status = $1",
                "Completed"
            )
            .fetch_all(state.pool())
            .await?
        }
    };

    Ok(Json(orders))
}

/// Update the order status `admin/v./order/{id}/status/{status}` and return the
/// order if successful
pub async fn update_order_status(
    Path((id, status)): Path<(i32, UpdateOrderStatus)>,
    State(state): State<AppState>,
) -> crate::Result<StatusCode> {
    match status {
        UpdateOrderStatus::Completed => {
            sqlx::query!(
                "UPDATE orders SET status = $1 WHERE id = $2",
                "Completed",
                id
            )
            .fetch_one(state.pool())
            .await?
        }
        UpdateOrderStatus::Pending => {
            sqlx::query!("UPDATE orders SET status = $1 WHERE id = $2", "Pending", id)
                .fetch_one(state.pool())
                .await?
        }
    };

    Ok(StatusCode::OK)
}

#[axum::debug_handler]
pub async fn post_order(
    State(state): State<AppState>,
    cookies: CookieJar,
    Json(payload): Json<OrderPayload>,
) -> PostOrderResponse {
    let cart = cookies
        .get("cart")
        .ok_or_else(|| Error::request("Cart cookie missing", "", StatusCode::BAD_REQUEST))?;

    let cart_id = Uuid::parse_str(cart.value()).map_err(|err| {
        log::error!("{}", &err);
        Error::request(
            "Invalid cart id",
            &format!("{}", err),
            StatusCode::INTERNAL_SERVER_ERROR,
        )
    })?;

    let result = sqlx::query_as!(
        OrderRow,
        "
		INSERT INTO orders
		(pick_up,name,email,status,phone_number,cart)
		VALUES ($1,$2,$3,$4,$5,$6)
		RETURNING *
		",
        payload.pick_up,
        payload.name,
        payload.email,
        payload.status,
        payload.phone_number,
        cart_id,
    )
    .fetch_one(state.pool())
    .await;

    match result {
        Ok(order) => {
            let cookies = cookies.remove("cart");
            Ok((StatusCode::CREATED, cookies, Json(order)))
        }
        Err(err) => {
            error!("{}", &err);
            Err(Error::request(
                "Unknown server error",
                "",
                StatusCode::INTERNAL_SERVER_ERROR,
            ))
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use axum::extract::State;
    use cookie::Cookie;
    use dotenv::dotenv;
    use uuid::Uuid;

    #[tokio::test]
    async fn set_order_status_fails_if_missing_order() {
        let _ = dotenv::dotenv();

        let id = Path((999999999, UpdateOrderStatus::Completed));
        let app_state = AppState::new().await.unwrap();
        let state = State(app_state);

        let response = update_order_status(id, state).await;
        dbg!(&response);
        assert!(matches!(response, Err(crate::Error::NotFound(_))));
    }

    #[tokio::test]
    async fn get_all_orders() {
        let _ = dotenv::dotenv();
        let app_state = AppState::new().await.unwrap();

        let state = State(app_state);
        let params = Query(Filter {
            status: OrderStatus::All,
        });

        let _ = get_orders(state, params).await.unwrap();
    }

    #[tokio::test]
    async fn get_pending_orders() {
        let _ = dotenv::dotenv();
        let app_state = AppState::new().await.unwrap();

        let state = State(app_state);
        let params = Query(Filter {
            status: OrderStatus::Pending,
        });

        let orders = get_orders(state, params).await.unwrap();

        for order in orders.iter() {
            assert_ne!(order.status, "Completed")
        }
    }

    #[tokio::test]
    async fn get_completed_orders() {
        let _ = dotenv::dotenv();
        let app_state = AppState::new().await.unwrap();

        let state = State(app_state);
        let params = Query(Filter {
            status: OrderStatus::Completed,
        });

        let orders = get_orders(state, params).await.unwrap();

        for order in orders.iter() {
            assert_ne!(order.status, "Pending")
        }
    }

    #[sqlx::test(migrations = "../migrations")]
    async fn order_cake(pool: sqlx::PgPool) {
        let _ = dotenv();
        let app_state = AppState::with_pool(pool).await.unwrap();
        let id = Uuid::new_v4();
        let cookies = CookieJar::new().add(Cookie::new("cart", id.to_string()));
        let payload = OrderPayload::default();

        sqlx::query!("INSERT INTO public.cart VALUES ($1)", id)
            .execute(app_state.pool())
            .await
            .unwrap();

        let (_, _, order) = post_order(State(app_state), cookies, Json(payload))
            .await
            .unwrap();

        assert_eq!(order.cart, id);
    }

    #[sqlx::test]
    #[should_panic]
    async fn missing_cart_when_ordering(pool: sqlx::PgPool) {
        let _ = dotenv();
        let app_state = AppState::with_pool(pool).await.unwrap();
        let cookies = CookieJar::new().add(Cookie::new("cart", "5"));
        let payload = OrderPayload::default();

        post_order(State(app_state), cookies, Json(payload))
            .await
            .unwrap();
    }
}
