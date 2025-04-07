
FROM rust:1.85-bullseye AS builder

WORKDIR /usr/src/app

COPY . .

# Needed for sqlx compile time queries
ARG DATABASE_URL
ARG SUPABASE_JWT_SECRET
ENV DATABASE_URL=${DATABASE_URL}
ENV SUPABASE_JWT_SECRET=${SUPABASE_JWT_SECRET}

RUN cargo build --release

FROM debian:bullseye AS runner

WORKDIR /app

COPY --from=builder /usr/src/app/target/release/server /usr/bin/server

ARG DATABASE_URL
ENV DATABASE_URL=${DATABASE_URL}

ENTRYPOINT [ "/usr/bin/server" ]
