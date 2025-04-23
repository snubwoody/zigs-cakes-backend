mod error;
use clap::{Parser, Subcommand, command};
use server_core::{
    auth::{Claims, encode_jwt},
    db::{Profile, Role},
};
use sqlx::{PgPool, migrate::Migrator};
use std::{str::FromStr, time::Duration};
use uuid::Uuid;
pub use {error::CliError, error::Result};

static MIGRATOR: Migrator = sqlx::migrate!("../migrations");

#[derive(Parser)]
#[command(version, about = "Internal tooling")]
struct Cli {
    #[arg(short, long)]
    database_url: Option<String>,
    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// Database controls
    Db {
        #[command(subcommand)]
        command: DbCommands,
    },
    /// Encode a JWT string
    Encode {
        #[arg(short, long)]
        input: String,
        #[arg(short, long)]
        key: String,
    },
}

#[derive(Subcommand, Debug)]
enum DbCommands {
    /// Setup and edit the database
    Setup,
    /// Create a test user in the database and print their
    /// id to stdout
    CreateUser {
        /// Give the user admin access
        #[arg(short, long)]
        admin: bool,
    },
}

#[tokio::main]
async fn main() -> Result<()> {
    let _ = dotenv::dotenv();
    let cli = Cli::parse();

    let database_url = match cli.database_url {
        Some(url) => url.clone(),
        None => std::env::var("DATABASE_URL").expect("Database url not set"),
    };

    let pool: PgPool = sqlx::pool::PoolOptions::new()
        .max_connections(10)
        .acquire_timeout(Duration::from_secs(20))
        .connect(&database_url)
        .await?;

    match &cli.command {
        Commands::Db { command } => match command {
            DbCommands::Setup => MIGRATOR.run(&pool).await?,
            DbCommands::CreateUser { .. } => create_user(&pool).await?,
        },
        Commands::Encode { input, key } => {
            let claims = Claims {
                sub: Uuid::from_str(input)?,
                ..Default::default()
            };

            let jwt = encode_jwt(claims, key)?;
            println!("{jwt}");
        }
    }
    Ok(())
}

async fn create_user(pool: &PgPool) -> Result<()> {
    let role = sqlx::query_as!(Role, "SELECT * FROM roles WHERE label='admin'")
        .fetch_one(pool)
        .await?;

    let user = sqlx::query_as!(
        Profile,
        "INSERT INTO profiles(id) VALUES(uuid_generate_v4()) RETURNING *"
    )
    .fetch_one(pool)
    .await?;

    sqlx::query!(
        "INSERT INTO user_roles(uid,role) VALUES($1,$2)",
        &user.id,
        &role.id
    )
    .execute(pool)
    .await?;

    println!("{}", user.id);
    Ok(())
}
