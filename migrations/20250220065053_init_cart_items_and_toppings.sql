-- Add migration script here
CREATE TABLE public.cart_items (
	id serial NOT NULL PRIMARY KEY,
	cart_id integer NULL REFERENCES cart(id),
	cake_id integer NULL REFERENCES cakes(id),
	quantity integer NOT NULL
);


CREATE TABLE public.toppings (
	id serial NOT NULL PRIMARY KEY,
	cake_id integer NOT NULL REFERENCES cakes(id),
	topping_id integer NOT NULL REFERENCES cake_toppings(id)
);

