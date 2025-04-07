-- Add migration script here
INSERT INTO public.cake_toppings (name,price,currency_code)
values 
	('Choco balls',100,'ZMW'),
	('Ferrero Rocher',800,'ZMW'),
	('Sprinkles',500,'ZMW');

INSERT INTO public.cake_sizes (price,currency_code,inches,layers,label)
values 
	(650,'ZMW',7,3,'XS'),
	(850,'ZMW',8,3,'Small'),
	(950,'ZMW',9,4,'Regular'),
	(1150,'ZMW',8,5,'Big'),
	(850,'ZMW',9,2,'Large'),
	(950,'ZMW',9,3,'XL'),
	(850,'ZMW',10,1,'2XL'),
	(1250,'ZMW',10,2,'3XL');

INSERT INTO public.cake_flavors (price,currency_code,name)
values 	
	(0,'ZMW','Vanilla'),
	(0,'ZMW','Red velvet'),
	(0,'ZMW','Blueberry'),
	(0,'ZMW','Lemon'),
	(0,'ZMW','Chocolate'),
	(0,'ZMW','Marble');