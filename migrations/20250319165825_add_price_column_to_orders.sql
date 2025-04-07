-- Add migration script here
ALTER TABLE public.orders
ADD COLUMN price NUMERIC(10,2) NOT NULL;