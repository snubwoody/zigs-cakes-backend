-- Add migration script here
CREATE TABLE public.cake_flavors (
	id serial NOT NULL primary key,
	price numeric(10, 2) NOT NULL,
	currency_code text NOT NULL,
	name text NULL
);

CREATE TABLE public.cake_sizes (
	id serial NOT NULL PRIMARY KEY,
	price numeric(10, 2) NOT NULL,
	currency_code text NOT NULL,
	inches integer NULL,
	layers integer NULL,
	label text NULL
);

CREATE TABLE public.cake_toppings (
	id serial NOT NULL PRIMARY KEY,
	name text NOT NULL,
	price numeric(10, 2) NOT NULL,
	currency_code text NOT NULL
);