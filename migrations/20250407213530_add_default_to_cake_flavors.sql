-- Add migration script here
ALTER TABLE cake_flavors
ALTER COLUMN currency_code SET DEFAULT 'ZMW',
ALTER COLUMN price SET DEFAULT 0.00;