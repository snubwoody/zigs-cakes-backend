-- Add migration script here
CREATE FUNCTION calculate_order_price() 
RETURNS TRIGGER AS $$
DECLARE
    total_price NUMERIC(10,2) := 0;
BEGIN
    -- Calculate total price from cart
    SELECT COALESCE(SUM(sizes.price), 0)
    INTO total_price
    FROM cakes
    JOIN cake_sizes sizes ON cakes.size_id = sizes.id
    WHERE cakes.cart = new.cart;

    -- Assign calculated price to the order before insert
    NEW.price := total_price;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER order_price_trigger
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION calculate_order_price();

