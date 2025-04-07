use crate::secrets::SecretManager;
use sqlx::{Postgres, postgres::PgPoolOptions};

#[derive(Clone)]
pub struct AppState {
    pool: sqlx::PgPool,
    jwt_secret: String,
    secrets: SecretManager,
}

impl AppState {
    pub async fn new() -> crate::Result<Self> {
        let secrets = SecretManager::new();
        let database_url = secrets.get("DATABASE_URL")?;
        let jwt_secret = secrets.get("SUPABASE_JWT_SECRET")?;

        let pool = PgPoolOptions::new()
            .max_connections(5)
            .connect(&database_url)
            .await?;

        Ok(Self {
            pool,
            secrets,
            jwt_secret,
        })
    }

    /// Create a new [`AppState`] through passing an already made connection pool
    pub async fn with_pool(pool: sqlx::PgPool) -> crate::Result<Self> {
        let secrets = SecretManager::new();
        let jwt_secret = secrets.get("SUPABASE_JWT_SECRET")?;

        Ok(Self {
            pool,
            secrets,
            jwt_secret,
        })
    }

    pub fn pool(&self) -> &sqlx::Pool<Postgres> {
        &self.pool
    }

    pub fn secrets(&self) -> &SecretManager {
        &self.secrets
    }

    pub fn jwt_secret(&self) -> &str {
        &self.jwt_secret
    }
}
