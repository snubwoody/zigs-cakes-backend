use std::io;
use thiserror::Error;

pub type Result<T> = std::result::Result<T, CliError>;

#[derive(Debug, Error)]
pub enum CliError {
    /// Failed to execute the command
    #[error("Execution failed: {0}")]
    ExecutionFailed(String),

    #[error(transparent)]
    IoError(#[from] io::Error),
    #[error(transparent)]
    CoreError(#[from] server_core::Error),
    #[error(transparent)]
    SqlxError(#[from] sqlx::Error),
    #[error(transparent)]
    UuidError(#[from] uuid::Error),
    #[error(transparent)]
    MigrateError(#[from] sqlx::migrate::MigrateError),
}

impl CliError {
    pub fn execution_failed(message: &str) -> Self {
        Self::ExecutionFailed(message.to_string())
    }
}
