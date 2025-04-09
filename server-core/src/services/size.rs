//! Contains all the services that deal with the `cake_sizes` table in the
//! database
use crate::Result;
use crate::{AppState, Error, db::CakeSize};
use rust_decimal::Decimal;
use serde::{Deserialize, Serialize};
use utoipa::ToSchema;

/// Describes the details when updating a size.
///
/// Only fields that are not left out will be updated, the rest will
/// be kept as is.
#[derive(Serialize, Deserialize, ToSchema, Default)]
#[serde(default)]
pub struct UpdateSizeDesc {
    pub inches: Option<i32>,
    pub layers: Option<i32>,
    pub price: Option<Decimal>,
}

pub struct SizeService {
    state: AppState,
}

impl SizeService {
    pub fn new(state: AppState) -> Self {
        Self { state }
    }

    /// Get a [`CakeSize`]
    pub async fn get(&self, id: i32) -> Result<Option<CakeSize>> {
        let pool = self.state.pool();
        let size: Option<CakeSize> = sqlx::query_as("SELECT * FROM cake_sizes WHERE id=$1")
            .bind(id)
            .fetch_optional(pool)
            .await?;

        Ok(size)
    }

    /// Create a new [`CakeSize`]
    pub async fn create(&self, inches: i32, layers: i32, price: Decimal) -> Result<CakeSize> {
        let pool = self.state.pool();

        let size = sqlx::query_as::<_, CakeSize>(
            "
			INSERT INTO cake_sizes(inches,layers,price,label) 
			VALUES($1,$2,$3,'TODO: Remove column') 
			RETURNING *
			",
        )
        .bind(inches)
        .bind(layers)
        .bind(price)
        .fetch_one(pool)
        .await?;

        Ok(size)
    }

    /// Update a [`CakeSize`]
    pub async fn update(&self, id: i32, desc: UpdateSizeDesc) -> Result<()> {
        let mut size = self
            .get(id)
            .await?
            .ok_or(Error::NotFound(format!("cake_size at {id}")))?;

        if let Some(inches) = desc.inches {
            size.inches = inches
        }

        if let Some(layers) = desc.layers {
            size.layers = layers
        }

        if let Some(price) = desc.price {
            size.price = price
        }

        let CakeSize {
            inches,
            price,
            layers,
            ..
        } = size;
        let pool = self.state.pool();

        sqlx::query(
            "
			UPDATE cake_sizes 
			SET inches = $1, layers = $2, price = $3 
			WHERE id = $4
			",
        )
        .bind(inches)
        .bind(layers)
        .bind(price)
        .bind(id)
        .execute(pool)
        .await?;

        Ok(())
    }

    /// Delete a [`CakeSize`]
    pub async fn delete(&self, id: i32) -> Result<()> {
        let pool = self.state.pool();

        sqlx::query("DELETE FROM cake_sizes WHERE id = $1")
            .bind(id)
            .execute(pool)
            .await?;

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[sqlx::test(migrations = "../migrations")]
    async fn get_cake_size(pool: sqlx::PgPool) -> Result<()> {
        let state = AppState::with_pool(pool).await?;
        let sizes = SizeService::new(state);
        let new_size = sizes.create(10, 10, Decimal::new(350, 2)).await?;
        let size = sizes.get(new_size.id).await?.unwrap();

        assert_eq!(new_size, size);
        Ok(())
    }

    #[sqlx::test(migrations = "../migrations")]
    async fn update_cake_size(pool: sqlx::PgPool) -> Result<()> {
        let state = AppState::with_pool(pool).await?;
        let sizes = SizeService::new(state);
        let new_size = sizes.create(10, 10, Decimal::new(350, 2)).await?;
        let size = sizes.get(new_size.id).await?.unwrap();

        let desc = UpdateSizeDesc {
            inches: Some(25),
            ..Default::default()
        };
        sizes.update(size.id, desc).await?;
        let size = sizes.get(new_size.id).await?.unwrap();

        assert_eq!(size.inches, 25);
        assert_eq!(size.layers, 10);

        Ok(())
    }
}
