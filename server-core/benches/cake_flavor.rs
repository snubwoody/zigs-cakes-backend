use criterion::{Criterion, criterion_group, criterion_main};
use server_core::AppState;
use tokio::runtime::Runtime;
use tokio_postgres::NoTls;

async fn state() -> AppState {
    let _ = dotenv::dotenv();
    AppState::new().await.unwrap()
}

fn sqlx_bench(c: &mut Criterion) {
    c.bench_function("sqlx", |b| {
        let rt = Runtime::new().unwrap();
        let state = rt.block_on(state());

        b.to_async(rt).iter(|| async {
            sqlx::query("SELECT * FROM cake_sizes")
                .fetch_all(state.pool())
                .await
                .unwrap();
        })
    });
}

fn postgres_bench(c: &mut Criterion) {
    let _ = dotenv::dotenv();

    c.bench_function("tokio postgres", |b| {
        let rt = Runtime::new().unwrap();

        let connection_string = dotenv::var("DATABASE_URL").unwrap();

        let (client, connection) = rt.block_on(async {
            tokio_postgres::connect(&connection_string, NoTls)
                .await
                .unwrap()
        });

        rt.spawn(connection);

        b.to_async(rt).iter(|| async {
            client.query("SELECT * FROM cake_sizes", &[]).await.unwrap();
        })
    });
}

criterion_group!(benches, sqlx_bench, postgres_bench);
criterion_main!(benches);
