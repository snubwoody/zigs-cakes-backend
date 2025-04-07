-- Add migration script here
CREATE TABLE public.users (
	id uuid NOT NULL PRIMARY KEY,
	email text NULL,
	phone_number text NULL,
	created_at timestamp with time zone NOT NULL default now(),
	cart integer NULL REFERENCES cart(id) ON DELETE SET NULL
);
