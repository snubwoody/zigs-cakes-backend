pub mod v1;
pub mod v2;
use crate::auth::{Claims, get_auth};
use axum::http::HeaderMap;

pub trait HttpExt {
    /// Get the user auth token
    fn get_jwt(&self, jwt_secret: &str) -> crate::Result<Claims>;
}

impl HttpExt for HeaderMap {
    fn get_jwt(&self, jwt_secret: &str) -> crate::Result<Claims> {
        get_auth(jwt_secret, self)
    }
}
