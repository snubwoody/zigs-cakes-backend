-- Add migration script here
alter table cake_sizes
alter column inches set not null,
alter column label set not null,
alter column layers set not null;