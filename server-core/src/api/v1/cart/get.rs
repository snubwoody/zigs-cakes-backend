use crate::db::{Cake, CakeFlavor, CakeSize, Cart};
use crate::{AppState, Error};
use axum::Json;
use axum::extract::State;
use axum::http::StatusCode;
use axum_extra::extract::CookieJar;
use cookie::Cookie;
use uuid::Uuid;

/// Initialise the users
pub async fn init_cart(pool: &sqlx::PgPool, cookies: CookieJar) -> crate::Result<CookieJar> {
    let cart = sqlx::query_as!(Cart, "INSERT INTO cart VALUES (DEFAULT) RETURNING *")
        .fetch_one(pool)
        .await?;

    let cookie = Cookie::build(("cart", format!("{}", cart.id)))
        .path("/")
        .same_site(cookie::SameSite::None)
        .max_age(time::Duration::days(7));

    if cfg!(debug_assertions) {
        return Ok(cookies.add(cookie));
    }

    Ok(cookies.add(cookie.secure(true)))
}

#[deprecated]
pub async fn create_cart(
    State(state): State<AppState>,
    jar: CookieJar,
) -> crate::Result<(CookieJar, &'static str)> {
    if let Some(cookie) = jar.get("cart") {
        match Uuid::parse_str(cookie.value()) {
            Ok(cart_id) => {
                let cart = sqlx::query!("SELECT id FROM CART WHERE id=$1", cart_id)
                    .fetch_one(state.pool())
                    .await;
                if let Err(err) = cart {
                    match err {
                        sqlx::Error::RowNotFound => {
                            tracing::warn!(
                                message = "Cart is a valid uuid but row not found...resetting cart",
                                err = format!("{}", err)
                            )
                        }
                        err => {
                            tracing::error!(
                                message = "Unknown error occured while fetching cart",
                                err = format!("{}", err)
                            )
                        }
                    }
                } else {
                    tracing::debug!("Re-using existing cart");
                    return Ok((jar, "Re-using cart cookie"));
                }
            }
            Err(err) => {
                tracing::warn!(
                    message = format!("Failed to parse cookie...reseting cookie"),
                    error = format!("{}", err)
                );
            }
        }
    }

    let cookies = init_cart(state.pool(), jar).await?;

    tracing::debug!("Created new cart");
    Ok((cookies, "Created new cart"))
}

/// Fetch the items from the cart
pub async fn get_cart_items(
    State(state): State<AppState>,
    cookies: CookieJar,
) -> crate::Result<Json<Vec<Cake>>> {
    let cart_cookie = cookies
        .get("cart")
        .ok_or_else(|| {
            log::warn!("Missing cart cookie");
            Error::request(
                "Cart not found",
                "Missing cart cookie in request",
                StatusCode::BAD_REQUEST,
            )
        })?
        .value();

    let cart_id = Uuid::parse_str(cart_cookie).map_err(|err| {
        log::error!("Failed to parse cookie: {}, error: {}", cart_cookie, &err);
        Error::request(
            "Failed to parse cart cookie",
            &format!("{}", err),
            StatusCode::INTERNAL_SERVER_ERROR,
        )
    })?;

    let results = sqlx::query!(
        "
		SELECT 
			cake.id,
			cake.flavour_id,
			cake.size_id,
			cake.message,
			cake.message_type,
			cake.cart,
			cake.additional_instructions,
			cake.quantity,

			flavor.id as cake_flavor_id,
			flavor.name as flavor_name,
			flavor.price as flavor_price,
			flavor.currency_code as flavor_currency_code,
			
			size.id as cake_size_id,
			size.label as size_label,
			size.inches as size_inches,
			size.price as size_price,
			size.layers as size_layers,
			size.currency_code as size_currency_code
			
		FROM cakes cake
		JOIN cake_flavors flavor
		ON flavor.id = cake.flavour_id
		JOIN cake_sizes size
		ON size.id = cake.size_id
		WHERE cake.cart = $1
		",
        cart_id
    )
    .fetch_all(state.pool())
    .await?;

    let cart_items: Vec<Cake> = results
        .iter()
        .map(|record| {
            let flavor = CakeFlavor {
                id: record.flavour_id,
                name: record.flavor_name.clone(),
                price: record.flavor_price,
                currency_code: record.flavor_currency_code.clone(),
            };

            let size = CakeSize {
                id: record.size_id,
                label: record.size_label.clone(),
                inches: record.size_inches,
                price: record.size_price,
                currency_code: record.size_currency_code.clone(),
                layers: record.size_layers,
            };

            Cake {
                id: record.id,
                flavor,
                size,
                message: record.message.clone(),
                message_type: record.message_type.clone(),
                additional_instructions: record.additional_instructions.clone(),
                cart_id: record.cart,
                quantity: record.quantity,
            }
        })
        .collect();

    Ok(Json(cart_items))
}
