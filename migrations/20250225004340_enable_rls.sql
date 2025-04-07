-- Add migration script here

alter table public.users
enable row level security;

alter table public.cart_items
enable row level security;

alter table public.cart_items
enable row level security;

alter table public.orders
enable row level security;

alter table public.toppings
enable row level security;

alter table public.cake_flavors
enable row level security;

alter table public.cake_sizes
enable row level security;

alter table public.cake_toppings
enable row level security;

alter table public.cakes
enable row level security;