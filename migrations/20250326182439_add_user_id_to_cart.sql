-- Add migration script here
ALTER TABLE public.cart
ADD COLUMN user_id UUID NULL REFERENCES public.profiles(id);

COMMENT ON COLUMN public.cart.user_id
IS 'The owner of this cart';