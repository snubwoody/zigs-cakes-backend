-- Add migration script here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create a temporary column to store UUID values
ALTER TABLE public.cart
ADD COLUMN id_temp UUID DEFAULT uuid_generate_v4();

-- Copy data from the old integer id to the new temporary column
UPDATE public.cart
SET id_temp = uuid_generate_v4();

-- Drop the columns of dependants
ALTER TABLE public.orders
DROP COLUMN cart;

ALTER TABLE public.cakes
DROP COLUMN cart;

DROP TABLE public.cart_items;
ALTER TABLE public.users
DROP COLUMN cart;

-- Drop the old `id` column
ALTER TABLE public.cart
DROP COLUMN id;

-- Rename the temporary UUID column to `id`
ALTER TABLE public.cart
RENAME COLUMN id_temp TO id;

-- Set the `id` column to be the primary key
ALTER TABLE public.cart
ADD PRIMARY KEY (id);

-- Add dependants back
ALTER TABLE public.cakes
ADD COLUMN cart UUID NOT NULL REFERENCES cart(id);

ALTER TABLE public.orders
ADD COLUMN cart UUID NOT NULL REFERENCES cart(id);



