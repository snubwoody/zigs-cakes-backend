-- Add migration script here
ALTER TABLE public.cart
ADD COLUMN user_id uuid NOT NULL REFERENCES users(id);
