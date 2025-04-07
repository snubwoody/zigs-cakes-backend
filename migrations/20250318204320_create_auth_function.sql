-- Add migration script here
CREATE OR REPLACE FUNCTION create_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = auth, public
AS $$
BEGIN
	INSERT INTO public.profiles(id)
	values (new.id);
	RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER new_insert_trigger
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION create_user();