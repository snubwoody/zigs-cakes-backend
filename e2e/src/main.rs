use server_core::Error;

#[tokio::main]
async fn main() -> Result<(), Error> {
    reqwest::get("http://localhost:9000/active").await?;

    Ok(())
}
