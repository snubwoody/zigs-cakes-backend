-- Add migration script here
CREATE TABLE public.orders (
  id serial NOT NULL PRIMARY KEY,
  ordered_on timestamp with time zone NOT NULL default now(),
  pick_up timestamp with time zone NOT NULL,
  name text NOT NULL,
  email text NOT NULL,
  status text NOT NULL DEFAULT 'Pending',
  phone_number text NOT NULL,
  cart integer NOT NULL REFERENCES cart(id)
);



CREATE TABLE public.cakes (
	id serial NOT NULL PRIMARY KEY,
	flavour_id integer NOT NULL REFERENCES cake_flavors(id),
	size_id integer NOT NULL REFERENCES cake_sizes(id),
	message text NULL,
	message_type text NULL,
	cart integer NOT NULL REFERENCES cart(id),
	additional_instructions text NULL,
	quantity integer NOT NULL default 1
);