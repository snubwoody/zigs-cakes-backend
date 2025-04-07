SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."audit_log_entries" ("instance_id", "id", "payload", "created_at", "ip_address") VALUES
	('00000000-0000-0000-0000-000000000000', '472060e1-5e6c-4bd8-baa7-00c2dd7d8821', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"wakunguma13@gmail.com","user_id":"e2d5cca3-690a-42f0-8a4b-34edd8ee46af","user_phone":""}}', '2025-02-10 01:53:48.306466+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cbdd75ac-9b48-48f1-899e-cfea66eb8ab8', '{"action":"token_refreshed","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 04:03:11.899456+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b193c260-14b2-4f08-b987-20835fe9000e', '{"action":"token_revoked","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 04:03:11.904353+00', ''),
	('00000000-0000-0000-0000-000000000000', '41517e40-4d94-4545-8f03-a02e8b18687d', '{"action":"token_refreshed","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 18:02:35.707746+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c609348d-0d69-4c27-885b-89c1b0ae6f4d', '{"action":"token_revoked","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 18:02:35.72029+00', ''),
	('00000000-0000-0000-0000-000000000000', '5fad1e40-5db9-498d-82ec-d9d67922b6b6', '{"action":"token_refreshed","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 20:46:02.226712+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b81c2f86-7f8e-4de0-9e80-6287682ddb52', '{"action":"token_revoked","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 20:46:02.241668+00', ''),
	('00000000-0000-0000-0000-000000000000', '92366169-d47c-417b-abaf-aac2fa486cca', '{"action":"token_refreshed","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 22:17:12.209071+00', ''),
	('00000000-0000-0000-0000-000000000000', '37b64569-c391-478c-a302-8ecea38f4ab2', '{"action":"token_revoked","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-10 22:17:12.210086+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a4810161-600c-4710-987d-4ecf8eaae84e', '{"action":"token_refreshed","actor_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-13 02:57:19.942521+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b031ac0d-387c-40f6-9353-9708f0c1d3ca', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-13 04:01:36.785731+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ccec624-4836-4e29-b92b-f6d6eeec2ca7', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-13 04:01:36.798617+00', ''),
	('00000000-0000-0000-0000-000000000000', '08d90163-4b2c-420a-ac81-9f215f5e6bbe', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-13 04:59:55.962494+00', ''),
	('00000000-0000-0000-0000-000000000000', '29259696-cfe1-47fe-8538-1614184b3d69', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-13 04:59:55.964992+00', ''),
	('00000000-0000-0000-0000-000000000000', '284b285a-5aa2-4db9-881e-670e97c6658b', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 16:51:36.316064+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bf82e8b4-54d0-4757-bdd0-1a519b12ebe5', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 16:51:36.335484+00', ''),
	('00000000-0000-0000-0000-000000000000', '1298085e-10b4-4d94-b660-e56cac371710', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 17:49:43.592876+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e9e6c1b-ae3a-4d27-a7d0-fc98988dfb94', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 17:49:43.596575+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f61d8261-5c4c-4ad8-8c11-2dab1f851bff', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 18:50:38.156748+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d01ec50-2db7-4a13-8523-442aae6b8d97', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 18:50:38.158145+00', ''),
	('00000000-0000-0000-0000-000000000000', '00f27ebd-a603-49ac-bda5-ef5e0c19ae91', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 20:01:50.118447+00', ''),
	('00000000-0000-0000-0000-000000000000', '1253b0af-099a-4731-9fc5-53df5cc54ca6', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 20:01:50.147212+00', ''),
	('00000000-0000-0000-0000-000000000000', '26fa0695-a377-4cf0-a720-94ce2fd35752', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 20:02:39.317844+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e5ec2d54-4da5-4a44-9dcd-227d8acf5ab7', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 20:02:39.319249+00', ''),
	('00000000-0000-0000-0000-000000000000', '43e81179-a8c1-47d6-a2ca-a9a67bbad417', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 21:05:56.11777+00', ''),
	('00000000-0000-0000-0000-000000000000', '0ff28fa5-8ac9-4e82-9f62-1c8fb248bd44', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 21:05:56.121567+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b359a680-59d0-4aed-ac5c-32f2c85e42b3', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 22:04:19.401735+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ff051913-ef7e-4ea4-a550-b30d33153f2a', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 22:04:19.40365+00', ''),
	('00000000-0000-0000-0000-000000000000', '1da00660-21d9-4524-86b4-0a243e0faf46', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 22:12:16.008967+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fffeafc3-56c6-44bb-a2dc-e5129683aa5c', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 22:12:16.011076+00', ''),
	('00000000-0000-0000-0000-000000000000', 'df9e7d5d-83a0-444b-9c55-3392c7bad985', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 23:05:13.900559+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f55f1a6-170a-4d2e-ac22-18bcaf2b8edd', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 23:05:13.902773+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dcc1c4b8-102e-4a88-9f62-bdff0f3c1afa', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 23:13:21.475058+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c259ce32-716f-4e2f-9a0c-4b73300f5cdf', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-14 23:13:21.480169+00', ''),
	('00000000-0000-0000-0000-000000000000', '17fcd373-2661-458c-9fa1-c589793ed8b0', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 00:16:25.608607+00', ''),
	('00000000-0000-0000-0000-000000000000', '88243d85-55c4-4873-bf7a-7a3aa1ed1400', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 00:16:25.611115+00', ''),
	('00000000-0000-0000-0000-000000000000', '22349f0d-fa62-433a-915f-7c4fb3bcfc11', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 00:17:38.008615+00', ''),
	('00000000-0000-0000-0000-000000000000', '9288c6fc-d4e4-4337-96df-a4fa51875491', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 00:17:38.015434+00', ''),
	('00000000-0000-0000-0000-000000000000', '1852d4a3-9fd6-407a-9290-cd36cb7877e1', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:10:15.260026+00', ''),
	('00000000-0000-0000-0000-000000000000', '550e6cc6-69ed-4780-8afa-d7ec3c2d729c', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:10:15.261007+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc52959e-6e1b-484d-b940-6aebb2de526e', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:16:16.754732+00', ''),
	('00000000-0000-0000-0000-000000000000', '996d239c-c1df-4fce-8ed3-eb4853332581', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:16:16.764474+00', ''),
	('00000000-0000-0000-0000-000000000000', '12758be4-72fa-483d-acb0-ac1d5ab3bc14', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:44:41.499742+00', ''),
	('00000000-0000-0000-0000-000000000000', 'daf8ea31-8ec3-4229-baf4-8076d7848733', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 01:44:41.50073+00', ''),
	('00000000-0000-0000-0000-000000000000', '1d49fe66-9596-4911-83af-1b7e40bb68c1', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 06:27:44.526287+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ddcec71c-9bc2-4252-a79a-ff7148d1ea2c', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 06:27:44.527168+00', ''),
	('00000000-0000-0000-0000-000000000000', '08f0bea0-b4f9-49be-8a57-89133741d86d', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 15:02:49.000547+00', ''),
	('00000000-0000-0000-0000-000000000000', 'eb4ab791-ee18-4793-86bb-c5b83e233043', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 15:02:49.013993+00', ''),
	('00000000-0000-0000-0000-000000000000', '4ee91d71-8e9c-495e-8d30-694a33b01065', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 18:24:12.581971+00', ''),
	('00000000-0000-0000-0000-000000000000', '2d7d0581-a1c7-4d39-ab71-a349fdca146f', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-15 18:24:12.583066+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f279113-ba5b-4069-9ba4-c0de86ba482f', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 02:05:18.297478+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd04013bc-a622-41fc-977e-999363f15c4b', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 02:05:18.299014+00', ''),
	('00000000-0000-0000-0000-000000000000', '65494b8b-0ec2-4cbd-bf9b-b787e5608209', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 03:05:12.540518+00', ''),
	('00000000-0000-0000-0000-000000000000', '0f02fd03-b676-443e-bca8-526a9d2343bd', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 03:05:12.542114+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6cf220d-1d41-46d6-84a7-e5ef6cf6c62e', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 04:06:19.638994+00', ''),
	('00000000-0000-0000-0000-000000000000', '0cabb06f-2538-48b3-8da1-4d50609e0fb7', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 04:06:19.641172+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d5ed704-9c8d-4c66-ba9c-48a45d96832d', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 04:45:27.374702+00', ''),
	('00000000-0000-0000-0000-000000000000', '127da41b-c591-4358-a756-262eb80ae73d', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 04:45:27.383509+00', ''),
	('00000000-0000-0000-0000-000000000000', '063b1c2b-b0f8-4ba4-8925-e5f20fafcb24', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 05:09:24.263861+00', ''),
	('00000000-0000-0000-0000-000000000000', '949583a0-67f1-4cbc-903b-02a9b7c77350', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 05:09:24.266278+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f989442a-742c-44c7-a217-149d1f0e17ba', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 05:46:05.46796+00', ''),
	('00000000-0000-0000-0000-000000000000', '9063a091-3f77-4035-90a8-025c133176c9', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-16 05:46:05.47012+00', ''),
	('00000000-0000-0000-0000-000000000000', '424f3e25-a125-4c19-a19f-f75a546cc857', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 14:03:56.107896+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fb9b3f67-3ade-4c90-9440-8318a9d93dce', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 14:03:56.131072+00', ''),
	('00000000-0000-0000-0000-000000000000', '3963afac-f88d-4ce8-b1bc-4af9506357ca', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 17:04:57.140654+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fefb1fc7-56bd-4942-baa5-c98f242c6afd', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 17:04:57.143284+00', ''),
	('00000000-0000-0000-0000-000000000000', '08aab5b1-9582-43dc-ad1d-95f462f5ed54', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 18:05:02.197928+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fce6316e-3c97-4137-8e3a-cf28582ab2a3', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 18:05:02.201867+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd53980dc-f627-48ea-916c-7f406a3c60df', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 19:05:44.544791+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f29980fe-d764-4ee0-8a8a-0ab30cb65421', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-17 19:05:44.549176+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c9101b37-7854-49f1-b0f3-2fb7faa27a33', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 01:53:48.775618+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd2eeb2ba-56ee-4e05-8faf-c7a96077dd54', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 01:53:48.784116+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a8920eee-3e97-4125-a43e-9dcb147fba55', '{"action":"token_refreshed","actor_id":"323660ee-8171-4b83-a694-99c33318e646","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 02:32:11.286501+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7b375d9-2236-45bf-9244-249233457188', '{"action":"token_revoked","actor_id":"323660ee-8171-4b83-a694-99c33318e646","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 02:32:11.290433+00', ''),
	('00000000-0000-0000-0000-000000000000', '2e3f987e-f7ee-4a84-ae3e-061ec610aceb', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 02:52:41.271646+00', ''),
	('00000000-0000-0000-0000-000000000000', '06381955-c5dd-45bb-b7cc-14123b295366', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 02:52:41.273353+00', ''),
	('00000000-0000-0000-0000-000000000000', '7bf2f926-b84d-4018-9711-09729f8d754a', '{"action":"token_refreshed","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 03:14:54.575564+00', ''),
	('00000000-0000-0000-0000-000000000000', '6f82b01f-bda5-4a60-8f9b-63aadf8b245b', '{"action":"token_revoked","actor_id":"2e63adee-aa9b-4551-8809-40f7f2535308","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 03:14:54.577115+00', ''),
	('00000000-0000-0000-0000-000000000000', '7f3a27e6-4b5e-4ab6-9da6-f59cecd22408', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 22:48:43.880155+00', ''),
	('00000000-0000-0000-0000-000000000000', '4006dc66-8542-4949-83f3-ce6e7e8bf36c', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 22:48:43.89588+00', ''),
	('00000000-0000-0000-0000-000000000000', '3cf52587-7202-4998-9975-56e4b61b85ce', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 22:52:59.291054+00', ''),
	('00000000-0000-0000-0000-000000000000', '59085212-9d6d-4d04-b424-6fcd86e2e283', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-18 22:52:59.292611+00', ''),
	('00000000-0000-0000-0000-000000000000', '269e4304-0bac-4796-a51d-27ac66b821b8', '{"action":"token_refreshed","actor_id":"323660ee-8171-4b83-a694-99c33318e646","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-24 18:56:24.164071+00', ''),
	('00000000-0000-0000-0000-000000000000', '72377a69-81b1-49e3-a82e-3068bee5f272', '{"action":"token_revoked","actor_id":"323660ee-8171-4b83-a694-99c33318e646","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-02-24 18:56:24.183501+00', ''),
	('00000000-0000-0000-0000-000000000000', '7861413c-0345-47c1-8595-bafc0ddbd329', '{"action":"token_refreshed","actor_id":"4536c684-1162-45d0-b421-b6eaf7521ed3","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-02 03:39:52.01107+00', ''),
	('00000000-0000-0000-0000-000000000000', '5e298ee3-1eec-46d0-a3fe-6224ab140801', '{"action":"token_revoked","actor_id":"4536c684-1162-45d0-b421-b6eaf7521ed3","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-02 03:39:52.025706+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d23ca43-5417-4b6a-aeda-0c87bf206251', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:01:08.747855+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1c7cee6-e86c-4602-bbcc-776e956bc8db', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:01:08.759297+00', ''),
	('00000000-0000-0000-0000-000000000000', '7d67d2fb-996b-431a-ba2a-406eff35cd45', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:06:34.01789+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd256cc5c-38e3-419e-88a2-8056b85d1e00', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:06:34.019565+00', ''),
	('00000000-0000-0000-0000-000000000000', '952f71ba-d067-42e2-b813-6c8ffaba0451', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:59:44.144786+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b93bcb5a-9aac-43a8-8390-647bd631226e', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 02:59:44.146401+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8bfe8b4-b6bd-4cd2-9e1c-948e671219ce', '{"action":"token_refreshed","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 16:53:31.108906+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b2c865cd-9726-4a74-bf0d-29adcabfb87b', '{"action":"token_revoked","actor_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 16:53:31.128966+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a1b69a1c-e3d0-43e3-994c-591936d85725', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 18:20:37.502976+00', ''),
	('00000000-0000-0000-0000-000000000000', '283968e3-91e9-4aa1-8ec5-2b4f0aaf203f', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 18:20:37.510138+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d6f3d76-2062-45b6-b221-ecc7507e427a', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 19:19:24.814677+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a394ba34-db52-40b8-a255-d159de0414c0', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 19:19:24.81674+00', ''),
	('00000000-0000-0000-0000-000000000000', '5f80f065-8529-478f-98be-dbed8812d52e', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 21:24:10.2888+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9955677-2042-4494-8b49-c562de5e5b06', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-05 21:24:10.293326+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e2a02cce-3674-4a3c-854b-681138f09b70', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 00:11:48.10735+00', ''),
	('00000000-0000-0000-0000-000000000000', '3852a9da-93c3-40b7-a497-40b87d8884c6', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 00:55:12.31326+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c8dae34d-4980-44ff-b70c-b787ff673df1', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 00:55:12.316166+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5f319e8-176b-48fd-b108-057c649c6f9d', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 02:26:58.400376+00', ''),
	('00000000-0000-0000-0000-000000000000', '89d84299-a274-4c5b-9312-03899eef3681', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 02:26:58.402928+00', ''),
	('00000000-0000-0000-0000-000000000000', '4e3c4819-2253-4903-b850-14b02bbf4476', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 16:49:00.366521+00', ''),
	('00000000-0000-0000-0000-000000000000', '9f58df51-ff58-4481-bf7e-987d12a57f7d', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-06 16:49:00.392501+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b66f2ddf-d904-45c8-9567-0a05c9cb102d', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 02:13:32.84339+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b00492d1-772b-4e2b-bd1c-ceaa93c8d443', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 02:40:45.079377+00', ''),
	('00000000-0000-0000-0000-000000000000', '835c5bd5-b057-4f07-b48b-16efb1b6346a', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 02:40:45.083148+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f9f3fa8d-5f16-4521-a015-ad43042d6430', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 02:47:39.804033+00', ''),
	('00000000-0000-0000-0000-000000000000', '6a559080-55fd-4642-8055-1096d4e3d3d4', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 02:47:39.807097+00', ''),
	('00000000-0000-0000-0000-000000000000', '767863b4-3169-471d-b4e2-ed821b3da032', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 03:13:25.988792+00', ''),
	('00000000-0000-0000-0000-000000000000', '3c43b391-3b75-4fbe-8006-a0fe9e9db17f', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 03:13:25.990918+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ec10cb57-fcaa-4a12-b50e-1fea41d1d124', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 03:30:34.718769+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cb53470d-de2e-4da9-ad95-cd4554cc9ef5', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 03:30:34.720474+00', ''),
	('00000000-0000-0000-0000-000000000000', '1dd01ab1-f5be-49a8-9dc4-0d89a2f689f5', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 15:26:15.191639+00', ''),
	('00000000-0000-0000-0000-000000000000', '9eee0f0f-45c9-4278-a02c-3a922adc1b70', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 15:26:15.208253+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dfe0a04d-c933-40d4-8f19-b3f9264a72d2', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 19:05:13.822975+00', ''),
	('00000000-0000-0000-0000-000000000000', '66ba9ad0-d02b-4dec-a0c7-6886ba41af92', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 19:05:13.839259+00', ''),
	('00000000-0000-0000-0000-000000000000', '6e8b4217-6d6c-4ac3-a225-2814f0fc9867', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:05:03.855033+00', ''),
	('00000000-0000-0000-0000-000000000000', 'baa91506-a798-4c26-9235-a323286a6b51', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:05:03.859691+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7e9e84d-f554-4b71-9cf2-3299c25f99ee', '{"action":"token_refreshed","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:09:11.162587+00', ''),
	('00000000-0000-0000-0000-000000000000', 'acb9254a-ecf0-4312-8941-dd57ab1849fe', '{"action":"token_revoked","actor_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:09:11.16372+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dd3baff5-0db8-4d2e-9668-1690383c40de', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:25:47.429608+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c45fb4d-8854-402b-b4d3-f1e7514800b9', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 20:25:47.431152+00', ''),
	('00000000-0000-0000-0000-000000000000', '63c68c44-96b8-4ddb-90a5-e05e3eae2c71', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 21:35:52.62453+00', ''),
	('00000000-0000-0000-0000-000000000000', '268a1fa4-bf7d-4e2d-b5d6-4e2dfc02ef8c', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-07 21:35:52.627366+00', ''),
	('00000000-0000-0000-0000-000000000000', '6ea0976a-7e4a-4354-a247-26994e10bce9', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:27:53.182466+00', ''),
	('00000000-0000-0000-0000-000000000000', '2517425e-275e-4a65-8138-920dac9d4bcd', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:27:53.194967+00', ''),
	('00000000-0000-0000-0000-000000000000', '92a5ca3e-3e1b-4fad-ad8e-732e76c1d080', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:30:55.5458+00', ''),
	('00000000-0000-0000-0000-000000000000', '196f6a3b-6d5a-4cbc-afb2-15f76aecf505', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:30:55.55226+00', ''),
	('00000000-0000-0000-0000-000000000000', '06404cf7-3cd4-4d0c-886d-4de1f706da07', '{"action":"token_refreshed","actor_id":"a10033ff-b587-4c14-b579-8ab1a357b961","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:51:40.670555+00', ''),
	('00000000-0000-0000-0000-000000000000', 'db4a9715-28c5-4c30-9b19-b028755afb4f', '{"action":"token_revoked","actor_id":"a10033ff-b587-4c14-b579-8ab1a357b961","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 04:51:40.673528+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fdb08468-862d-47e4-875a-c35aa746f53a', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 20:54:26.331129+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd30e9288-f9b9-44e2-bf55-ac6065687b19', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 20:54:26.348715+00', ''),
	('00000000-0000-0000-0000-000000000000', '2eac8f19-88f5-405d-9b15-49ec9841acd4', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 21:07:23.966729+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b9ef5f4-698c-44f3-b6db-b0fc42c9d2b1', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 21:07:23.96971+00', ''),
	('00000000-0000-0000-0000-000000000000', '74215049-9bab-4194-82e3-11a5be7a5fc8', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 22:05:59.608647+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c828d217-c7d4-4c37-9486-3812092b1d44', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 22:05:59.612691+00', ''),
	('00000000-0000-0000-0000-000000000000', '22369581-f4f5-439f-91c3-9755f0185c2b', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 22:06:54.395681+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e43406f3-03ce-4d3e-9903-ad6ced084536', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-08 22:06:54.396354+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e0a60e7b-8619-4b0f-816d-e042d406984a', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-09 00:47:35.08409+00', ''),
	('00000000-0000-0000-0000-000000000000', 'aa3d1e98-9433-4c24-8ecc-de5616c590b8', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-09 00:47:35.088182+00', ''),
	('00000000-0000-0000-0000-000000000000', '32e52bb5-971f-4b48-88ff-289ffe0d32da', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 00:54:58.128569+00', ''),
	('00000000-0000-0000-0000-000000000000', 'daf36314-81d4-406a-9cbc-4d68743468f5', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 00:54:58.142696+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f88d3630-43f5-4fb6-83b8-bdb38d88c443', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 02:08:35.922455+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f16027a4-439c-49a6-a3de-2c059b0b6dc3', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 02:08:35.924028+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a44f0115-d69b-4212-9029-d9a92599c3c7', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 05:14:23.930347+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dbcd1ffc-b314-4dae-bd63-0a89cb269358', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 05:14:23.932656+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d151435-63c5-4652-8a03-214425fdb0fc', '{"action":"token_refreshed","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 21:23:02.032928+00', ''),
	('00000000-0000-0000-0000-000000000000', '6683e55f-dbaa-48c8-8315-29f14d0ae58a', '{"action":"token_revoked","actor_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-13 21:23:02.056879+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ee4daa1f-dfca-411e-b865-3bcfbd6c2168', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"wakunguma13@gmail.com","user_id":"e2d5cca3-690a-42f0-8a4b-34edd8ee46af","user_phone":""}}', '2025-03-14 17:28:43.950591+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c918f21b-59d9-472f-9454-53f6fd470055', '{"action":"user_signedup","actor_id":"dbfda5c2-049c-448b-b496-7e6e372d22ac","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-14 17:33:28.484473+00', ''),
	('00000000-0000-0000-0000-000000000000', '5177bce0-dfef-4b34-be14-394dec5ecc21', '{"action":"login","actor_id":"dbfda5c2-049c-448b-b496-7e6e372d22ac","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 17:33:28.492301+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b732bb7c-cb65-47de-9544-c67d5b5c35a1', '{"action":"user_signedup","actor_id":"1ae0609e-92ed-4913-a581-7538334b295d","actor_username":"snubwoody25@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-14 17:37:50.354053+00', ''),
	('00000000-0000-0000-0000-000000000000', '12b351f6-e233-4fd2-8be0-f15f4eeb53f5', '{"action":"login","actor_id":"1ae0609e-92ed-4913-a581-7538334b295d","actor_username":"snubwoody25@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 17:37:50.362531+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3b2f3c3-b6c9-4ba4-b54d-c4d4a225448a', '{"action":"login","actor_id":"1ae0609e-92ed-4913-a581-7538334b295d","actor_username":"snubwoody25@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 17:38:15.171831+00', ''),
	('00000000-0000-0000-0000-000000000000', 'feea877e-8c73-4ab1-99b7-04c39f066381', '{"action":"login","actor_id":"1ae0609e-92ed-4913-a581-7538334b295d","actor_username":"snubwoody25@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 18:24:52.792569+00', ''),
	('00000000-0000-0000-0000-000000000000', '980dddba-80bd-43a0-acdd-ba2119ea2ef9', '{"action":"login","actor_id":"1ae0609e-92ed-4913-a581-7538334b295d","actor_username":"snubwoody25@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 19:07:00.000446+00', ''),
	('00000000-0000-0000-0000-000000000000', '413dd38e-0ed6-422c-9961-e7ff56261731', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"wakunguma13@gmail.com","user_id":"dbfda5c2-049c-448b-b496-7e6e372d22ac","user_phone":""}}', '2025-03-14 19:18:56.453243+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bc9ab6da-d7ee-407e-8402-c5b9d4108375', '{"action":"user_signedup","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-14 19:19:58.088308+00', ''),
	('00000000-0000-0000-0000-000000000000', '74e1f485-338a-4ff0-a3a3-5d8230306e5b', '{"action":"login","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-14 19:19:58.092873+00', ''),
	('00000000-0000-0000-0000-000000000000', '4cc9cbea-ec89-4567-aa80-c030002310e7', '{"action":"token_refreshed","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-14 20:18:10.965944+00', ''),
	('00000000-0000-0000-0000-000000000000', '9432ed0a-0a0a-4d9d-a184-008ef41f8287', '{"action":"token_revoked","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-14 20:18:10.968381+00', ''),
	('00000000-0000-0000-0000-000000000000', '02f0c1ae-3b1c-412e-b48b-793c5755be40', '{"action":"user_repeated_signup","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-14 22:46:21.839446+00', ''),
	('00000000-0000-0000-0000-000000000000', '4823e162-75df-444a-886a-e655b2111971', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-15 21:48:31.441186+00', ''),
	('00000000-0000-0000-0000-000000000000', '0a7163a5-4b80-4c2a-9b05-ad8b0d537cc3', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-15 21:48:31.463653+00', ''),
	('00000000-0000-0000-0000-000000000000', '06092af7-15ed-444f-be11-a944d386efb4', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 00:39:12.05757+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c0527238-7496-4a60-a284-07a6bc9510e6', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 00:39:12.061067+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f2c9961f-1e1d-4d5e-8702-ceee84653263', '{"action":"user_repeated_signup","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-16 01:08:21.734006+00', ''),
	('00000000-0000-0000-0000-000000000000', '59d7b725-5f86-45c6-b444-5f03c44b8005', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 01:37:19.39023+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b0e61693-a0fb-4ddd-b00d-48713e26de41', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 01:37:19.39186+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a37a22c3-d7ee-48d2-b279-4fde94b04d1b', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:21:49.182801+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3fecd2c-e1ae-4c0c-9060-d065ed1270f0', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:21:49.186056+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b5019580-4996-4fea-bb92-b5dd548e9c94', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:25:05.027308+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e62d210e-a948-4cec-8c8f-037e351e5c21', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:25:05.029894+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d3d1aa0-2595-4607-afc6-d19aa3f16d3b', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:35:22.937765+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c30371ed-2e05-40c3-96c0-aa6696f7ddf6', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 02:35:22.93994+00', ''),
	('00000000-0000-0000-0000-000000000000', '46ce176b-b6d5-44f7-ae44-d7274f4d103d', '{"action":"token_refreshed","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 03:37:09.169865+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad0ddd43-7c50-4bdf-ab04-844c8ca89d4b', '{"action":"token_revoked","actor_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 03:37:09.170749+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cf1d6344-9656-440d-adc1-30e3682ff2fc', '{"action":"token_refreshed","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 04:58:41.568562+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a647c169-f84a-4d82-a95d-f0cdf3f7d6aa', '{"action":"token_revoked","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 04:58:41.569419+00', ''),
	('00000000-0000-0000-0000-000000000000', '79524eb2-1350-44a0-b4f6-9c52f0f31847', '{"action":"token_refreshed","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 22:41:24.721067+00', ''),
	('00000000-0000-0000-0000-000000000000', '626cf5f4-22d5-4126-8317-0ae78150a2b0', '{"action":"token_revoked","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 22:41:24.734502+00', ''),
	('00000000-0000-0000-0000-000000000000', '5c25c63e-2423-4d17-9a6a-676e0f4cea58', '{"action":"token_refreshed","actor_id":"5795d7d8-d3df-4e67-8cab-c2bc6854320f","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:29:18.68499+00', ''),
	('00000000-0000-0000-0000-000000000000', '7cde1fd8-32fa-43cc-a55b-e517cce23c32', '{"action":"token_revoked","actor_id":"5795d7d8-d3df-4e67-8cab-c2bc6854320f","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:29:18.687957+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c43ac42c-3dd6-4995-9b12-3f73f2fdea25', '{"action":"token_refreshed","actor_id":"41cb2b15-94bf-4dec-8ad3-6819ff582fc6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:34:24.303195+00', ''),
	('00000000-0000-0000-0000-000000000000', '39cdfdd8-4c33-4dbb-8ad3-65536b116705', '{"action":"token_revoked","actor_id":"41cb2b15-94bf-4dec-8ad3-6819ff582fc6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:34:24.306752+00', ''),
	('00000000-0000-0000-0000-000000000000', '993390f5-e84e-40ec-954b-db090f2fbf14', '{"action":"token_refreshed","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:41:25.356343+00', ''),
	('00000000-0000-0000-0000-000000000000', '77aea062-3776-4edc-b38a-44ef5ebd0e08', '{"action":"token_revoked","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:41:25.359006+00', ''),
	('00000000-0000-0000-0000-000000000000', '094810cf-d0c7-49b5-8d3f-1fd0622622c4', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:43:28.514554+00', ''),
	('00000000-0000-0000-0000-000000000000', '68ca286b-ad2e-4646-aa0d-7ea7a0fb98b0', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-16 23:43:28.517243+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a456b34a-f244-4464-bec4-39c4a62e1fae', '{"action":"token_refreshed","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 00:51:24.92007+00', ''),
	('00000000-0000-0000-0000-000000000000', '6323e8ab-2968-4546-a896-8e6c29e0e00e', '{"action":"token_revoked","actor_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 00:51:24.92284+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ee22d73-8463-4516-9d03-176078eb0eb1', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 00:55:14.544407+00', ''),
	('00000000-0000-0000-0000-000000000000', '51956e98-b6c0-4a3a-9017-ae3c152c4707', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 00:55:14.546631+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f0a6adc9-4d2d-442b-bc9f-d2f912f34377', '{"action":"token_refreshed","actor_id":"451264a9-f42b-403c-adc7-4541d2d2a6ee","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 01:06:56.516856+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7813d8c-952a-4a31-ae86-ca4fdad534eb', '{"action":"token_revoked","actor_id":"451264a9-f42b-403c-adc7-4541d2d2a6ee","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 01:06:56.517775+00', ''),
	('00000000-0000-0000-0000-000000000000', '1197f483-6723-41c9-ae0f-7619c8fb6c62', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 01:54:20.379581+00', ''),
	('00000000-0000-0000-0000-000000000000', '7c709dd0-a423-4513-a447-43168b19e846', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 01:54:20.380539+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f0fc9155-2235-4b4e-a99a-6335509740a6', '{"action":"token_refreshed","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 16:42:16.593942+00', ''),
	('00000000-0000-0000-0000-000000000000', '0242e13a-6398-44eb-9c4a-4f1f0c64e086', '{"action":"token_revoked","actor_id":"63bd05c2-8c54-4877-a317-1357877dc93d","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 16:42:16.612261+00', ''),
	('00000000-0000-0000-0000-000000000000', '9e124a0e-7274-43da-8ccc-35e6037c76cc', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 17:15:43.641456+00', ''),
	('00000000-0000-0000-0000-000000000000', '88dbd668-abdb-406e-8631-6d1f5ea85f7e', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 17:15:43.643691+00', ''),
	('00000000-0000-0000-0000-000000000000', '3433b307-6775-42c7-8008-f83693b0fc4f', '{"action":"token_refreshed","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 17:16:13.095176+00', ''),
	('00000000-0000-0000-0000-000000000000', '71dcde7a-9fa3-4972-858a-a104c4328187', '{"action":"token_revoked","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 17:16:13.096532+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cfa9d31f-0b6e-4e77-aa88-e0bc6acf13d7', '{"action":"token_refreshed","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 18:57:59.190018+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cfd1685b-b762-41a6-a5d6-f6880f318800', '{"action":"token_revoked","actor_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 18:57:59.192285+00', ''),
	('00000000-0000-0000-0000-000000000000', '391565fb-f41b-4fda-be8c-e0a30dbe61fa', '{"action":"token_refreshed","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 20:20:22.875977+00', ''),
	('00000000-0000-0000-0000-000000000000', '47efae87-d2a1-4f17-ae07-5b931b703635', '{"action":"token_revoked","actor_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","actor_username":"","actor_via_sso":false,"log_type":"token"}', '2025-03-17 20:20:22.879271+00', ''),
	('00000000-0000-0000-0000-000000000000', '4488273f-e572-4768-83dc-d95a5157cb36', '{"action":"user_repeated_signup","actor_id":"4068b497-7521-4b6a-b168-b4250efd4420","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-18 18:37:51.924815+00', ''),
	('00000000-0000-0000-0000-000000000000', '8572a4b0-be22-4f81-b668-bf713cbb6a2f', '{"action":"user_signedup","actor_id":"b1c4041b-3a2b-4eca-8f8b-84ecf021e1b3","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-18 19:05:14.366751+00', ''),
	('00000000-0000-0000-0000-000000000000', '45f054bc-eb10-413e-b155-c93a4360ed96', '{"action":"login","actor_id":"b1c4041b-3a2b-4eca-8f8b-84ecf021e1b3","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-18 19:05:14.381284+00', ''),
	('00000000-0000-0000-0000-000000000000', '48238330-6dc3-49b9-95ff-c88797cdb1eb', '{"action":"login","actor_id":"b1c4041b-3a2b-4eca-8f8b-84ecf021e1b3","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-18 19:06:45.902435+00', ''),
	('00000000-0000-0000-0000-000000000000', '54d2c266-7f5d-44c1-9593-11fafb550585', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:53:24.444246+00', ''),
	('00000000-0000-0000-0000-000000000000', '9127f517-0c01-465a-9c29-ae6da07dcb9a', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"2900ce35-7644-40ea-a406-2ce137b3fc81","user_phone":""}}', '2025-03-18 19:14:18.782308+00', ''),
	('00000000-0000-0000-0000-000000000000', '58fd7460-d447-4cd0-9ebb-15756934b171', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"0b8e4990-dd84-42c8-b400-af0664baec1d","user_phone":""}}', '2025-03-18 19:14:18.793824+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f1d55f49-01e0-48e9-8af5-52071c85aa74', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"8cc417ee-8cf9-4581-928f-ffb38c32629d","user_phone":""}}', '2025-03-18 19:14:18.804914+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bba2eb41-43e6-4638-9ae5-4511ba387c49', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"41cb2b15-94bf-4dec-8ad3-6819ff582fc6","user_phone":""}}', '2025-03-18 19:14:18.814752+00', ''),
	('00000000-0000-0000-0000-000000000000', '9da10006-f8d2-4b2f-b902-e1f2d6232db5', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"20e4245e-b184-483c-a5b0-033bc0ac7230","user_phone":""}}', '2025-03-18 19:14:18.830181+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ca20e4ba-4113-464b-84b0-a3c51a3fb134', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"43b4ffb8-2610-4fd4-b353-e3c86ee5cec6","user_phone":""}}', '2025-03-18 19:14:18.83117+00', ''),
	('00000000-0000-0000-0000-000000000000', '9bf54bbd-5e98-48f2-aa7a-ced4d3888041', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"613e645b-9deb-4dc3-b62a-954432c4f66a","user_phone":""}}', '2025-03-18 19:14:18.83796+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e5a392e6-bd90-4392-8b01-ce82ce354ae8', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"5795d7d8-d3df-4e67-8cab-c2bc6854320f","user_phone":""}}', '2025-03-18 19:14:18.840785+00', ''),
	('00000000-0000-0000-0000-000000000000', '7839f62a-545f-412a-89a5-13e837820077', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"6e7254b7-2501-49a4-bafc-deb75334fef9","user_phone":""}}', '2025-03-18 19:14:18.846124+00', ''),
	('00000000-0000-0000-0000-000000000000', '2f1b846d-1126-4536-8eb2-036c7da0a68f', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"722869a6-cbd7-4057-9980-663b2f1012b7","user_phone":""}}', '2025-03-18 19:14:18.848339+00', ''),
	('00000000-0000-0000-0000-000000000000', '68e8fc89-514b-4806-8718-772f473a8f02', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"717680c1-bc5c-4646-ad0c-fd382f5f6f2f","user_phone":""}}', '2025-03-18 19:14:18.854629+00', ''),
	('00000000-0000-0000-0000-000000000000', '5f5c9479-270c-410c-85ca-26e70c7bc08d', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"451264a9-f42b-403c-adc7-4541d2d2a6ee","user_phone":""}}', '2025-03-18 19:14:18.860502+00', ''),
	('00000000-0000-0000-0000-000000000000', '393ff72a-4de4-4594-b2db-ad151405cd66', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"2ebb6568-eb94-40c2-a9c8-875bbc158439","user_phone":""}}', '2025-03-18 19:14:18.859215+00', ''),
	('00000000-0000-0000-0000-000000000000', '8859f82c-0d58-4363-adeb-2587a3c6f032', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"e4c7e122-973a-49cb-a97a-434538f0b4d8","user_phone":""}}', '2025-03-18 19:14:18.874657+00', ''),
	('00000000-0000-0000-0000-000000000000', '9b3d1dae-a957-43e8-b8f6-2b01bd02d489', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"05a8ece4-07f3-4fcb-ae06-ca4aa8e5f23b","user_phone":""}}', '2025-03-18 19:14:18.881308+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a6bbdc50-19c9-41a5-9b80-130f25a6df8d', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"55332654-8147-4eca-a719-15e4769f417f","user_phone":""}}', '2025-03-18 19:14:18.882767+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f616337e-84c4-49d2-a0c8-3300d92a14d6', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"1253cd27-fd46-418b-88d8-db1c57f91da6","user_phone":""}}', '2025-03-18 19:14:18.891271+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b3d9524a-4b15-4463-9c61-b2fa1fe2d9a4', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"d6cf6b74-afa9-480d-b86b-a347c54b2cbb","user_phone":""}}', '2025-03-18 19:14:18.892647+00', ''),
	('00000000-0000-0000-0000-000000000000', '726dcf1b-84a5-4299-9eb8-8b0080af20f7', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"06ac1a84-cec4-4a2f-ace6-a332a5d57580","user_phone":""}}', '2025-03-18 19:14:18.894971+00', ''),
	('00000000-0000-0000-0000-000000000000', '11c9a82c-8d5d-4116-8a80-d541e0c8b7b1', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"8cb96bce-29d9-4ac8-80e9-d5d240f7580a","user_phone":""}}', '2025-03-18 19:14:18.915645+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b66b2b54-fd13-44b6-9b21-1b7468658b19', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"c2aa5022-8c2e-4ac2-b679-4430036fb772","user_phone":""}}', '2025-03-18 19:14:29.562529+00', ''),
	('00000000-0000-0000-0000-000000000000', '05df5657-2b9c-4a3b-8f37-1a21cb0a4f54', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"032fed1d-ee29-4c7d-8eff-88d25ae3bcfa","user_phone":""}}', '2025-03-18 19:14:50.924122+00', ''),
	('00000000-0000-0000-0000-000000000000', '9be05c13-f1b5-4e79-97b3-f10c29ba440c', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"4d9717ff-b941-4a62-929c-a385f9247399","user_phone":""}}', '2025-03-18 19:14:51.027856+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ca46c31-9b4f-47bb-880c-4ba8ba70a59a', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"2e63adee-aa9b-4551-8809-40f7f2535308","user_phone":""}}', '2025-03-18 19:14:51.073944+00', ''),
	('00000000-0000-0000-0000-000000000000', '087d55b4-ce99-4455-bbdf-088fa06b0ad1', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"6ee979a6-dde7-4d98-b287-71dd422abda7","user_phone":""}}', '2025-03-18 19:14:51.076262+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e64e2faa-7356-4f5f-b139-0c2fbddd8edd', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"faa87c86-a710-4d6f-b4f4-b292bd6d9b66","user_phone":""}}', '2025-03-18 19:14:51.08634+00', ''),
	('00000000-0000-0000-0000-000000000000', '2bdfbf7b-304c-4626-863f-3b81da6c21c4', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"5f50d0b8-9e0b-4499-8d6c-322e746d8938","user_phone":""}}', '2025-03-18 19:14:51.148132+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c6efdd1d-dd06-4038-92e0-53130f86370f', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"9f0d78e0-c04f-4694-b466-560667cff94d","user_phone":""}}', '2025-03-18 19:14:51.167034+00', ''),
	('00000000-0000-0000-0000-000000000000', '47bc8869-8b56-4c87-904c-f6ece8acbd1d', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"dc741b25-e897-4557-b9a1-9a175d3f64a8","user_phone":""}}', '2025-03-18 19:14:51.491539+00', ''),
	('00000000-0000-0000-0000-000000000000', '2c3da9a3-f90e-4b1f-a932-0ca01fd5ac73', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"2c3beae1-a15b-4ccc-a917-3e7e967c07a5","user_phone":""}}', '2025-03-18 19:14:51.501862+00', ''),
	('00000000-0000-0000-0000-000000000000', '06e23113-f25d-4e05-967d-4ddd840651a9', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"603c7290-0004-4c2f-97da-09e6ff1cd05f","user_phone":""}}', '2025-03-18 19:14:51.515479+00', ''),
	('00000000-0000-0000-0000-000000000000', 'c03fdac9-0dc7-47ba-8238-4d0e881123e9', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"df2d5cba-1f36-4e00-9845-7c47e41e7d89","user_phone":""}}', '2025-03-18 19:14:51.521319+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d04e20b-0b97-4b1a-9fe9-4f9248930967', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"63bd05c2-8c54-4877-a317-1357877dc93d","user_phone":""}}', '2025-03-18 19:14:51.538343+00', ''),
	('00000000-0000-0000-0000-000000000000', '21b3f494-66d9-451e-8846-0c15c77b4863', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"5e83f6ae-584b-4141-91c9-844447508c28","user_phone":""}}', '2025-03-18 19:14:51.564529+00', ''),
	('00000000-0000-0000-0000-000000000000', '3099a1ce-c4eb-4514-8922-22cb828156e6', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"323660ee-8171-4b83-a694-99c33318e646","user_phone":""}}', '2025-03-18 19:14:51.572367+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7610d38-3cb1-431a-a13a-1f403aa6e85e', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"83c583af-90ac-42c9-80ef-46e9935256b4","user_phone":""}}', '2025-03-18 19:14:51.605988+00', ''),
	('00000000-0000-0000-0000-000000000000', '695f5a61-58cc-47bd-af62-ffbb2605fe81', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"b2253bc5-3785-4f3b-a494-ec168951ec8c","user_phone":""}}', '2025-03-18 19:14:51.672468+00', ''),
	('00000000-0000-0000-0000-000000000000', 'be5ce985-fa10-4b7f-99f7-c3439e5db511', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"8ae15973-36ef-4592-8bc9-8c369e707a55","user_phone":""}}', '2025-03-18 19:14:51.679895+00', ''),
	('00000000-0000-0000-0000-000000000000', '823fdbf8-b5e7-4fff-8fc7-6e1d329a6d44', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"4536c684-1162-45d0-b421-b6eaf7521ed3","user_phone":""}}', '2025-03-18 19:14:51.710067+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd20c9f64-f50a-4e7d-85a5-12f0100bcb63', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"95ff4288-12d2-43bd-b76e-52e2858149c3","user_phone":""}}', '2025-03-18 19:14:51.675638+00', ''),
	('00000000-0000-0000-0000-000000000000', 'cd4c6a92-5043-44b0-b530-710415af4808', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"a10033ff-b587-4c14-b579-8ab1a357b961","user_phone":""}}', '2025-03-18 19:14:51.71542+00', ''),
	('00000000-0000-0000-0000-000000000000', '91dea5e3-a105-493f-83c5-9331f2766b04', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"f5a33729-ae1d-487e-9699-47193f8f8431","user_phone":""}}', '2025-03-18 19:14:59.725732+00', ''),
	('00000000-0000-0000-0000-000000000000', '3148be7c-aed7-4a18-8813-b2400686dff0', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"b205c31d-82c1-489e-bfe7-c1a4bf371916","user_phone":""}}', '2025-03-18 19:14:59.739983+00', ''),
	('00000000-0000-0000-0000-000000000000', '499c8970-0868-4de6-9a5a-73b812250ae2', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"1e04629d-3c2e-486f-9efc-aca468c919bd","user_phone":""}}', '2025-03-18 19:14:59.936661+00', ''),
	('00000000-0000-0000-0000-000000000000', '99c4d75e-f2f8-4b9f-bcd0-95d63bb5bc20', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"","user_id":"115b96f9-409c-47cc-9e7d-f6bbcd73f6f0","user_phone":""}}', '2025-03-18 19:15:00.434711+00', ''),
	('00000000-0000-0000-0000-000000000000', '016ff1c8-63d8-462e-bdf8-fabc000fd9af', '{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@example.com","user_id":"74a89e94-06b6-4e61-bb31-cec05d31f2a7","user_phone":""}}', '2025-03-18 21:18:25.823445+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d78b0ff-668c-45d4-8cff-bcee2a942f33', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"test@example.com","user_id":"74a89e94-06b6-4e61-bb31-cec05d31f2a7","user_phone":""}}', '2025-03-18 21:19:35.675128+00', ''),
	('00000000-0000-0000-0000-000000000000', '20f19c08-8ce8-4f8c-be65-33eba2b844c8', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"snubwoody25@gmail.com","user_id":"1ae0609e-92ed-4913-a581-7538334b295d","user_phone":""}}', '2025-03-18 21:19:36.164156+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fb55d9f9-e95c-4929-96b0-59f000de37d4', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"wakunguma13@gmail.com","user_id":"4068b497-7521-4b6a-b168-b4250efd4420","user_phone":""}}', '2025-03-18 21:19:36.172702+00', ''),
	('00000000-0000-0000-0000-000000000000', '40be811d-747b-4c23-a593-903c67558dae', '{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"zigscakes@gmail.com","user_id":"b1c4041b-3a2b-4eca-8f8b-84ecf021e1b3","user_phone":""}}', '2025-03-18 21:19:36.192162+00', ''),
	('00000000-0000-0000-0000-000000000000', '95c6fc47-99ef-4583-81cc-ba38ba6b4805', '{"action":"user_signedup","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-18 22:11:01.410473+00', ''),
	('00000000-0000-0000-0000-000000000000', 'bbbf64f0-93ad-448f-b288-7487c93549b1', '{"action":"login","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-18 22:11:01.417548+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e8226932-193f-4ae2-acd9-b549130c7d65', '{"action":"user_signedup","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-20 16:34:16.079974+00', ''),
	('00000000-0000-0000-0000-000000000000', '140a24a8-2232-4cdf-a054-4bc168cf78ff', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-20 16:34:16.107937+00', ''),
	('00000000-0000-0000-0000-000000000000', '483bf62e-c59c-44bc-ac47-01f9282ad5c0', '{"action":"user_repeated_signup","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-20 17:29:06.869293+00', ''),
	('00000000-0000-0000-0000-000000000000', '2df45c1d-85b3-4cb7-a873-2b2b2be6916e', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-20 17:29:18.527031+00', ''),
	('00000000-0000-0000-0000-000000000000', '87e87048-389d-4353-bf1a-fb56a15375ed', '{"action":"user_repeated_signup","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-20 17:45:18.616846+00', ''),
	('00000000-0000-0000-0000-000000000000', '17d47f86-ba5d-46e4-9f80-64aec6637ce3', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-20 17:45:33.719978+00', ''),
	('00000000-0000-0000-0000-000000000000', '039dc86d-d306-426a-a593-89239a9854a0', '{"action":"user_signedup","actor_id":"1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"team","traits":{"provider":"email"}}', '2025-03-20 21:47:39.556942+00', ''),
	('00000000-0000-0000-0000-000000000000', '16472b3d-6412-405a-8661-41bfe45da60b', '{"action":"login","actor_id":"1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-20 21:47:39.568543+00', ''),
	('00000000-0000-0000-0000-000000000000', '137e0774-e98e-401e-a447-829e49abdddf', '{"action":"login","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-20 21:48:58.559099+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd9038e90-a778-46fe-bff2-fddcf32f687c', '{"action":"user_repeated_signup","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-22 13:47:53.496658+00', ''),
	('00000000-0000-0000-0000-000000000000', '181b7b38-f7d0-4119-a198-e0e65c69fe64', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 13:48:02.897894+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e27ad640-6647-4d57-825d-354d3bd36362', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 14:21:09.345309+00', ''),
	('00000000-0000-0000-0000-000000000000', '8b6312a9-15d0-4992-8d95-accde17bfeac', '{"action":"logout","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-03-22 14:51:02.956799+00', ''),
	('00000000-0000-0000-0000-000000000000', '8a86c419-138c-4354-9018-9860bb2fd08b', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 14:58:04.780154+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f3e00288-a82c-468d-8307-323ad0f4404b', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 16:32:29.232544+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dc2244aa-a3fe-4578-a6a7-3b2493078fb2', '{"action":"user_repeated_signup","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}', '2025-03-22 16:55:39.18798+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ad10c70b-7a23-4d7d-a7f0-6b8b66fdfd21', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 16:55:45.677744+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f315df0c-ddce-4c2b-baa7-3693629f43f7', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-22 16:56:06.282955+00', ''),
	('00000000-0000-0000-0000-000000000000', '4bdae090-7adc-4d8e-8cfc-5eb3f22a29a1', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 00:53:29.337368+00', ''),
	('00000000-0000-0000-0000-000000000000', '3ae4142e-20cd-435b-9a95-f5fd5ea000b8', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:51:57.507804+00', ''),
	('00000000-0000-0000-0000-000000000000', 'd7091186-e615-4e1c-b884-97d92abae81a', '{"action":"token_revoked","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:51:57.512958+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e683c4a2-fe04-4487-946c-f456172f40df', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:52:25.803592+00', ''),
	('00000000-0000-0000-0000-000000000000', 'beffedd4-03e9-47e2-98fd-9088a9cd9532', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:53:58.674133+00', ''),
	('00000000-0000-0000-0000-000000000000', '72fc88f9-717b-42b5-a0bb-59118aa5a0c0', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:54:22.537867+00', ''),
	('00000000-0000-0000-0000-000000000000', '67d3d9ac-959b-4074-9095-741412c56183', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:54:37.623464+00', ''),
	('00000000-0000-0000-0000-000000000000', '7fdd3677-da10-4a34-bc30-0ddce12cd336', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:54:43.362485+00', ''),
	('00000000-0000-0000-0000-000000000000', '9190774c-4d4a-4b20-bd15-21a8862363ec', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:56:18.434205+00', ''),
	('00000000-0000-0000-0000-000000000000', '2cefa7d2-9550-42b6-80e7-5a841c96fb7a', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:56:33.401287+00', ''),
	('00000000-0000-0000-0000-000000000000', '452c7cfa-c245-4551-b562-92fd146a2bca', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 01:56:46.757673+00', ''),
	('00000000-0000-0000-0000-000000000000', '90dbca6b-0060-4226-a626-5aed0685c4b4', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 02:19:13.408786+00', ''),
	('00000000-0000-0000-0000-000000000000', 'fa56baad-ecd6-4e86-a9a5-4c5bc178a446', '{"action":"token_revoked","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 02:19:13.410453+00', ''),
	('00000000-0000-0000-0000-000000000000', 'e230fef7-a5fa-4fde-971b-d054ff37a8d2', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 02:19:23.46079+00', ''),
	('00000000-0000-0000-0000-000000000000', '83a4aa66-0650-4730-a375-2ccdf334d7cf', '{"action":"token_revoked","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 02:19:23.461421+00', ''),
	('00000000-0000-0000-0000-000000000000', 'b7cd5e15-4bab-4e6b-8b1a-0984fdfbb9ad', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 14:21:46.129327+00', ''),
	('00000000-0000-0000-0000-000000000000', 'a28611d0-b619-41c8-a74a-0a569801d1cc', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:21:08.780029+00', ''),
	('00000000-0000-0000-0000-000000000000', '4d114541-5f11-45e1-8d07-ce1fc01c1198', '{"action":"token_revoked","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:21:08.78846+00', ''),
	('00000000-0000-0000-0000-000000000000', 'ceb872aa-d29d-407c-87ad-0e4b7ca5d176', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:21:46.788719+00', ''),
	('00000000-0000-0000-0000-000000000000', '51540da0-9e2a-4723-bcf6-7d0e996bf196', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:22:00.049312+00', ''),
	('00000000-0000-0000-0000-000000000000', '42de804e-238f-4c59-8dcc-61ab842627b2', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:24:01.026277+00', ''),
	('00000000-0000-0000-0000-000000000000', '8d610981-4fc1-4656-ab50-7e3880117e13', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 15:26:02.547021+00', ''),
	('00000000-0000-0000-0000-000000000000', '3852f267-6bd6-4aa5-9c0f-d3399a742a35', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 15:48:25.289795+00', ''),
	('00000000-0000-0000-0000-000000000000', '6d6a67fe-dffe-44ab-8def-4c72b353245d', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 15:51:48.872525+00', ''),
	('00000000-0000-0000-0000-000000000000', '900d7a7c-9b86-4ea6-bc45-5896490b0346', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 15:54:02.811159+00', ''),
	('00000000-0000-0000-0000-000000000000', '395c9d7c-c77a-403c-8046-a42dbabb1f69', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-23 15:54:27.253298+00', ''),
	('00000000-0000-0000-0000-000000000000', '5079a012-adbd-428d-b7a9-cee33d6c871c', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:52:52.377979+00', ''),
	('00000000-0000-0000-0000-000000000000', '1ffe6aab-c3fb-49d6-89d2-c0366a57d76c', '{"action":"token_revoked","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:52:52.381382+00', ''),
	('00000000-0000-0000-0000-000000000000', '8f4f5784-9512-4438-94f7-40ad714ae355', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:52:53.854908+00', ''),
	('00000000-0000-0000-0000-000000000000', '51d0d316-bf21-4a64-b1e3-6eb961f97b1d', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:54:26.518766+00', ''),
	('00000000-0000-0000-0000-000000000000', '9d4b7aa4-9f6d-4196-8daa-a67bc2802bb5', '{"action":"token_refreshed","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"token"}', '2025-03-23 16:54:31.839292+00', ''),
	('00000000-0000-0000-0000-000000000000', '5890a29d-4d0e-4395-b757-f5c44dcac781', '{"action":"logout","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account"}', '2025-03-23 17:37:58.217884+00', ''),
	('00000000-0000-0000-0000-000000000000', 'f7e8c7f7-4d92-47e8-963e-c0a6bfc3a20e', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 01:25:58.441576+00', ''),
	('00000000-0000-0000-0000-000000000000', '69239a9b-d025-411e-91ad-09b6fabd5597', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 02:14:13.948789+00', ''),
	('00000000-0000-0000-0000-000000000000', '4a39e88a-ba7b-438f-8bfe-46f687308a81', '{"action":"login","actor_id":"e299c0da-9971-485f-9c85-f70138b61c0e","actor_username":"wakunguma13@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 17:22:07.050738+00', ''),
	('00000000-0000-0000-0000-000000000000', '985cc10e-6687-47bb-9af2-b0833a9fa546', '{"action":"login","actor_id":"1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 19:32:37.487198+00', ''),
	('00000000-0000-0000-0000-000000000000', '3f27ef4b-ac7d-4fd4-a31f-0108c2b11d7c', '{"action":"login","actor_id":"1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e","actor_username":"zigscakes@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 19:33:18.320735+00', ''),
	('00000000-0000-0000-0000-000000000000', '776493b2-efea-4759-a614-d68cf7f29412', '{"action":"login","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 19:39:57.880996+00', ''),
	('00000000-0000-0000-0000-000000000000', '7461567e-c2fd-42cd-8524-1d4067c5449d', '{"action":"login","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 19:42:48.002492+00', ''),
	('00000000-0000-0000-0000-000000000000', 'dbe0fa91-4ff8-4330-aed5-5a66376782b0', '{"action":"logout","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account"}', '2025-03-24 19:49:47.018015+00', ''),
	('00000000-0000-0000-0000-000000000000', '78fca81f-667f-4494-a075-b0d1d10950bc', '{"action":"login","actor_id":"107de4fc-a516-4890-b4fb-3db94028f375","actor_username":"gmbwalya@yahoo.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}', '2025-03-24 19:49:53.70478+00', '');


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'e299c0da-9971-485f-9c85-f70138b61c0e', 'authenticated', 'authenticated', 'wakunguma13@gmail.com', '$2a$10$KDk..oErLCv9bdsfNcXoFuk/KS3GBHP6pc8DVJWfXfIyf1Re4dm92', '2025-03-20 16:34:16.096539+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-03-24 17:22:07.070642+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "e299c0da-9971-485f-9c85-f70138b61c0e", "email": "wakunguma13@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-03-20 16:34:16.015721+00', '2025-03-24 17:22:07.115601+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '107de4fc-a516-4890-b4fb-3db94028f375', 'authenticated', 'authenticated', 'gmbwalya@yahoo.com', '$2a$10$.eMinTJbqnivRkP9nu8X3ekaJJwd5JcM2vD6KIOMWjJ06ASrplotu', '2025-03-18 22:11:01.412026+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-03-24 19:49:53.706165+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "107de4fc-a516-4890-b4fb-3db94028f375", "email": "gmbwalya@yahoo.com", "email_verified": true, "phone_verified": false}', NULL, '2025-03-18 22:11:01.39864+00', '2025-03-24 19:49:53.710444+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', 'authenticated', 'authenticated', 'zigscakes@gmail.com', '$2a$10$hNQnQwhNoLMhiUTb797Kzeu5f29WdCuCEE51I/W8p.XzGeXf3GbY6', '2025-03-20 21:47:39.563672+00', NULL, '', NULL, '', NULL, '', '', NULL, '2025-03-24 19:33:18.322102+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e", "email": "zigscakes@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2025-03-20 21:47:39.533604+00', '2025-03-24 19:33:18.32444+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('107de4fc-a516-4890-b4fb-3db94028f375', '107de4fc-a516-4890-b4fb-3db94028f375', '{"sub": "107de4fc-a516-4890-b4fb-3db94028f375", "email": "gmbwalya@yahoo.com", "email_verified": false, "phone_verified": false}', 'email', '2025-03-18 22:11:01.40711+00', '2025-03-18 22:11:01.407161+00', '2025-03-18 22:11:01.407161+00', '5e14b8df-3fdd-414c-a272-418a0e20b932'),
	('e299c0da-9971-485f-9c85-f70138b61c0e', 'e299c0da-9971-485f-9c85-f70138b61c0e', '{"sub": "e299c0da-9971-485f-9c85-f70138b61c0e", "email": "wakunguma13@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2025-03-20 16:34:16.062648+00', '2025-03-20 16:34:16.062705+00', '2025-03-20 16:34:16.062705+00', '57e60bbd-bc29-4ad8-8e59-96e82454db80'),
	('1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', '{"sub": "1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e", "email": "zigscakes@gmail.com", "email_verified": false, "phone_verified": false}', 'email', '2025-03-20 21:47:39.553092+00', '2025-03-20 21:47:39.553141+00', '2025-03-20 21:47:39.553141+00', '48997997-1e89-4eb9-a2d8-ab9cb33c1834');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag") VALUES
	('42b641d3-2b2f-4813-a610-7a88d2f68464', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', '2025-03-20 21:47:39.569114+00', '2025-03-20 21:47:39.569114+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.218', NULL),
	('9179a3df-d1ed-4e7b-a7cf-a30a240f19c1', 'e299c0da-9971-485f-9c85-f70138b61c0e', '2025-03-24 02:14:13.953235+00', '2025-03-24 02:14:13.953235+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.132', NULL),
	('cc5f0e31-f9e4-40e3-b2ca-d2bc636bcca3', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', '2025-03-24 19:32:37.501793+00', '2025-03-24 19:32:37.501793+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.196', NULL),
	('3dc58807-dec7-4109-b089-81a864382fc0', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', '2025-03-24 19:33:18.322822+00', '2025-03-24 19:33:18.322822+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.196', NULL),
	('dc6c982a-2a99-48ce-b740-79d92bfec901', 'e299c0da-9971-485f-9c85-f70138b61c0e', '2025-03-24 01:25:58.462149+00', '2025-03-24 01:25:58.462149+00', NULL, 'aal1', NULL, NULL, 'node', '38.61.81.66', NULL),
	('7aa6af22-d88a-471a-ab02-425a65b4bb86', 'e299c0da-9971-485f-9c85-f70138b61c0e', '2025-03-24 17:22:07.071319+00', '2025-03-24 17:22:07.071319+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.197', NULL),
	('17e6ae3c-8095-4e75-9986-436328a2b0ef', '107de4fc-a516-4890-b4fb-3db94028f375', '2025-03-24 19:49:53.706236+00', '2025-03-24 19:49:53.706236+00', NULL, 'aal1', NULL, NULL, 'node', '34.34.254.196', NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('42b641d3-2b2f-4813-a610-7a88d2f68464', '2025-03-20 21:47:39.586902+00', '2025-03-20 21:47:39.586902+00', 'password', '98e21659-19d0-44be-a6a5-e0c6d8bc4089'),
	('dc6c982a-2a99-48ce-b740-79d92bfec901', '2025-03-24 01:25:58.50053+00', '2025-03-24 01:25:58.50053+00', 'password', '6ba220f2-c66e-4e28-840b-4af85451f9a1'),
	('9179a3df-d1ed-4e7b-a7cf-a30a240f19c1', '2025-03-24 02:14:13.962777+00', '2025-03-24 02:14:13.962777+00', 'password', '5e53da63-a085-4ec7-9af6-f2956cc06fa1'),
	('7aa6af22-d88a-471a-ab02-425a65b4bb86', '2025-03-24 17:22:07.122957+00', '2025-03-24 17:22:07.122957+00', 'password', '74b155c7-5bc2-475d-b147-1cfd2c291dda'),
	('cc5f0e31-f9e4-40e3-b2ca-d2bc636bcca3', '2025-03-24 19:32:37.517953+00', '2025-03-24 19:32:37.517953+00', 'password', 'adc90fd5-e4c6-4f87-adef-4a1f0764bdaa'),
	('3dc58807-dec7-4109-b089-81a864382fc0', '2025-03-24 19:33:18.324718+00', '2025-03-24 19:33:18.324718+00', 'password', '8812c2dd-27a2-4b58-a4b1-a5d559e21ad3'),
	('17e6ae3c-8095-4e75-9986-436328a2b0ef', '2025-03-24 19:49:53.711115+00', '2025-03-24 19:49:53.711115+00', 'password', '26f0326e-8935-4b59-8f1a-9fba2de07d18');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 156, 'gLAmVTLVPVI_Wl1T5St37Q', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', false, '2025-03-20 21:47:39.575327+00', '2025-03-20 21:47:39.575327+00', NULL, '42b641d3-2b2f-4813-a610-7a88d2f68464'),
	('00000000-0000-0000-0000-000000000000', 176, 'L1Bba9P_yuDZo-CxTmCNmg', 'e299c0da-9971-485f-9c85-f70138b61c0e', false, '2025-03-24 02:14:13.957577+00', '2025-03-24 02:14:13.957577+00', NULL, '9179a3df-d1ed-4e7b-a7cf-a30a240f19c1'),
	('00000000-0000-0000-0000-000000000000', 177, '9rX-QiBHqKOI4TBip1IM0Q', 'e299c0da-9971-485f-9c85-f70138b61c0e', false, '2025-03-24 17:22:07.089238+00', '2025-03-24 17:22:07.089238+00', NULL, '7aa6af22-d88a-471a-ab02-425a65b4bb86'),
	('00000000-0000-0000-0000-000000000000', 182, 'ZWd1oMhiRtwQa--RkJsNXA', '107de4fc-a516-4890-b4fb-3db94028f375', false, '2025-03-24 19:49:53.707947+00', '2025-03-24 19:49:53.707947+00', NULL, '17e6ae3c-8095-4e75-9986-436328a2b0ef'),
	('00000000-0000-0000-0000-000000000000', 178, '9Yat1R6n8SuOXYvXHFFV-g', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', false, '2025-03-24 19:32:37.508012+00', '2025-03-24 19:32:37.508012+00', NULL, 'cc5f0e31-f9e4-40e3-b2ca-d2bc636bcca3'),
	('00000000-0000-0000-0000-000000000000', 179, '8MQsCIGrbove2Ok_RENGQA', '1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e', false, '2025-03-24 19:33:18.323541+00', '2025-03-24 19:33:18.323541+00', NULL, '3dc58807-dec7-4109-b089-81a864382fc0'),
	('00000000-0000-0000-0000-000000000000', 175, 'efoNatJRIs6uronhxkt7Ig', 'e299c0da-9971-485f-9c85-f70138b61c0e', false, '2025-03-24 01:25:58.4818+00', '2025-03-24 01:25:58.4818+00', NULL, 'dc6c982a-2a99-48ce-b740-79d92bfec901');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--




--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cart" ("id") VALUES
	('1d13ee44-b220-4b59-a91f-6933806447ee'),
	('8da874e3-27f7-4d63-9c04-080cc72d504f'),
	('b1c4af31-fda1-4daa-acff-e0f936c13e4b'),
	('fb83d5c3-28b5-4a7c-b60e-ceede89819c9'),
	('5b500dd6-7e67-4410-b1da-aed096248a61'),
	('f37df7e9-b9c1-4329-a0b0-4503337c7557'),
	('04c40672-0683-44f3-a045-d44708add962'),
	('ef611362-27eb-40ec-b3ca-092b2c4cb8ae'),
	('184c6a8b-8041-4818-864b-84fe11b3c501'),
	('dd0ccdc8-5d80-41e7-b47f-e495614c5d41'),
	('ba484f69-5c1c-4c39-87ca-bfd851e8f115'),
	('415caadb-8a17-4f4c-9788-132703d3d03b'),
	('4f5480d7-8bfc-43c2-b4f3-aec3b5bf591c'),
	('30e13682-a0fa-43ad-998f-930983501d9c'),
	('1e2c6348-1199-4ac6-b1fd-0d144a0b97dc'),
	('e64f0a6e-11b6-463c-a6fa-229f0526e0b5'),
	('be406d9a-4831-4348-a70a-3e3961bef999'),
	('4cf0d287-4b2e-414d-92ff-b8bef55e38ef'),
	('1a4a41f0-5d24-4927-823e-be714f285a21'),
	('a36b9877-ffba-466b-9c5b-2fa4a9518557'),
	('12aa5480-2ebf-4b27-ba3a-21ab63c9b1c8'),
	('f731f7b8-3603-40fe-b365-807f17403058'),
	('3f6639b6-1e87-4e9f-8fbc-fdfe3594046c'),
	('8a6e5fe9-2ce2-4342-917f-a3b8279f934f'),
	('930095d6-15e1-422f-9087-f657602b4706'),
	('2df21f99-fc4e-4440-bcc2-cdbfa5fd4816'),
	('2a6f1e9c-acf0-4426-9a83-078a6296a1bc'),
	('b92a27a8-c453-4b71-aad7-e8640fbad1f0'),
	('df0f9c4e-4838-4970-9169-cc131818760e'),
	('6de3f606-21e4-4476-99ef-8245213f387c'),
	('90c1a46f-282c-41be-ace4-f898e71e399a'),
	('7c4d4a84-2d51-41b4-9dca-a52e149aa5c6'),
	('eb4d4882-3492-42ac-9cc4-5b99e3d53a59'),
	('1b9e7ed9-fab8-41fa-9e40-2d5a91f2f7c1'),
	('bbd8776a-9f24-4926-b8c9-d652e221313a'),
	('e6479d69-b09c-4000-8bb4-d207caf9eaaa'),
	('ebf63be1-290a-447d-8566-3633c5e83dd1'),
	('146601ed-0628-4f70-93d6-14452b64b209'),
	('66736433-26d4-4a67-a249-c9aab50190e8'),
	('573501e9-e376-4dd5-967f-264b7a7ae41d'),
	('8c16e8e4-1cf8-47bc-9510-683bab40720a'),
	('7aa03738-e74c-476f-8867-6ff14b9383b6'),
	('c14e8362-5130-41d1-9843-466e858bd42e'),
	('bec3f27b-2e7c-4c18-ae8b-f0fb5c470bfb'),
	('fb5da7b2-6c4a-4022-8a29-f1aa0468b47b'),
	('bb9b73c5-be34-475d-af21-b0ea0fd4d5ad'),
	('fa9ff661-9eee-498e-83b6-3d03945420ba'),
	('9ac5ef15-f9de-4536-b478-cb479582b66f'),
	('b353dbe8-6cec-45b2-b11b-3c91daa31ef5'),
	('955451ab-ec41-4e74-acf1-f5949131c698'),
	('403620cf-208e-490d-b8fd-b14717ba5214'),
	('62992c3d-84b6-4576-926d-b6abadb5855e'),
	('9bdd4d94-f2d4-4a8b-9fc5-67d520103e02'),
	('771d3c2a-9a80-425e-9361-91829dc1c555'),
	('4415cfa6-4a76-4ffb-9cd7-dd2018d4b3ad'),
	('f4f3bf1f-ae27-4004-b115-bb8090459e03'),
	('2a95925e-988c-4e8c-a2fd-0b597b1bb4c6'),
	('4037954a-5ecf-4484-9129-a0e7f4beef1c'),
	('6998927e-2cd2-415c-bd75-e1dbc60543dc'),
	('17c0a3c0-9064-4635-b30c-9b3cd70b8eb1'),
	('08261ebf-2c6a-414e-85f6-253502eb1bd8'),
	('3647fea9-bed5-44d8-a236-1d770e5382a5'),
	('bd0397c4-c7ec-4170-9e01-ae63fa782a07'),
	('538250a3-5f74-45a0-81a6-21725eca311e'),
	('93f8a77f-ed03-4ff6-a1ed-d93c81a3fc22'),
	('34773813-8728-4e10-8845-55266488e800'),
	('f43fe326-af4d-48d7-8a86-6b1d5f9e8299'),
	('fe03abd4-ebbe-4363-80b9-6f15785665f1'),
	('c1c2daf7-2daa-41ee-ae78-d7f0734813a6'),
	('5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	('5be6755f-86fb-4158-ab88-cdff82de3395'),
	('22a13e7c-793e-417e-84bf-b6ac85aa3ceb'),
	('9bd458df-b35c-4169-8111-bfed1f58e47b'),
	('cdc5951b-669a-40b3-8669-b71d84028ecf'),
	('4c2209bb-9be8-4a65-9d92-fc9a981ae292'),
	('766fa5d4-08e9-488e-a4f9-c54eac8695f7'),
	('c7485efb-d962-46a6-9b39-48dc36715e3e'),
	('e616dfdc-f579-4923-8105-fc039c7e4e84'),
	('38cddfda-cf6f-4c08-ad3b-9290ebc46474'),
	('aab5bc77-c8df-46f6-a11a-7849e8f6424e'),
	('7547b20e-1829-4823-afc9-38736d56d4c7'),
	('0f5eede2-e31f-4282-9162-c22611ca01f6'),
	('be5d9746-386a-4286-baa8-6515ea6eeec6'),
	('86391a24-4ed3-4e31-803d-a3eaa121f838'),
	('b4025130-9dbb-4dc9-be38-2a2fd7166a4b'),
	('9855bdd1-2b91-4721-8db9-a17bbf002bd7'),
	('71f92152-531f-45e2-8536-a3fbe809aa7e'),
	('a3c1fe64-4465-49da-be5e-ee6b695b8a55'),
	('9eb16df4-768e-4c68-bc17-d74112e4c099'),
	('2164fc13-fc5d-4a41-a2b1-1b3935616606'),
	('4cdd1df2-7a68-4dbe-b238-90c5663050f5'),
	('60834281-bfe0-4277-9cbe-036ad071018a'),
	('c1578ec9-8667-41d9-9887-8686ab7398a4'),
	('bff0667b-e2d3-4700-958f-c32fe7560dce'),
	('a74acef7-9d37-4d63-9f83-e2ffe5e73e84'),
	('ed7d7fdc-3c52-4d39-a57c-d8b4ee22ed4e'),
	('35dba1c9-4dc8-45b6-a1e3-6f4dc4e89668'),
	('0814cd7b-1ad7-48fa-9854-a7968a1773e7'),
	('e28c03c6-4a8d-45f3-8bcd-6a5634693903'),
	('cd709be6-c026-487d-8ce6-dca28847f7de'),
	('704cd61c-534c-44c6-ba19-db06a913c93a'),
	('dc123d76-b92a-49ad-8c24-e06c26acfc16'),
	('a2890527-439a-4749-adcd-520acdd69afe'),
	('c8bb39bc-c26b-47b0-9dcf-0dcfe7f75b9a'),
	('ef45d668-dc9b-4791-aee2-fd6e71af87c7'),
	('47569876-f0a3-40e9-8a9f-59637c398336'),
	('8f9e24d3-1bd0-49c8-a459-f562db716cdf'),
	('5227d1a7-ba0f-450f-8d23-6c128c0956fb'),
	('bd1a0930-a9a1-4f84-aad7-b086dd4d207f'),
	('b05e6c21-d059-4c89-a723-07724a28a798'),
	('73f90cea-9ef7-48b7-bde3-89bb0ae7674e'),
	('1d7e947c-4272-42d8-8933-b7b4eb953c24'),
	('f8fca921-5d1c-4cbc-9861-f415a4ae1bda'),
	('0c09fc03-d877-43bd-bf5b-5925ae7bc57e'),
	('f0042c17-99f7-4984-8549-9bdd35fd489a'),
	('7ca2a703-4ca6-42f8-91fc-d03a41f602b3'),
	('3b2ed733-9816-4f5a-adf0-ac68ff631090'),
	('bad2af69-6dce-46aa-a3f7-d155a1648cd8'),
	('91980377-f365-4f11-99df-a54883f6decc'),
	('c77427e0-7a9a-4120-9968-135c2e36f7e5'),
	('3f7818ee-2db3-4305-b2f8-c5d9a1b492e2'),
	('4f646e15-ed04-47e4-9fab-a9f7ded97818'),
	('61ddd58f-8036-4d25-b297-399c1de20bd1'),
	('d2780768-a2bf-49e4-a64b-8da1447d2ac9'),
	('bb863dd8-2da7-48fd-86fe-2a39520533ab'),
	('cf7dd46b-e847-441f-923b-126456f025fa'),
	('7844d4c5-58e3-46c7-a8ed-74691e212484'),
	('dc7f1777-78b7-4de6-bfa1-ffef264fe586'),
	('261e36bf-f067-4a92-8262-3ff214b18091'),
	('d0af808b-fca7-4146-85fd-8bf16c70fcff'),
	('e4ed023f-5fae-464f-813e-ecd5c978e028'),
	('520717f3-16ad-4d1e-a827-dc2f5742d2ae'),
	('75311fef-0443-4e59-988e-b9cc0ca15746'),
	('ac91ff03-9242-4207-973b-c74749320930'),
	('a8345fc5-7625-461c-be3f-4a44f7beab05'),
	('353be773-04ef-4f63-b050-d06d21ee981b'),
	('9bbb1bc7-7ef6-46c5-b3b9-363d5dde5b44'),
	('c0c68c2d-1525-41b2-82a9-221a3c77d9ed'),
	('8483021b-6dba-47fd-b09e-bbab01d29a48'),
	('92a527a2-e4be-42b1-99e5-e504af3bcb8d'),
	('ab2400f6-d09d-44c7-8401-280949867b12'),
	('ff74ee0f-a4d5-4b57-90cd-e6edf7c940b4'),
	('c4198a5d-cd0c-4277-830a-c3f4907f8664'),
	('9452797f-35c0-4373-b0dc-3b8db3db3797'),
	('b4e2a340-cf79-4a28-9838-aa63d231b834'),
	('9569f254-0ac4-43da-b7ea-b5ee4cc5a338'),
	('6cdaff7e-026c-4c9e-a0ce-a45ea20361fd'),
	('09dd8ee1-dab0-43f8-a18d-7ced9fb0d1a7'),
	('531015c9-d6b5-4830-842d-9c2bd194389b'),
	('b49c4ed6-063f-4ec3-9130-caae33c1344c'),
	('de207836-7d8c-4049-bf0a-95251392d170'),
	('f380d721-09ec-42f6-990f-00ed259ee422'),
	('72d4d510-4f8a-4fc3-b482-462a31638c14'),
	('9bee3a75-f5b1-4f1c-9dfa-97a1959a16a9'),
	('1b06e8f0-d0f1-418d-9d06-7b55a8293b93'),
	('4e57bde5-8d12-41aa-9310-e8213c41b85c'),
	('442f66a3-bb7e-4a7b-86ed-532859aef381'),
	('b9a9bd23-73e8-4706-885e-068300c50f91'),
	('3986a38f-9b63-4c75-9420-b000cc6b5aae'),
	('911063fc-d4a8-4e04-a387-1bd8b99570a2'),
	('90dd515c-050b-41f3-968d-7f9a66581fab'),
	('df276d63-edff-4ff5-8adc-3e2a84d09f38'),
	('1cc657db-3ac7-4baf-a810-3232d237a51c'),
	('39dc7534-81f5-45c4-8b01-eed686c4bfe4'),
	('bd7812cc-da40-43a5-90ca-fa10ca33a84f'),
	('2f176196-002b-48f0-b68a-89ff94b1b060'),
	('265303d0-c592-4a82-96a7-f898ab0cb4a8'),
	('80ba7ef3-1b43-4cf1-bccd-9d9dbded7d3d'),
	('31059440-6d9e-4544-8cbb-827bdce8ef17'),
	('57119287-fa31-4bb7-92f4-d0544cc76d08'),
	('afb8ac6b-8cb8-43e6-ab12-c4adbb1993ed'),
	('14787600-d7be-408c-9bbe-92281174ad8d'),
	('ba38f634-ee8c-4694-9438-35225576c29c'),
	('2e68df51-8f61-41c0-aa0a-56ae8445a627'),
	('28e4888f-c369-47fb-abcd-f05dcb0945a9'),
	('006bc709-7eec-42fa-84ed-4b5321a7096b'),
	('c59514df-7982-4184-82fe-99a0775ac43a'),
	('74cc469e-2d3a-4af7-b3e7-c1161197ec0c'),
	('384c4e24-b054-4e72-9f05-41ddcfb5c978'),
	('c169a6a1-a57d-4d5e-afe7-b1020aa219c1'),
	('ff0961e0-c8cc-4fa7-bfbc-942ddd859636'),
	('9be3e89f-f231-4c8a-bf20-c7e16c0fb941'),
	('018f7c43-4174-488b-8d63-1130eb392399'),
	('b42f6a44-ddf8-4325-a8df-fa565c301e69'),
	('ceec1684-3adf-4fa2-9eb1-81e42b120358'),
	('d738cd01-013b-4b36-9866-a9238432b205'),
	('1e1a2e7a-096b-4430-b9e9-5829f85d38ac'),
	('13de51cf-d5ed-4a96-9d26-38e0f0d04633'),
	('31b3bd14-a1c4-4434-b4da-44781cc17169'),
	('05ef7ad8-204b-4adb-b7f0-a1803f754b53'),
	('85fbb112-b2c4-4b9e-8f86-cef1dd85ad27'),
	('a1a48fbe-ae39-4dd6-aae5-1721d9b0bfcc'),
	('12a0b5af-074d-489c-8820-9c855c7c54ce'),
	('05f15075-44f3-4aaf-85dc-0ce05e163c47'),
	('41fdfe10-5937-470a-9f2e-506e969dde70'),
	('da5e62b3-fbd3-4b8d-ae6b-5f1284844327'),
	('1e9629a2-c046-45e8-9f33-6f25489a44c0'),
	('1557f97c-a118-49ac-8581-9c79c4bccdfc'),
	('bc9a44b2-9de5-49cc-a871-de39d4bff61d'),
	('3711cf31-f84f-4597-b435-841f40acc0fe'),
	('87b249d7-b0c1-43ee-b292-24d110a501a8'),
	('a4ba8ff6-8c57-47e4-b338-98fbf13fdf55'),
	('80aac8a5-ee99-49a9-889d-430212e515ef'),
	('2635706d-87b2-4965-9ed6-f55c66c9fa5d'),
	('7619ad78-3bb7-4438-9f76-72d03e2bacff'),
	('a0052529-677d-4ff8-85bd-b7b08d69538f'),
	('49d5d98b-2b19-4ca0-bebb-9106f8c9a4ec'),
	('e95b7166-3ac8-47e1-a8ac-0a699fa11840'),
	('1ca2fa89-4ec7-4d5a-b61d-6a7a1028297f'),
	('126bad18-a9d2-4930-bd31-08905bea3a93'),
	('db77fb72-ad38-4a5a-98f5-9687a1dc8fa7'),
	('0218c922-4240-4d14-9a15-b1ae61981aff'),
	('8f1a8d38-5504-4f01-b1ae-f15dd76c541d'),
	('5ecb4cf3-32b8-4829-9db7-464402deec04'),
	('aebc04dd-5a26-4166-9e7a-ecdb34fb0e3a'),
	('2b75e7f3-c172-42d1-9b4c-fc2848915c48'),
	('ee11bfa5-3629-4cee-8e18-3cee52ae9bc0'),
	('5dd7320b-f8f4-4363-a509-3da693f3886c'),
	('276259f5-386b-44e8-b7e3-13cbbe4aff6a'),
	('e7f1ad38-7dc2-4c1c-98ce-ae8ffb375a4c'),
	('795d515a-e2a5-41b2-b204-5d4b40df8605'),
	('f410fa7a-33b0-471e-ac14-700b50b69513'),
	('fc32c2d2-ef63-4950-9a59-1f869deeb921'),
	('96ecbe88-caa8-4ee9-9610-08ce726cee20'),
	('772b87e7-5532-4c84-8574-50ed0d00a550'),
	('6dc2f56f-6566-4600-9988-15d6baa22986'),
	('3dcac1f1-37c7-406c-b692-1c019fb564f7'),
	('34cdb43d-cde4-40fa-bcb4-22d20d1232ca'),
	('ddccf74c-af3e-4e24-9902-560c189c137b'),
	('5c0de50f-4cd6-45d3-92d7-4a0f5bcc86af'),
	('0a788c5d-998f-4b0f-b101-c1ae3f38ed8b'),
	('65441a4d-7ee2-4521-a681-b5149c004035'),
	('085aa5be-7a5a-47c4-830c-b256e1678eb7'),
	('79220696-c7a0-46bb-8b37-aa6fff23240a'),
	('0eeba896-138d-4f75-9d11-7f111bdd7932'),
	('da35e86f-6d75-4110-b223-b69dbdafef5d'),
	('c07b5634-7fb8-41bb-a069-36bc44f63398'),
	('8b49f5ea-f29a-429d-9757-a6fdf1f7aff9'),
	('cc545e30-be31-4081-af5b-bcd8a6a89e69'),
	('60dd53d7-c0e9-4f5c-8acc-71cbada22b0a'),
	('11794363-5ec9-4c52-b5e0-e71e82775bdd'),
	('ae0c1d1e-414a-43db-bd5b-939a67de5964'),
	('b274c8ea-502d-438b-9943-94dafad9eb98'),
	('e7029c81-74e1-47da-b02c-56be8fa4bb16'),
	('aa1bd230-182b-48ca-a486-a204a6ef3155'),
	('fc1479ec-9a08-44e9-8e1a-0043eefec684'),
	('9ebb4bed-e028-48e8-b601-cee0617507c6');


--
-- Data for Name: cakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."cakes" ("id", "flavour_id", "size_id", "message", "message_type", "additional_instructions", "quantity", "cart") VALUES
	(30, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(34, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(35, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(36, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(37, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(38, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(39, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(40, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(41, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(42, 1, 6, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(43, 1, 6, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(44, 1, 6, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(45, 1, 6, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(48, 1, 6, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(51, 4, 8, 'HAPPY BIRTHDAY SWEETHEART ', 'Icing', 'Pick-up ', 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(52, 4, 8, 'HAPPY BIRTHDAY SWEETHEART ', 'Icing', 'Pick-up ', 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(53, 1, 1, NULL, 'Icing', NULL, 8, 'bff0667b-e2d3-4700-958f-c32fe7560dce'),
	(54, 1, 1, NULL, 'Icing', NULL, 4, 'bff0667b-e2d3-4700-958f-c32fe7560dce'),
	(55, 5, 1, NULL, 'Icing', NULL, 8, 'bff0667b-e2d3-4700-958f-c32fe7560dce'),
	(56, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(57, 1, 2, NULL, 'Icing', NULL, 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(58, 4, 1, NULL, 'Icing', NULL, 4, 'ebf63be1-290a-447d-8566-3633c5e83dd1'),
	(59, 2, 2, 'Happy birthday', 'Icing', 'Include edible pictures', 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(60, 2, 2, 'Happy birthday', 'Icing', 'Include edible pictures', 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730'),
	(61, 2, 2, 'Happy birthday', 'Icing', 'Include edible pictures', 1, '5de7e33f-37b6-4be6-80ca-adad4b38a730');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."orders" ("id", "ordered_on", "pick_up", "name", "email", "status", "phone_number", "cart", "price") VALUES
	(9, '2025-03-20 01:13:11.584945+00', '2111-12-12 00:00:00+00', 'Wakunguma Kalimukwa', 'wakunguma13@gmail.com', 'Pending', '+260838853838', 'bff0667b-e2d3-4700-958f-c32fe7560dce', 650.00),
	(10, '2025-03-20 01:17:48.743486+00', '5222-09-11 00:00:00+00', 'Wakunguma ', 'Kalimukwa', 'Pending', '+2479395925', 'bff0667b-e2d3-4700-958f-c32fe7560dce', 1300.00),
	(11, '2025-03-20 01:20:58.864839+00', '2005-12-11 00:00:00+00', 'Wakunguma Kalimukwaa', 'wakunguma', 'Pending', '+247223232323', 'bff0667b-e2d3-4700-958f-c32fe7560dce', 1950.00),
	(12, '2025-03-20 21:46:33.410399+00', '2025-03-20 00:00:00+00', 'Gwen', 'gmbwalya@yahoo.com', 'Pending', '+260974065718', '5de7e33f-37b6-4be6-80ca-adad4b38a730', 16600.00),
	(13, '2025-03-21 19:14:45.803727+00', '1111-12-11 00:00:00+00', 'Wakunguma', 'wakunguma13@gmail.com', 'Pending', '+2472424242', 'ebf63be1-290a-447d-8566-3633c5e83dd1', 650.00),
	(14, '2025-03-24 19:27:27.86521+00', '2025-03-24 00:00:00+00', 'Gwen', 'gmbwalya@yahoo.com', 'Pending', '+260974065718', '5de7e33f-37b6-4be6-80ca-adad4b38a730', 19150.00),
	(15, '2025-03-24 19:30:11.869273+00', '2025-03-25 00:00:00+00', 'Gwen', 'gmbwalya@yahoo.com', 'Pending', '+260960777322', '5de7e33f-37b6-4be6-80ca-adad4b38a730', 19150.00);


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profiles" ("id") VALUES
	('107de4fc-a516-4890-b4fb-3db94028f375'),
	('e299c0da-9971-485f-9c85-f70138b61c0e'),
	('1af0d2bc-5dcc-4cc9-a0d7-11a5809f113e');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."roles" ("id", "label") VALUES
	(1, 'admin');


--
-- Data for Name: toppings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_roles" ("id", "uid", "role") VALUES
	(2, '107de4fc-a516-4890-b4fb-3db94028f375', 1),
	(3, 'e299c0da-9971-485f-9c85-f70138b61c0e', 1);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "email", "phone_number", "created_at") VALUES
	('df2d5cba-1f36-4e00-9845-7c47e41e7d89', NULL, NULL, '2025-03-08 18:02:53.525268+00'),
	('032fed1d-ee29-4c7d-8eff-88d25ae3bcfa', NULL, NULL, '2025-03-09 00:48:58.946805+00'),
	('dbfda5c2-049c-448b-b496-7e6e372d22ac', NULL, NULL, '2025-03-14 17:33:28.453356+00'),
	('1ae0609e-92ed-4913-a581-7538334b295d', NULL, NULL, '2025-03-14 17:37:50.345518+00'),
	('4068b497-7521-4b6a-b168-b4250efd4420', NULL, NULL, '2025-03-14 19:19:58.076947+00'),
	('c2aa5022-8c2e-4ac2-b679-4430036fb772', NULL, NULL, '2025-03-15 06:51:04.269865+00'),
	('8cc417ee-8cf9-4581-928f-ffb38c32629d', NULL, NULL, '2025-03-15 11:00:38.162911+00'),
	('1253cd27-fd46-418b-88d8-db1c57f91da6', NULL, NULL, '2025-03-15 11:02:45.386013+00'),
	('613e645b-9deb-4dc3-b62a-954432c4f66a', NULL, NULL, '2025-03-15 12:29:12.86042+00'),
	('55332654-8147-4eca-a719-15e4769f417f', NULL, NULL, '2025-03-15 12:35:01.615276+00'),
	('722869a6-cbd7-4057-9980-663b2f1012b7', NULL, NULL, '2025-03-15 17:14:50.700448+00'),
	('5795d7d8-d3df-4e67-8cab-c2bc6854320f', NULL, NULL, '2025-03-15 19:01:53.078884+00'),
	('d6cf6b74-afa9-480d-b86b-a347c54b2cbb', NULL, NULL, '2025-03-16 00:00:00.562998+00'),
	('05a8ece4-07f3-4fcb-ae06-ca4aa8e5f23b', NULL, NULL, '2025-03-16 01:21:09.753548+00'),
	('6e7254b7-2501-49a4-bafc-deb75334fef9', NULL, NULL, '2025-03-16 01:21:29.546263+00'),
	('717680c1-bc5c-4646-ad0c-fd382f5f6f2f', NULL, NULL, '2025-03-16 01:22:19.785009+00'),
	('43b4ffb8-2610-4fd4-b353-e3c86ee5cec6', NULL, NULL, '2025-03-16 02:30:27.44028+00'),
	('06ac1a84-cec4-4a2f-ace6-a332a5d57580', NULL, NULL, '2025-03-16 02:48:34.771914+00'),
	('41cb2b15-94bf-4dec-8ad3-6819ff582fc6', NULL, NULL, '2025-03-16 03:39:35.368968+00'),
	('e4c7e122-973a-49cb-a97a-434538f0b4d8', NULL, NULL, '2025-03-16 04:08:50.066898+00'),
	('2ebb6568-eb94-40c2-a9c8-875bbc158439', NULL, NULL, '2025-03-16 15:32:23.224647+00'),
	('0b8e4990-dd84-42c8-b400-af0664baec1d', NULL, NULL, '2025-03-16 18:24:39.843161+00'),
	('451264a9-f42b-403c-adc7-4541d2d2a6ee', NULL, NULL, '2025-03-16 23:37:53.357493+00'),
	('8cb96bce-29d9-4ac8-80e9-d5d240f7580a', NULL, NULL, '2025-03-17 13:31:50.024392+00'),
	('2900ce35-7644-40ea-a406-2ce137b3fc81', NULL, NULL, '2025-03-17 13:32:29.061345+00'),
	('20e4245e-b184-483c-a5b0-033bc0ac7230', NULL, NULL, '2025-03-17 13:33:34.863526+00'),
	('b1c4041b-3a2b-4eca-8f8b-84ecf021e1b3', NULL, NULL, '2025-03-18 19:05:14.305652+00');


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 182, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('"pgsodium"."key_key_id_seq"', 1, false);


--
-- Name: cake_flavors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cake_flavors_id_seq"', 6, true);


--
-- Name: cake_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cake_sizes_id_seq"', 8, true);


--
-- Name: cake_toppings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cake_toppings_id_seq"', 3, true);


--
-- Name: cakes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."cakes_id_seq"', 61, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."orders_id_seq"', 15, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."roles_id_seq"', 1, true);


--
-- Name: toppings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."toppings_id_seq"', 1, false);


--
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."user_roles_id_seq"', 3, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
