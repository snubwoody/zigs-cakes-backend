use axum::{Json, http::StatusCode, response::IntoResponse};
use serde::{Deserialize, Serialize};
use serde_json::json;
use std::io;
use thiserror::Error;
use utoipa::ToSchema;

pub type Result<T> = std::result::Result<T, Error>;

#[derive(Debug, Error)]
pub enum Error {
    /// A resource was not found at it's expected location
    #[error("{0} not found")]
    NotFound(String),

    /// Generic request error
    #[error("{title:?}")]
    RequestError {
        title: String,
        details: String,
        code: StatusCode,
    },

    /* Third party wrappers */
    #[error(transparent)]
    IoError(#[from] io::Error),
    #[error(transparent)]
    SqlxError(sqlx::Error),
    #[error(transparent)]
    JwtError(#[from] jsonwebtoken::errors::Error),
}

#[derive(Debug, ToSchema, Serialize, Deserialize)]
pub struct ErrorResponse {
    pub title: String,
    pub details: String,
    pub code: u16,
}

impl From<sqlx::Error> for Error {
    fn from(error: sqlx::Error) -> Self {
        match error {
            sqlx::Error::RowNotFound => Self::not_found("Row"),
            _ => Self::SqlxError(error),
        }
    }
}

impl Error {
    pub fn not_found(resource: &str) -> Self {
        Self::NotFound(String::from(resource))
    }

    pub fn request(title: &str, details: &str, code: StatusCode) -> Self {
        Self::RequestError {
            title: String::from(title),
            details: String::from(details),
            code,
        }
    }

    pub fn internal() -> Self {
        Self::RequestError {
            title: String::from("An unknown server error occured"),
            details: String::from(""),
            code: StatusCode::INTERNAL_SERVER_ERROR,
        }
    }
}

impl IntoResponse for Error {
    fn into_response(self) -> axum::response::Response {
        match self {
            Self::RequestError {
                code,
                title,
                details,
            } => {
                let body = json!({
                    "title":title,
                    "details":details,
                    "code":code.as_u16(),
                });

                (code, Json(body)).into_response()
            }
            err => {
                let body = json!({
                    "title":"An unknown server error occured",
                    "details": "",
                    "code": StatusCode::INTERNAL_SERVER_ERROR.as_u16()
                });
                log::error!("{}", err);
                (StatusCode::INTERNAL_SERVER_ERROR, Json(body)).into_response()
            }
        }
    }
}
