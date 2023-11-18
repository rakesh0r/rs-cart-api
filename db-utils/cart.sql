create type cart_status as enum ('OPEN', 'ORDERED');

create table carts (
	id uuid primary key not null,
	user_id uuid not null,
	created_at date not null,
	updated_at date not null,
	status cart_status not null
);

create table cart_items (
	id uuid not null primary key,
	cart_id uuid references carts(id),
	product_id uuid,
	count integer
);


insert into carts (id, user_id, created_at, updated_at, status) values
(gen_random_uuid(), gen_random_uuid(), '2023-11-13', '2023-11-13', 'ORDERED'),
(gen_random_uuid(), gen_random_uuid(), '2023-11-13', '2023-11-13',  'ORDERED'),
(gen_random_uuid(), gen_random_uuid(), '2023-11-13', '2023-11-13',  'OPEN'),
(gen_random_uuid(), gen_random_uuid(), '2023-11-13', '2023-11-13',  'OPEN');

insert into cart_items (id, cart_id, product_id, count) values
(gen_random_uuid(), 'b2648c1f-43e0-445f-99d2-4942f62e85fa', gen_random_uuid(), 2),
(gen_random_uuid(), '856be5fb-2293-47d9-bc05-080e5fc3c926', gen_random_uuid(), 5),
(gen_random_uuid(), '3347fa06-72ad-4e17-a0e8-5112909aa4d8', gen_random_uuid(), 4),
(gen_random_uuid(), '1ec20b10-d644-4ea5-8e21-6ed4db7032e7', gen_random_uuid(), 18);