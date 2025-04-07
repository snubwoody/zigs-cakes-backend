use axum::{Json, extract::State};
use axum_extra::extract::CookieJar;
use cookie::Cookie;
use dotenv::dotenv;
use server_core::{
    AppState,
    api::{
        v1::cart::{AddToCartPayload, add_to_cart},
        v1::orders::{OrderPayload, post_order},
    },
    db::CakeSize,
};
use uuid::Uuid;

#[sqlx::test(migrations = "../migrations")]
async fn cookie_deleted_after_order(pool: sqlx::PgPool) {
    let _ = dotenv();
    let app_state = AppState::with_pool(pool).await.unwrap();
    let id = Uuid::new_v4();
    let cookies = CookieJar::new().add(Cookie::new("cart", id.to_string()));
    let payload = OrderPayload::default();

    sqlx::query!("INSERT INTO public.cart VALUES ($1)", id)
        .execute(app_state.pool())
        .await
        .unwrap();

    let (_, cookies, _) = post_order(State(app_state), cookies, Json(payload))
        .await
        .unwrap();

    assert_eq!(cookies.get("cart"), None);
}

#[sqlx::test(migrations = "../migrations")]
async fn order_has_correct_price(pool: sqlx::PgPool) {
    let _ = dotenv();
    let app_state = AppState::with_pool(pool).await.unwrap();
    let state = State(app_state);
    let id = Uuid::new_v4();
    let cookies = CookieJar::new().add(Cookie::new("cart", id.to_string()));

    sqlx::query!("INSERT INTO public.cart VALUES ($1)", id)
        .execute(state.pool())
        .await
        .unwrap();

    let size = sqlx::query_as::<_, CakeSize>("SELECT * FROM public.cake_sizes LIMIT 1")
        .fetch_one(state.pool())
        .await
        .unwrap();

    let payload = AddToCartPayload {
        flavour_id: 2,
        size_id: size.id,
        message: None,
        message_type: None,
        additional_instructions: None,
        quantity: 10,
    };

    add_to_cart(state.clone(), cookies.clone(), Json(payload))
        .await
        .unwrap();

    let payload = OrderPayload::default();
    let (_, _, order) = post_order(state.clone(), cookies, Json(payload))
        .await
        .unwrap();

    assert_eq!(order.price, size.price);
}
