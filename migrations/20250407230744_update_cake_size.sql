-- Add migration script here
ALTER TABLE cake_sizes
ALTER COLUMN currency_code SET DEFAULT 'ZMW';