-- Add migration script here
create table public.roles (
	id serial primary key not null,
	label text not null unique
);

create table public.profiles (
	id uuid primary key
);

create table public.user_roles (
	id serial primary key, 
	uid uuid not null references profiles(id) unique,
	role integer not null references roles(id)
);

insert into roles(label)
values ('admin');

alter table public.roles
enable row level security;

alter table public.profiles
enable row level security;

alter table public.user_roles
enable row level security;