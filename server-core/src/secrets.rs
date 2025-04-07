use crate::Error;
use std::env;

#[derive(Clone)]
pub struct SecretManager {}

impl Default for SecretManager {
    fn default() -> Self {
        Self::new()
    }
}

impl SecretManager {
    pub fn new() -> Self {
        Self {}
    }

    /// Get a secret
    pub fn get(&self, secret: &str) -> crate::Result<String> {
        env::var(secret).map_err(|_| Error::not_found(secret))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn get_secrets() {
        unsafe { env::set_var("API_KEY", "ABCD") };

        let secrets = SecretManager::new();

        assert!(secrets.get("API_KEY").is_ok());
        assert!(secrets.get("URL").is_err());
    }
}
