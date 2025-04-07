-- Add migration script here
ALTER TABLE public.profiles
ADD COLUMN active_cart UUID NULL REFERENCES public.cart(id);

COMMENT ON COLUMN public.profiles.active_cart 
IS 'Stores the users current cart, deleted and reset after ordering';