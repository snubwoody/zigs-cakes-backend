use axum::{Json, extract::State};
use axum_extra::extract::CookieJar;
use cookie::Cookie;
use server_core::{AppState, api::v1::cart::*};
use uuid::Uuid;

#[sqlx::test(migrations = "../migrations")]
async fn fetching_from_the_right_cart(pool: sqlx::PgPool) {
    let app_state = AppState::with_pool(pool).await.unwrap();
    let id = Uuid::new_v4();
    let cookies = CookieJar::new().add(Cookie::new("cart", id.to_string()));

    sqlx::query!("INSERT INTO public.cart VALUES($1)", id)
        .execute(app_state.pool())
        .await
        .unwrap();

    sqlx::query!(
        "
		INSERT INTO public.cart 
		SELECT uuid_generate_v4() 
		FROM generate_series(1,50)"
    )
    .execute(app_state.pool())
    .await
    .unwrap();

    let cake = AddToCartPayload {
        flavour_id: 1,
        size_id: 1,
        message: None,
        message_type: None,
        additional_instructions: None,
        quantity: 1,
    };

    let state = State(app_state);
    let payload = Json(cake);

    add_to_cart(state.clone(), cookies.clone(), payload.clone())
        .await
        .unwrap();

    add_to_cart(state.clone(), cookies.clone(), payload.clone())
        .await
        .unwrap();

    let false_id = Uuid::new_v4();
    let cookies = CookieJar::new().add(Cookie::new("cart", false_id.to_string()));

    let cart_items = get_cart_items(state, cookies).await.unwrap();

    assert!(cart_items.0.is_empty());
}

#[sqlx::test(migrations = "../migrations")]
async fn invalid_cart_type_resets(pool: sqlx::PgPool) {
    let app_state = AppState::with_pool(pool).await.unwrap();
    let state = State(app_state);

    let cookies = CookieJar::new().add(Cookie::new("cart", "1"));

    let (cookies, _) = create_cart(state.clone(), cookies).await.unwrap();

    let cart_cookie = cookies.get("cart").unwrap().value();

    let cart_id = Uuid::parse_str(cart_cookie).unwrap();

    sqlx::query!("SELECT * FROM cart WHERE id=$1", cart_id)
        .fetch_one(state.0.pool())
        .await
        .unwrap();
}

#[sqlx::test(migrations = "../migrations")]
async fn missing_cart_id_resets(pool: sqlx::PgPool) {
    let app_state = AppState::with_pool(pool).await.unwrap();
    let state = State(app_state);
    let false_id = Uuid::new_v4();

    let cookies = CookieJar::new().add(Cookie::new("cart", false_id.to_string()));

    let (cookies, _) = create_cart(state.clone(), cookies).await.unwrap();

    let cart_cookie = cookies.get("cart").unwrap().value();

    let cart_id = Uuid::parse_str(cart_cookie).unwrap();

    sqlx::query!("SELECT * FROM cart WHERE id=$1", cart_id)
        .fetch_one(state.0.pool())
        .await
        .unwrap();
}

#[sqlx::test(migrations = "../migrations")]
async fn reusing_cart_cookie(pool: sqlx::PgPool) {
    let app_state = AppState::with_pool(pool).await.unwrap();
    let state = State(app_state);
    let cart_id = Uuid::new_v4();

    sqlx::query!("INSERT INTO cart VALUES ($1)", &cart_id)
        .execute(state.0.pool())
        .await
        .unwrap();

    let cookies = CookieJar::new().add(Cookie::new("cart", cart_id.to_string()));

    let (cookies, _) = create_cart(state.clone(), cookies).await.unwrap();

    let cart_cookie = cookies.get("cart").unwrap().value();

    assert_eq!(cart_id, Uuid::parse_str(cart_cookie).unwrap());
}

// #[sqlx::test]
// async fn init_cart(pool: sqlx::Pool){
// 	let app_state = AppState::with_pool(pool).await.unwrap();
// 	let state = State(app_state);
// 	let cart_id = Uuid::new_v4();

// 	let cookies = CookieJar::new()
// 		.add(Cookie::new("cart", cart_id.to_string()));

// 	create_cart(state, jar)
// }
