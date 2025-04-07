//! Contains all the types for the database
use chrono::{DateTime, Utc};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use sqlx::{Postgres, prelude::FromRow};
use utoipa::ToSchema;
use uuid::Uuid;

#[derive(Debug, Serialize, Deserialize, Clone, ToSchema)]
pub struct OrderRow {
    pub id: i32,
    pub ordered_on: DateTime<Utc>,
    pub pick_up: DateTime<Utc>,
    pub name: String,
    pub email: String,
    pub status: String,
    pub phone_number: String,
    pub cart: Uuid,
    pub price: Decimal,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Eq)]
pub struct CartRow {
    pub id: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Eq)]
pub struct CartItemsRow {
    pub id: i32,
    pub cart_id: i32,
    pub cake_id: i32,
    pub quantity: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, Eq, FromRow)]
pub struct CakeRow {
    pub id: i32,
    pub flavour_id: i32,
    pub size_id: i32,
    pub message: Option<String>,
    pub message_type: Option<String>,
    pub additional_instructions: Option<String>,
    pub cart: Uuid,
    pub quantity: i32,
}

impl CakeRow {
    /// Build in [`Cake`] by fetching foreign keys
    pub async fn build(self, pool: &sqlx::Pool<Postgres>) -> crate::Result<Cake> {
        let (flavor, size) = tokio::try_join!(
            sqlx::query_as!(
                CakeFlavor,
                "SELECT * FROM cake_flavors WHERE id = $1",
                self.flavour_id
            )
            .fetch_one(pool),
            sqlx::query_as!(
                CakeSize,
                "SELECT * FROM cake_sizes WHERE id = $1",
                self.size_id
            )
            .fetch_one(pool)
        )?;

        Ok(Cake::new(&self, flavor, size))
    }
}

/// An expanded version of [`OrderRow`]
#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Order {
    pub id: i32,
    pub ordered_on: DateTime<Utc>,
    pub pick_up: DateTime<Utc>,
    pub name: String,
    pub email: String,
    pub status: String,
    pub phone_number: String,
    pub cart_items: Cart,
}

impl Order {
    pub fn new(row: OrderRow, cart: Cart) -> Self {
        let OrderRow {
            id,
            ordered_on,
            pick_up,
            phone_number,
            name,
            email,
            status,
            ..
        } = row;

        Self {
            id,
            ordered_on,
            pick_up,
            name,
            email,
            status,
            phone_number,
            cart_items: cart,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, PartialEq, Clone, FromRow)]
pub struct Cart {
    pub id: Uuid,
    pub user_id: Option<Uuid>,
}

#[derive(Debug, Serialize, Deserialize, PartialEq, Clone, ToSchema)]
pub struct Cake {
    pub id: i32,
    pub flavor: CakeFlavor,
    pub size: CakeSize,
    pub message: Option<String>,
    pub message_type: Option<String>,
    pub additional_instructions: Option<String>,
    pub cart_id: Uuid,
    pub quantity: i32,
}

impl Cake {
    pub fn new(row: &CakeRow, flavor: CakeFlavor, size: CakeSize) -> Self {
        Self {
            id: row.id,
            flavor,
            size,
            message: row.message.clone(),
            message_type: row.message_type.clone(),
            additional_instructions: row.additional_instructions.clone(),
            cart_id: row.cart,
            quantity: row.quantity,
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, FromRow, ToSchema)]
pub struct CakeSize {
    pub id: i32,
    pub label: String,
    pub inches: i32,
    pub price: Decimal,
    pub currency_code: String,
    pub layers: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, FromRow, ToSchema)]
pub struct CakeFlavor {
    pub id: i32,
    pub name: String, // TODO Change this to not be null
    pub price: Decimal,
    pub currency_code: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct UserRole {
    pub id: i32,
    pub uid: uuid::Uuid,
    pub role: i32,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq)]
pub struct Role {
    pub id: i32,
    pub label: String,
}

#[derive(Debug, Serialize, Deserialize, Clone, PartialEq, FromRow)]
pub struct Profile {
    pub id: Uuid,
    pub active_cart: Option<Uuid>,
}
