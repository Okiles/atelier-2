-- Adminer 4.8.1 PostgreSQL 17.2 (Debian 17.2-1.pgdg120+1) dump

DROP TABLE IF EXISTS "directus_access";
CREATE TABLE "public"."directus_access" (
    "id" uuid NOT NULL,
    "role" uuid,
    "user" uuid,
    "policy" uuid NOT NULL,
    "sort" integer,
    CONSTRAINT "directus_access_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_access" ("id", "role", "user", "policy", "sort") VALUES
('e1c71c3f-bee0-42fe-be04-f4d58668f078',	NULL,	NULL,	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	1),
('c32f89ef-192a-4d88-a029-815178f9efed',	'bf6816e1-8d4c-42f4-94c3-10323eb36c2c',	NULL,	'c9ea2441-186a-4060-bcf5-c7bcd443282b',	NULL);

DROP TABLE IF EXISTS "directus_activity";
DROP SEQUENCE IF EXISTS directus_activity_id_seq;
CREATE SEQUENCE directus_activity_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_activity" (
    "id" integer DEFAULT nextval('directus_activity_id_seq') NOT NULL,
    "action" character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "ip" character varying(50),
    "user_agent" text,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "origin" character varying(255),
    CONSTRAINT "directus_activity_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_activity" ("id", "action", "user", "timestamp", "ip", "user_agent", "collection", "item", "origin") VALUES
(1,	'login',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:24:39.579+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_users',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'http://localhost:42058'),
(2,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:29:05.797+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'1',	'http://localhost:42058'),
(3,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:29:05.805+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux',	'http://localhost:42058'),
(4,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:29:36.16+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'2',	'http://localhost:42058'),
(5,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:11.338+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'3',	'http://localhost:42058'),
(6,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:19.337+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'4',	'http://localhost:42058'),
(7,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:24.257+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'5',	'http://localhost:42058'),
(8,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:32.874+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'6',	'http://localhost:42058'),
(9,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.026+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'1',	'http://localhost:42058'),
(10,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.035+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'2',	'http://localhost:42058'),
(11,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.045+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'4',	'http://localhost:42058'),
(12,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.054+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'3',	'http://localhost:42058'),
(13,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.061+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'5',	'http://localhost:42058'),
(14,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:30:46.068+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'6',	'http://localhost:42058'),
(15,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.699+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'1',	'http://localhost:42058'),
(16,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.705+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'2',	'http://localhost:42058'),
(17,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.711+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'3',	'http://localhost:42058'),
(18,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.717+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'4',	'http://localhost:42058'),
(19,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.723+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'5',	'http://localhost:42058'),
(20,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:32:41.73+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'6',	'http://localhost:42058'),
(21,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:09.388+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'7',	'http://localhost:42058'),
(22,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:09.46+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'8',	'http://localhost:42058'),
(23,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:09.466+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux_files',	'http://localhost:42058'),
(24,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:09.522+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'9',	'http://localhost:42058'),
(25,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:09.589+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'10',	'http://localhost:42058'),
(26,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:19.417+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_policies',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'http://localhost:42058'),
(27,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:33:25.268+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux_files',	'http://localhost:42058'),
(282,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:18.012+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'15',	'http://localhost:42058'),
(283,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:25.382+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'16',	'http://localhost:42058'),
(284,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:31.682+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'17',	'http://localhost:42058'),
(285,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:49.993+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'1',	'http://localhost:42058'),
(286,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:49.999+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'2',	'http://localhost:42058'),
(287,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.006+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'3',	'http://localhost:42058'),
(288,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.022+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'4',	'http://localhost:42058'),
(289,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.039+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'5',	'http://localhost:42058'),
(290,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.05+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'6',	'http://localhost:42058'),
(291,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.06+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'7',	'http://localhost:42058'),
(292,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.066+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'8',	'http://localhost:42058'),
(293,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.078+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'9',	'http://localhost:42058'),
(294,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.084+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'10',	'http://localhost:42058'),
(295,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.093+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'11',	'http://localhost:42058'),
(296,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.097+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'12',	'http://localhost:42058'),
(297,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.103+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'13',	'http://localhost:42058'),
(298,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.109+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'14',	'http://localhost:42058'),
(299,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.125+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'15',	'http://localhost:42058'),
(300,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.13+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'16',	'http://localhost:42058'),
(301,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.134+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'17',	'http://localhost:42058'),
(302,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.146+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'18',	'http://localhost:42058'),
(303,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.151+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'19',	'http://localhost:42058'),
(304,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.156+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'20',	'http://localhost:42058'),
(305,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.162+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'21',	'http://localhost:42058'),
(306,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.164+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'22',	'http://localhost:42058'),
(307,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.167+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'23',	'http://localhost:42058'),
(308,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.169+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'24',	'http://localhost:42058'),
(309,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.172+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'25',	'http://localhost:42058'),
(310,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.175+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'26',	'http://localhost:42058'),
(311,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.179+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'27',	'http://localhost:42058'),
(312,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.182+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'28',	'http://localhost:42058'),
(313,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.185+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'29',	'http://localhost:42058'),
(314,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.189+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'30',	'http://localhost:42058'),
(315,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.191+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'31',	'http://localhost:42058'),
(316,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.195+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'32',	'http://localhost:42058'),
(317,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.197+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'33',	'http://localhost:42058'),
(318,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.201+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'34',	'http://localhost:42058'),
(319,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.204+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'35',	'http://localhost:42058'),
(320,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.206+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'36',	'http://localhost:42058'),
(321,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.209+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'37',	'http://localhost:42058'),
(322,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.211+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'38',	'http://localhost:42058'),
(323,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.214+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'39',	'http://localhost:42058'),
(324,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.217+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'40',	'http://localhost:42058'),
(325,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.22+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'41',	'http://localhost:42058'),
(326,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.223+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'42',	'http://localhost:42058'),
(327,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.226+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'43',	'http://localhost:42058'),
(328,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.232+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'44',	'http://localhost:42058'),
(329,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.237+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'45',	'http://localhost:42058'),
(330,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.24+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'46',	'http://localhost:42058'),
(331,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.243+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'47',	'http://localhost:42058'),
(332,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:50.245+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'48',	'http://localhost:42058'),
(367,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:02.123+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'15',	'http://localhost:42058'),
(368,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:02.127+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'15',	'http://localhost:42058'),
(387,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:57.797+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'25',	'http://localhost:42058'),
(388,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:57.799+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'25',	'http://localhost:42058'),
(389,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:09.725+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'26',	'http://localhost:42058'),
(390,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:09.726+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'26',	'http://localhost:42058'),
(405,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:48.932+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'34',	'http://localhost:42058'),
(406,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:48.934+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'34',	'http://localhost:42058'),
(435,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.747+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'1',	'http://localhost:42058'),
(436,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.754+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'2',	'http://localhost:42058'),
(437,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.756+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'3',	'http://localhost:42058'),
(438,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.759+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'4',	'http://localhost:42058'),
(439,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.762+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'5',	'http://localhost:42058'),
(440,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.764+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'6',	'http://localhost:42058'),
(441,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.768+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'7',	'http://localhost:42058'),
(333,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:04.781+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'18',	'http://localhost:42058'),
(334,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:04.855+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'19',	'http://localhost:42058'),
(335,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:04.857+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux_files',	'http://localhost:42058'),
(336,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:04.905+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'20',	'http://localhost:42058'),
(337,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:04.965+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'21',	'http://localhost:42058'),
(338,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:02:14.898+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux_files',	'http://localhost:42058'),
(339,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:06:55.346+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'1',	'http://localhost:42058'),
(340,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:06:55.348+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'1',	'http://localhost:42058'),
(377,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:10.442+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'20',	'http://localhost:42058'),
(378,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:10.45+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'20',	'http://localhost:42058'),
(381,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:29.174+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'22',	'http://localhost:42058'),
(382,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:29.176+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'22',	'http://localhost:42058'),
(385,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:46.051+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'24',	'http://localhost:42058'),
(386,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:46.052+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'24',	'http://localhost:42058'),
(409,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:10.563+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'36',	'http://localhost:42058'),
(410,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:10.566+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'36',	'http://localhost:42058'),
(442,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.77+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'8',	'http://localhost:42058'),
(443,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.773+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'9',	'http://localhost:42058'),
(444,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.775+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'10',	'http://localhost:42058'),
(445,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.777+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'11',	'http://localhost:42058'),
(446,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.78+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'12',	'http://localhost:42058'),
(447,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.782+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'13',	'http://localhost:42058'),
(448,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.784+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'14',	'http://localhost:42058'),
(449,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.786+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'15',	'http://localhost:42058'),
(450,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.789+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'16',	'http://localhost:42058'),
(451,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.791+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'17',	'http://localhost:42058'),
(452,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.793+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'18',	'http://localhost:42058'),
(453,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.796+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'19',	'http://localhost:42058'),
(124,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.653+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'a141e808-6ab9-4598-b03a-32657783a00b',	'http://localhost:42058'),
(125,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.654+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'581bc14e-5421-49c3-80e3-3b3901758769',	'http://localhost:42058'),
(126,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.655+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'9d9e72f0-3095-4534-8a64-305339046dc7',	'http://localhost:42058'),
(129,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.683+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'2c6e096b-5d8c-4c43-ab9f-fe0d0154065b',	'http://localhost:42058'),
(131,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.796+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'6edd6994-ef18-45f3-8afd-656f44603a46',	'http://localhost:42058'),
(139,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.927+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef',	'http://localhost:42058'),
(141,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.963+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'e5e962c1-fd7b-4c50-8b07-317406fd2933',	'http://localhost:42058'),
(167,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.452+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'5228db5d-ef5b-48c5-a4be-f2841e3fcc26',	'http://localhost:42058'),
(168,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.479+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'f738364c-aa7e-415d-b8a5-c4fac9afa71d',	'http://localhost:42058'),
(341,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:07:13.239+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'2',	'http://localhost:42058'),
(342,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:07:13.242+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'2',	'http://localhost:42058'),
(411,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:22.563+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'37',	'http://localhost:42058'),
(412,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:22.567+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'37',	'http://localhost:42058'),
(427,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:37.634+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'45',	'http://localhost:42058'),
(428,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:37.637+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'45',	'http://localhost:42058'),
(454,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.798+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'20',	'http://localhost:42058'),
(455,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.801+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'21',	'http://localhost:42058'),
(456,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.803+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'22',	'http://localhost:42058'),
(457,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.806+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'23',	'http://localhost:42058'),
(458,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.809+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'24',	'http://localhost:42058'),
(459,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.813+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_permissions',	'25',	'http://localhost:42058'),
(460,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:33:45.822+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_policies',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'http://localhost:42058'),
(127,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.668+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'67570c38-da82-41d1-9db1-f6bdc16949e5',	'http://localhost:42058'),
(134,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.82+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'e87df09d-5184-4092-94b3-5d2a36ebcac7',	'http://localhost:42058'),
(136,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.902+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'dbdd123b-5557-43c4-8de4-71a0a24116c8',	'http://localhost:42058'),
(140,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.963+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'1fec3bb7-5aac-4474-8e36-7e8ea7537e55',	'http://localhost:42058'),
(143,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.029+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'0374151e-342f-4943-aa7e-5ebc224829fa',	'http://localhost:42058'),
(147,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.08+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'382aac3c-e895-4d47-8807-ab2c9c821c70',	'http://localhost:42058'),
(150,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.159+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'055ab0e0-8a92-41dc-9b5d-64a617ba31bd',	'http://localhost:42058'),
(153,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.188+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'bacbd383-6652-4a00-b291-9ef6cf6933b2',	'http://localhost:42058'),
(160,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.338+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'72c4d2be-e76c-4864-801c-825ebdf4d9a4',	'http://localhost:42058'),
(163,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.397+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'6dcae1cb-0db7-4117-b722-2ef265ac0dc6',	'http://localhost:42058'),
(165,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.441+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'89017ea3-c34c-4eaf-829a-b052a5adb00e',	'http://localhost:42058'),
(170,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.544+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'37a4c703-1fbf-4649-8e4d-a9a7be875303',	'http://localhost:42058'),
(343,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:07:46.501+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'3',	'http://localhost:42058'),
(344,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:07:46.503+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'3',	'http://localhost:42058'),
(347,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:09:33.852+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'5',	'http://localhost:42058'),
(348,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:09:33.854+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'5',	'http://localhost:42058'),
(413,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:30.348+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'38',	'http://localhost:42058'),
(414,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:30.35+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'38',	'http://localhost:42058'),
(417,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:49.271+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'40',	'http://localhost:42058'),
(418,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:49.275+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'40',	'http://localhost:42058'),
(423,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:20.008+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'43',	'http://localhost:42058'),
(424,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:20.011+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'43',	'http://localhost:42058'),
(429,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:45.221+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'46',	'http://localhost:42058'),
(430,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:45.227+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'46',	'http://localhost:42058'),
(461,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:03:22.886+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'fcfb48c2-e432-4e24-870e-cb246b86fd37',	'http://localhost:42058'),
(128,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.675+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'1fbba087-a9aa-4ff4-a1a9-d75977ac6460',	'http://localhost:42058'),
(130,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.795+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'0fb8ec8a-4d7a-4900-9db0-2232f620b35c',	'http://localhost:42058'),
(132,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.812+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'a8d4392a-1449-4819-ac01-9a5a52e6e355',	'http://localhost:42058'),
(133,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.814+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'9e6bfa1b-8e1e-4b45-b7de-3179b031a91c',	'http://localhost:42058'),
(135,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.839+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'1b207fd0-45c9-4bda-a5db-a0d2dc6cf984',	'http://localhost:42058'),
(137,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.913+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'210a9381-92d6-48c3-8846-1f8289d31eb7',	'http://localhost:42058'),
(138,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.921+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'fb466a98-2aa0-425d-865b-9a729efcdcf6',	'http://localhost:42058'),
(142,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.022+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'387223ab-cf55-4d08-bed0-c7d1868ac0e8',	'http://localhost:42058'),
(144,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.041+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'66574d82-cfef-4b1a-8346-563cea295afa',	'http://localhost:42058'),
(145,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.043+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'c2aef6d9-8569-4296-8fba-b554ded565ef',	'http://localhost:42058'),
(146,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.074+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'fd4dbe84-edb0-4f26-953f-e78b9a8148d2',	'http://localhost:42058'),
(148,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.111+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'e06903a4-9e50-440f-a8ae-89a4896a3760',	'http://localhost:42058'),
(149,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.136+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'eef713a3-5211-43fb-99f6-3c0043850e87',	'http://localhost:42058'),
(151,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.165+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'cced8498-0372-417c-9e9c-46f2d5b51d12',	'http://localhost:42058'),
(152,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.171+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'd30c5c73-f57b-41a9-a5a1-a6a0822219c5',	'http://localhost:42058'),
(154,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.23+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'1edecadd-6209-42e6-8ea8-525a09bbf38f',	'http://localhost:42058'),
(155,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.249+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'46d64354-3977-400c-9dc2-21a04ccc04f1',	'http://localhost:42058'),
(156,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.277+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'b45b34a1-defa-486d-8b52-51f15e4a62ca',	'http://localhost:42058'),
(157,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.285+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'4f9d31c9-a26c-4f4b-9823-c4eea6c8f902',	'http://localhost:42058'),
(158,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.295+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'ccbc35e7-2e07-49f7-ac4e-48b85eeb2147',	'http://localhost:42058'),
(159,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.319+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'e82c61a9-4be6-4647-a29e-e16b5418973a',	'http://localhost:42058'),
(161,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.352+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596',	'http://localhost:42058'),
(162,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.395+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'16106068-98e3-4273-93cb-62455c3eb25a',	'http://localhost:42058'),
(164,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.411+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'7f10017f-5c26-4905-90d2-460b72476ed9',	'http://localhost:42058'),
(166,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.451+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'38e102f9-cda8-4a7f-8e9b-38a010daf52b',	'http://localhost:42058'),
(169,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.527+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'87bf3509-283e-4db2-94ff-9c7690edea24',	'http://localhost:42058'),
(171,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.545+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'8cce8533-e622-47b5-a116-a1bef26c2f8c',	'http://localhost:42058'),
(345,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:09:06.19+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'4',	'http://localhost:42058'),
(346,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:09:06.193+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'4',	'http://localhost:42058'),
(349,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:34.582+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'6',	'http://localhost:42058'),
(350,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:34.585+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'6',	'http://localhost:42058'),
(176,	'delete',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:58:31.686+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux_files',	'http://localhost:42058'),
(177,	'delete',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:58:31.7+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'7',	'http://localhost:42058'),
(351,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:44.218+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'7',	'http://localhost:42058'),
(352,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:44.22+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'7',	'http://localhost:42058'),
(353,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:55.372+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'8',	'http://localhost:42058'),
(354,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:10:55.375+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'8',	'http://localhost:42058'),
(365,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:52.459+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'14',	'http://localhost:42058'),
(366,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:52.461+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'14',	'http://localhost:42058'),
(369,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:13.456+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'16',	'http://localhost:42058'),
(370,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:13.458+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'16',	'http://localhost:42058'),
(373,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:44.793+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'18',	'http://localhost:42058'),
(374,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:44.796+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'18',	'http://localhost:42058'),
(415,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:39.502+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'39',	'http://localhost:42058'),
(416,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:17:39.504+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'39',	'http://localhost:42058'),
(421,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:12.508+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'42',	'http://localhost:42058'),
(422,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:12.51+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'42',	'http://localhost:42058'),
(462,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:06:37.819+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'49',	'http://localhost:42058'),
(463,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:06:37.823+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'49',	'http://localhost:42058'),
(355,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:11:38.069+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'9',	'http://localhost:42058'),
(356,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:11:38.072+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'9',	'http://localhost:42058'),
(359,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:24.207+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'11',	'http://localhost:42058'),
(360,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:24.209+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'11',	'http://localhost:42058'),
(379,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:20.625+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'21',	'http://localhost:42058'),
(380,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:20.627+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'21',	'http://localhost:42058'),
(383,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:37.658+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'23',	'http://localhost:42058'),
(384,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:14:37.66+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'23',	'http://localhost:42058'),
(395,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:40.717+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'29',	'http://localhost:42058'),
(396,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:40.719+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'29',	'http://localhost:42058'),
(419,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:01.645+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'41',	'http://localhost:42058'),
(420,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:01.647+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'41',	'http://localhost:42058'),
(433,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:19:08.362+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'48',	'http://localhost:42058'),
(434,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:19:08.365+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'48',	'http://localhost:42058'),
(464,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:33:04.517+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_files',	'4d07e99f-5780-4d2f-8847-ded2982a206c',	'http://localhost:42058'),
(357,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:12.97+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'10',	'http://localhost:42058'),
(358,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:12.973+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'10',	'http://localhost:42058'),
(361,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:32.445+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'12',	'http://localhost:42058'),
(362,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:32.447+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'12',	'http://localhost:42058'),
(391,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:17.625+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'27',	'http://localhost:42058'),
(392,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:17.627+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'27',	'http://localhost:42058'),
(393,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:29.132+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'28',	'http://localhost:42058'),
(394,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:29.134+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'28',	'http://localhost:42058'),
(399,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:00.438+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'31',	'http://localhost:42058'),
(400,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:00.44+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'31',	'http://localhost:42058'),
(401,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:08.083+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'32',	'http://localhost:42058'),
(402,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:08.085+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'32',	'http://localhost:42058'),
(403,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:29.444+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'33',	'http://localhost:42058'),
(404,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:29.445+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'33',	'http://localhost:42058'),
(407,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:57.42+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'35',	'http://localhost:42058'),
(408,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:16:57.422+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'35',	'http://localhost:42058'),
(425,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:28.287+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'44',	'http://localhost:42058'),
(426,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:28.289+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'44',	'http://localhost:42058'),
(465,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:33:15.081+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'50',	'http://localhost:42058'),
(466,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:33:15.085+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'50',	'http://localhost:42058'),
(363,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:41.304+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'13',	'http://localhost:42058'),
(364,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:12:41.307+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'13',	'http://localhost:42058'),
(371,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:25.359+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'17',	'http://localhost:42058'),
(372,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:25.361+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'17',	'http://localhost:42058'),
(375,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:56.401+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'19',	'http://localhost:42058'),
(274,	'delete',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:17.373+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux',	'http://localhost:42058'),
(275,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:22.623+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'11',	'http://localhost:42058'),
(276,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:22.626+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux',	'http://localhost:42058'),
(277,	'delete',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:31.949+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux',	'http://localhost:42058'),
(278,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:40.309+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'12',	'http://localhost:42058'),
(279,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:40.312+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_collections',	'lieux',	'http://localhost:42058'),
(280,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:00:52.795+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'13',	'http://localhost:42058'),
(281,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:01:11.175+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'directus_fields',	'14',	'http://localhost:42058'),
(376,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:13:56.403+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'19',	'http://localhost:42058'),
(397,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:50.924+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'30',	'http://localhost:42058'),
(398,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:15:50.926+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'30',	'http://localhost:42058'),
(431,	'create',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:55.166+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux_files',	'47',	'http://localhost:42058'),
(432,	'update',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 21:18:55.169+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	'lieux',	'47',	'http://localhost:42058');

DROP TABLE IF EXISTS "directus_collections";
CREATE TABLE "public"."directus_collections" (
    "collection" character varying(64) NOT NULL,
    "icon" character varying(64),
    "note" text,
    "display_template" character varying(255),
    "hidden" boolean DEFAULT false NOT NULL,
    "singleton" boolean DEFAULT false NOT NULL,
    "translations" json,
    "archive_field" character varying(64),
    "archive_app_filter" boolean DEFAULT true NOT NULL,
    "archive_value" character varying(255),
    "unarchive_value" character varying(255),
    "sort_field" character varying(64),
    "accountability" character varying(255) DEFAULT 'all',
    "color" character varying(255),
    "item_duplication_fields" json,
    "sort" integer,
    "group" character varying(64),
    "collapse" character varying(255) DEFAULT 'open' NOT NULL,
    "preview_url" character varying(255),
    "versioning" boolean DEFAULT false NOT NULL,
    CONSTRAINT "directus_collections_pkey" PRIMARY KEY ("collection")
) WITH (oids = false);

INSERT INTO "directus_collections" ("collection", "icon", "note", "display_template", "hidden", "singleton", "translations", "archive_field", "archive_app_filter", "archive_value", "unarchive_value", "sort_field", "accountability", "color", "item_duplication_fields", "sort", "group", "collapse", "preview_url", "versioning") VALUES
('lieux',	NULL,	NULL,	NULL,	'f',	'f',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	'all',	NULL,	NULL,	NULL,	NULL,	'open',	NULL,	'f'),
('lieux_files',	'import_export',	NULL,	NULL,	'f',	'f',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	'all',	NULL,	NULL,	NULL,	NULL,	'open',	NULL,	'f');

DROP TABLE IF EXISTS "directus_comments";
CREATE TABLE "public"."directus_comments" (
    "id" uuid NOT NULL,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "comment" text NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    CONSTRAINT "directus_comments_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_dashboards";
CREATE TABLE "public"."directus_dashboards" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "icon" character varying(64) DEFAULT 'dashboard' NOT NULL,
    "note" text,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "color" character varying(255),
    CONSTRAINT "directus_dashboards_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_extensions";
CREATE TABLE "public"."directus_extensions" (
    "enabled" boolean DEFAULT true NOT NULL,
    "id" uuid NOT NULL,
    "folder" character varying(255) NOT NULL,
    "source" character varying(255) NOT NULL,
    "bundle" uuid,
    CONSTRAINT "directus_extensions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_fields";
DROP SEQUENCE IF EXISTS directus_fields_id_seq;
CREATE SEQUENCE directus_fields_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_fields" (
    "id" integer DEFAULT nextval('directus_fields_id_seq') NOT NULL,
    "collection" character varying(64) NOT NULL,
    "field" character varying(64) NOT NULL,
    "special" character varying(64),
    "interface" character varying(64),
    "options" json,
    "display" character varying(64),
    "display_options" json,
    "readonly" boolean DEFAULT false NOT NULL,
    "hidden" boolean DEFAULT false NOT NULL,
    "sort" integer,
    "width" character varying(30) DEFAULT 'full',
    "translations" json,
    "note" text,
    "conditions" json,
    "required" boolean DEFAULT false,
    "group" character varying(64),
    "validation" json,
    "validation_message" text,
    CONSTRAINT "directus_fields_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_fields" ("id", "collection", "field", "special", "interface", "options", "display", "display_options", "readonly", "hidden", "sort", "width", "translations", "note", "conditions", "required", "group", "validation", "validation_message") VALUES
(12,	'lieux',	'id',	NULL,	'input',	NULL,	NULL,	NULL,	't',	't',	1,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(13,	'lieux',	'categorie',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	2,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(14,	'lieux',	'longitude',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	3,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(15,	'lieux',	'latitude',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	4,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(16,	'lieux',	'ville',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	5,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(17,	'lieux',	'nom',	NULL,	'input',	NULL,	NULL,	NULL,	'f',	'f',	6,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(18,	'lieux',	'photo',	'files',	'files',	NULL,	NULL,	NULL,	'f',	'f',	7,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(19,	'lieux_files',	'id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	1,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(20,	'lieux_files',	'lieux_id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	2,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL),
(21,	'lieux_files',	'directus_files_id',	NULL,	NULL,	NULL,	NULL,	NULL,	'f',	't',	3,	'full',	NULL,	NULL,	NULL,	'f',	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "directus_files";
CREATE TABLE "public"."directus_files" (
    "id" uuid NOT NULL,
    "storage" character varying(255) NOT NULL,
    "filename_disk" character varying(255),
    "filename_download" character varying(255) NOT NULL,
    "title" character varying(255),
    "type" character varying(255),
    "folder" uuid,
    "uploaded_by" uuid,
    "created_on" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "modified_by" uuid,
    "modified_on" timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "charset" character varying(50),
    "filesize" bigint,
    "width" integer,
    "height" integer,
    "duration" integer,
    "embed" character varying(200),
    "description" text,
    "location" text,
    "tags" text,
    "metadata" json,
    "focal_point_x" integer,
    "focal_point_y" integer,
    "tus_id" character varying(64),
    "tus_data" json,
    "uploaded_on" timestamptz,
    CONSTRAINT "directus_files_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_files" ("id", "storage", "filename_disk", "filename_download", "title", "type", "folder", "uploaded_by", "created_on", "modified_by", "modified_on", "charset", "filesize", "width", "height", "duration", "embed", "description", "location", "tags", "metadata", "focal_point_x", "focal_point_y", "tus_id", "tus_data", "uploaded_on") VALUES
('a141e808-6ab9-4598-b03a-32657783a00b',	'local',	'a141e808-6ab9-4598-b03a-32657783a00b.jpg',	'85px-Tour_de_la_Commanderie.jpg',	'85px Tour De La Commanderie',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.649+00',	NULL,	'2025-02-06 20:55:17.7+00',	NULL,	3695,	85,	120,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.699+00'),
('581bc14e-5421-49c3-80e3-3b3901758769',	'local',	'581bc14e-5421-49c3-80e3-3b3901758769.jpg',	'120px-La_Place_Stanislas_-_nancy.jpg',	'120px La Place Stanislas   Nancy',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.65+00',	NULL,	'2025-02-06 20:55:17.701+00',	NULL,	3384,	120,	90,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.699+00'),
('9d9e72f0-3095-4534-8a64-305339046dc7',	'local',	'9d9e72f0-3095-4534-8a64-305339046dc7.jpg',	'A_Lombre_des_marques.jpg',	'A Lombre Des Marques',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.651+00',	NULL,	'2025-02-06 20:55:17.705+00',	NULL,	59500,	500,	500,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.703+00'),
('67570c38-da82-41d1-9db1-f6bdc16949e5',	'local',	'67570c38-da82-41d1-9db1-f6bdc16949e5.jpg',	'asia-wok.jpg',	'Asia Wok',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.666+00',	NULL,	'2025-02-06 20:55:17.713+00',	NULL,	51383,	526,	394,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.704+00'),
('1fbba087-a9aa-4ff4-a1a9-d75977ac6460',	'local',	'1fbba087-a9aa-4ff4-a1a9-d75977ac6460.jpg',	'Arc_Héré,_Place_Stanislas,_Nancy.jpg',	'Arc Héré, Place Stanislas, Nancy',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.669+00',	NULL,	'2025-02-06 20:55:17.723+00',	NULL,	45006,	420,	291,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.707+00'),
('2c6e096b-5d8c-4c43-ab9f-fe0d0154065b',	'local',	'2c6e096b-5d8c-4c43-ab9f-fe0d0154065b.jpg',	'Auchan.jpg',	'Auchan',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.679+00',	NULL,	'2025-02-06 20:55:17.802+00',	NULL,	84182,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.782+00'),
('6edd6994-ef18-45f3-8afd-656f44603a46',	'local',	'6edd6994-ef18-45f3-8afd-656f44603a46.jpg',	'bonide.jpg',	'Bonide',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.785+00',	NULL,	'2025-02-06 20:55:17.845+00',	NULL,	39122,	960,	720,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.843+00'),
('a8d4392a-1449-4819-ac01-9a5a52e6e355',	'local',	'a8d4392a-1449-4819-ac01-9a5a52e6e355.jpg',	'CaverneDuGoblin.jpg',	'Caverne Du Goblin',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.81+00',	NULL,	'2025-02-06 20:55:17.846+00',	NULL,	52728,	680,	382,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.843+00'),
('9e6bfa1b-8e1e-4b45-b7de-3179b031a91c',	'local',	'9e6bfa1b-8e1e-4b45-b7de-3179b031a91c.jpg',	'centre_commerciale_les_nations.jpg',	'Centre Commerciale Les Nations',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.813+00',	NULL,	'2025-02-06 20:55:17.847+00',	NULL,	128462,	1200,	680,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.844+00'),
('0fb8ec8a-4d7a-4900-9db0-2232f620b35c',	'local',	'0fb8ec8a-4d7a-4900-9db0-2232f620b35c.jpg',	'burger_kebab.jpg',	'Burger Kebab',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.784+00',	NULL,	'2025-02-06 20:55:17.882+00',	NULL,	249733,	1279,	852,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.861+00'),
('1b207fd0-45c9-4bda-a5db-a0d2dc6cf984',	'local',	'1b207fd0-45c9-4bda-a5db-a0d2dc6cf984.jpg',	'ComptoIrlandais.jpg',	'Compto Irlandais',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.837+00',	NULL,	'2025-02-06 20:55:17.911+00',	NULL,	62816,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.904+00'),
('e87df09d-5184-4092-94b3-5d2a36ebcac7',	'local',	'e87df09d-5184-4092-94b3-5d2a36ebcac7.jpg',	'centre_européen_universitaire.jpg',	'Centre Européen Universitaire',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.817+00',	NULL,	'2025-02-06 20:55:17.923+00',	NULL,	333241,	1024,	422,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.919+00'),
('dbdd123b-5557-43c4-8de4-71a0a24116c8',	'local',	'dbdd123b-5557-43c4-8de4-71a0a24116c8.jpg',	'Faculte de Droit sciences economiques et gestion.jpg',	'Faculte De Droit Sciences Economiques Et Gestion',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.893+00',	NULL,	'2025-02-06 20:55:17.955+00',	NULL,	57240,	408,	306,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.949+00'),
('210a9381-92d6-48c3-8846-1f8289d31eb7',	'local',	'210a9381-92d6-48c3-8846-1f8289d31eb7.jpg',	'facultéDodontologie.jpg',	'Facultédodontologie',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.909+00',	NULL,	'2025-02-06 20:55:17.96+00',	NULL,	10764,	369,	136,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.956+00'),
('fb466a98-2aa0-425d-865b-9a729efcdcf6',	'local',	'fb466a98-2aa0-425d-865b-9a729efcdcf6.jpg',	'Domaine_et_Château_du_Charmois.jpg',	'Domaine Et Château Du Charmois',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.913+00',	NULL,	'2025-02-06 20:55:17.966+00',	NULL,	51666,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.96+00'),
('e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef',	'local',	'e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef.jpg',	'EcoleEuropéenned_Ingénieurs_enGénie_des_Matériaux.jpg',	'Ecole Européenned Ingénieurs En Génie Des Matériaux',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.924+00',	NULL,	'2025-02-06 20:55:17.975+00',	NULL,	55930,	640,	480,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:17.967+00'),
('1fec3bb7-5aac-4474-8e36-7e8ea7537e55',	'local',	'1fec3bb7-5aac-4474-8e36-7e8ea7537e55.jpg',	'faculte_sciences.jpg',	'Faculte Sciences',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.959+00',	NULL,	'2025-02-06 20:55:18.041+00',	NULL,	98988,	640,	425,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.039+00'),
('e5e962c1-fd7b-4c50-8b07-317406fd2933',	'local',	'e5e962c1-fd7b-4c50-8b07-317406fd2933.jpg',	'foodies_burger.jpg',	'Foodies Burger',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:17.957+00',	NULL,	'2025-02-06 20:55:18.044+00',	NULL,	107678,	1280,	852,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.042+00'),
('387223ab-cf55-4d08-bed0-c7d1868ac0e8',	'local',	'387223ab-cf55-4d08-bed0-c7d1868ac0e8.jpg',	'GreenKebab.jpg',	'Green Kebab',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.017+00',	NULL,	'2025-02-06 20:55:18.074+00',	NULL,	84640,	1024,	576,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.067+00'),
('0374151e-342f-4943-aa7e-5ebc224829fa',	'local',	'0374151e-342f-4943-aa7e-5ebc224829fa.jpg',	'Institut_Européen_du_Cinéma_et_de_lAudiovisuel.jpg',	'Institut Européen Du Cinéma Et De L Audiovisuel',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.022+00',	NULL,	'2025-02-06 20:55:18.086+00',	NULL,	219664,	1600,	1200,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.081+00'),
('c2aef6d9-8569-4296-8fba-b554ded565ef',	'local',	'c2aef6d9-8569-4296-8fba-b554ded565ef.jpg',	'Jardin_Dominique_Alexandre_Godron.jpg',	'Jardin Dominique Alexandre Godron',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.04+00',	NULL,	'2025-02-06 20:55:18.092+00',	NULL,	105658,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.087+00'),
('66574d82-cfef-4b1a-8346-563cea295afa',	'local',	'66574d82-cfef-4b1a-8346-563cea295afa.jpg',	'five_guys.jpg',	'Five Guys',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.038+00',	NULL,	'2025-02-06 20:55:18.104+00',	NULL,	271114,	1600,	997,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.099+00'),
('fd4dbe84-edb0-4f26-953f-e78b9a8148d2',	'local',	'fd4dbe84-edb0-4f26-953f-e78b9a8148d2.jpg',	'GalléCristallerie.jpg',	'Gallécristallerie',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.068+00',	NULL,	'2025-02-06 20:55:18.12+00',	NULL,	5727,	120,	85,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.11+00'),
('382aac3c-e895-4d47-8807-ab2c9c821c70',	'local',	'382aac3c-e895-4d47-8807-ab2c9c821c70.jpg',	'Jardin_du_Belvedere.jpg',	'Jardin Du Belvedere',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.077+00',	NULL,	'2025-02-06 20:55:18.158+00',	NULL,	89824,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.154+00'),
('e06903a4-9e50-440f-a8ae-89a4896a3760',	'local',	'e06903a4-9e50-440f-a8ae-89a4896a3760.jpg',	'JardinDeau.jpg',	'Jardin Deau',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.106+00',	NULL,	'2025-02-06 20:55:18.175+00',	NULL,	121936,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.172+00'),
('eef713a3-5211-43fb-99f6-3c0043850e87',	'local',	'eef713a3-5211-43fb-99f6-3c0043850e87.jpg',	'jass.jpg',	'Jass',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.132+00',	NULL,	'2025-02-06 20:55:18.188+00',	NULL,	29742,	351,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.185+00'),
('055ab0e0-8a92-41dc-9b5d-64a617ba31bd',	'local',	'055ab0e0-8a92-41dc-9b5d-64a617ba31bd.jpg',	'iae-nancy-school-of-management-.jpg',	'Iae Nancy School of Management ',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.157+00',	NULL,	'2025-02-06 20:55:18.201+00',	NULL,	49490,	529,	298,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.192+00'),
('cced8498-0372-417c-9e9c-46f2d5b51d12',	'local',	'cced8498-0372-417c-9e9c-46f2d5b51d12.jpg',	'LaRoseraie.jpg',	'La Roseraie',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.159+00',	NULL,	'2025-02-06 20:55:18.215+00',	NULL,	123520,	800,	600,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.196+00'),
('d30c5c73-f57b-41a9-a5a1-a6a0822219c5',	'local',	'd30c5c73-f57b-41a9-a5a1-a6a0822219c5.png',	'LEGO.png',	'Lego',	'image/png',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.168+00',	NULL,	'2025-02-06 20:55:18.236+00',	NULL,	29462,	229,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.229+00'),
('bacbd383-6652-4a00-b291-9ef6cf6933b2',	'local',	'bacbd383-6652-4a00-b291-9ef6cf6933b2.JPG',	'Nancy_-_Porte_de_la_Craffe_20131007-01.JPG',	'Nancy   Porte De La Craffe 20131007 01',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.187+00',	NULL,	'2025-02-06 20:55:18.276+00',	NULL,	5476,	118,	120,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.271+00'),
('1edecadd-6209-42e6-8ea8-525a09bbf38f',	'local',	'1edecadd-6209-42e6-8ea8-525a09bbf38f.jpg',	'made-in-france.jpg',	'Made in France',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.221+00',	NULL,	'2025-02-06 20:55:18.296+00',	NULL,	91663,	640,	481,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.293+00'),
('46d64354-3977-400c-9dc2-21a04ccc04f1',	'local',	'46d64354-3977-400c-9dc2-21a04ccc04f1.jpg',	'Nancy_brabois.jpg',	'Nancy Brabois',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.238+00',	NULL,	'2025-02-06 20:55:18.312+00',	NULL,	85970,	800,	572,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.302+00'),
('e82c61a9-4be6-4647-a29e-e16b5418973a',	'local',	'e82c61a9-4be6-4647-a29e-e16b5418973a.jpg',	'nancy_charlemagne.jpg',	'Nancy Charlemagne',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.315+00',	NULL,	'2025-02-06 20:55:18.367+00',	NULL,	168158,	1200,	680,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.362+00'),
('b45b34a1-defa-486d-8b52-51f15e4a62ca',	'local',	'b45b34a1-defa-486d-8b52-51f15e4a62ca.JPG',	'Nancy_-_4_place_Maginot.JPG',	'Nancy   4 Place Maginot',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.275+00',	NULL,	'2025-02-06 20:55:18.379+00',	NULL,	540524,	1920,	1440,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.368+00'),
('9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596',	'local',	'9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596.jpg',	'Parc_Charles_III.jpg',	'Parc Charles Iii',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.35+00',	NULL,	'2025-02-06 20:55:18.405+00',	NULL,	54284,	535,	397,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.397+00'),
('72c4d2be-e76c-4864-801c-825ebdf4d9a4',	'local',	'72c4d2be-e76c-4864-801c-825ebdf4d9a4.jpg',	'Nancy_BW_2015-07-18_13-13-45.jpg',	'Nancy Bw 2015 07 18 13 13 45',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.333+00',	NULL,	'2025-02-06 20:55:18.403+00',	NULL,	3529,	69,	119,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.394+00'),
('6dcae1cb-0db7-4117-b722-2ef265ac0dc6',	'local',	'6dcae1cb-0db7-4117-b722-2ef265ac0dc6.jpg',	'pepiniere.jpg',	'Pepiniere',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.395+00',	NULL,	'2025-02-06 20:55:18.452+00',	NULL,	48358,	680,	382,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.449+00'),
('89017ea3-c34c-4eaf-829a-b052a5adb00e',	'local',	'89017ea3-c34c-4eaf-829a-b052a5adb00e.jpg',	'Printemps_Nancy.jpg',	'Printemps Nancy',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.435+00',	NULL,	'2025-02-06 20:55:18.478+00',	NULL,	34374,	340,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.475+00'),
('37a4c703-1fbf-4649-8e4d-a9a7be875303',	'local',	'37a4c703-1fbf-4649-8e4d-a9a7be875303.jpg',	'Voyou_Delivery.jpg',	'Voyou Delivery',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.541+00',	NULL,	'2025-02-06 20:55:18.563+00',	NULL,	65311,	450,	450,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.561+00'),
('4f9d31c9-a26c-4f4b-9823-c4eea6c8f902',	'local',	'4f9d31c9-a26c-4f4b-9823-c4eea6c8f902.jpg',	'Nancy_Cathedral_BW_2015-07-18_16-31-28.jpg',	'Nancy Cathedral Bw 2015 07 18 16 31 28',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.278+00',	NULL,	'2025-02-06 20:55:18.349+00',	NULL,	196371,	1024,	1198,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.339+00'),
('7f10017f-5c26-4905-90d2-460b72476ed9',	'local',	'7f10017f-5c26-4905-90d2-460b72476ed9.jpg',	'pokawa.jpg',	'Pokawa',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.408+00',	NULL,	'2025-02-06 20:55:18.468+00',	NULL,	198666,	1280,	852,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.465+00'),
('38e102f9-cda8-4a7f-8e9b-38a010daf52b',	'local',	'38e102f9-cda8-4a7f-8e9b-38a010daf52b.jpg',	'Sainte-Marie.jpg',	'Sainte Marie',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.45+00',	NULL,	'2025-02-06 20:55:18.486+00',	NULL,	80312,	680,	435,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.482+00'),
('8cce8533-e622-47b5-a116-a1bef26c2f8c',	'local',	'8cce8533-e622-47b5-a116-a1bef26c2f8c.jpg',	'Temple_protestant.jpg',	'Temple Protestant',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.543+00',	NULL,	'2025-02-06 20:55:18.562+00',	NULL,	6069,	90,	120,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.56+00'),
('ccbc35e7-2e07-49f7-ac4e-48b85eeb2147',	'local',	'ccbc35e7-2e07-49f7-ac4e-48b85eeb2147.jpg',	'Nancy_Saint-Epvre_BW_2015-07-18_10-42-10.jpg',	'Nancy Saint Epvre Bw 2015 07 18 10 42 10',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.291+00',	NULL,	'2025-02-06 20:55:18.355+00',	NULL,	8750,	150,	180,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.353+00'),
('16106068-98e3-4273-93cb-62455c3eb25a',	'local',	'16106068-98e3-4273-93cb-62455c3eb25a.png',	'Polytech.png',	'Polytech',	'image/png',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.389+00',	NULL,	'2025-02-06 20:55:18.569+00',	NULL,	1609757,	1514,	852,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.564+00'),
('5228db5d-ef5b-48c5-a4be-f2841e3fcc26',	'local',	'5228db5d-ef5b-48c5-a4be-f2841e3fcc26.png',	'RiceandCurry.png',	'Riceand Curry',	'image/png',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.449+00',	NULL,	'2025-02-06 20:55:18.497+00',	NULL,	66404,	800,	600,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.49+00'),
('f738364c-aa7e-415d-b8a5-c4fac9afa71d',	'local',	'f738364c-aa7e-415d-b8a5-c4fac9afa71d.png',	'saint-seb.png',	'Saint Seb',	'image/png',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.477+00',	NULL,	'2025-02-06 20:55:18.545+00',	NULL,	66896,	680,	453,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.543+00'),
('87bf3509-283e-4db2-94ff-9c7690edea24',	'local',	'87bf3509-283e-4db2-94ff-9c7690edea24.jpg',	'snipes.jpg',	'Snipes',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-06 20:55:18.516+00',	NULL,	'2025-02-06 20:55:18.561+00',	NULL,	70726,	680,	495,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-06 20:55:18.559+00'),
('fcfb48c2-e432-4e24-870e-cb246b86fd37',	'local',	'fcfb48c2-e432-4e24-870e-cb246b86fd37.png',	'Jardin Botanique Jean-Marie Pelt.png',	'Jardin Botanique Jean Marie Pelt',	'image/png',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:03:22.883+00',	NULL,	'2025-02-07 09:03:22.935+00',	NULL,	115684,	680,	510,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-07 09:03:22.935+00'),
('4d07e99f-5780-4d2f-8847-ded2982a206c',	'local',	'4d07e99f-5780-4d2f-8847-ded2982a206c.jpg',	'parc_d''agrement.jpg',	'Parc D''agrement',	'image/jpeg',	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:33:04.515+00',	NULL,	'2025-02-07 09:33:04.533+00',	NULL,	13278,	299,	168,	NULL,	NULL,	NULL,	NULL,	NULL,	'{}',	NULL,	NULL,	NULL,	NULL,	'2025-02-07 09:33:04.531+00');

DROP TABLE IF EXISTS "directus_flows";
CREATE TABLE "public"."directus_flows" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "icon" character varying(64),
    "color" character varying(255),
    "description" text,
    "status" character varying(255) DEFAULT 'active' NOT NULL,
    "trigger" character varying(255),
    "accountability" character varying(255) DEFAULT 'all',
    "options" json,
    "operation" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_flows_operation_unique" UNIQUE ("operation"),
    CONSTRAINT "directus_flows_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_folders";
CREATE TABLE "public"."directus_folders" (
    "id" uuid NOT NULL,
    "name" character varying(255) NOT NULL,
    "parent" uuid,
    CONSTRAINT "directus_folders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_migrations";
CREATE TABLE "public"."directus_migrations" (
    "version" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "directus_migrations_pkey" PRIMARY KEY ("version")
) WITH (oids = false);

INSERT INTO "directus_migrations" ("version", "name", "timestamp") VALUES
('20201028A',	'Remove Collection Foreign Keys',	'2025-02-06 20:23:58.984717+00'),
('20201029A',	'Remove System Relations',	'2025-02-06 20:23:58.990532+00'),
('20201029B',	'Remove System Collections',	'2025-02-06 20:23:58.996494+00'),
('20201029C',	'Remove System Fields',	'2025-02-06 20:23:59.00478+00'),
('20201105A',	'Add Cascade System Relations',	'2025-02-06 20:23:59.040578+00'),
('20201105B',	'Change Webhook URL Type',	'2025-02-06 20:23:59.0521+00'),
('20210225A',	'Add Relations Sort Field',	'2025-02-06 20:23:59.059466+00'),
('20210304A',	'Remove Locked Fields',	'2025-02-06 20:23:59.063562+00'),
('20210312A',	'Webhooks Collections Text',	'2025-02-06 20:23:59.071007+00'),
('20210331A',	'Add Refresh Interval',	'2025-02-06 20:23:59.075565+00'),
('20210415A',	'Make Filesize Nullable',	'2025-02-06 20:23:59.094347+00'),
('20210416A',	'Add Collections Accountability',	'2025-02-06 20:23:59.101042+00'),
('20210422A',	'Remove Files Interface',	'2025-02-06 20:23:59.105341+00'),
('20210506A',	'Rename Interfaces',	'2025-02-06 20:23:59.126758+00'),
('20210510A',	'Restructure Relations',	'2025-02-06 20:23:59.142218+00'),
('20210518A',	'Add Foreign Key Constraints',	'2025-02-06 20:23:59.149216+00'),
('20210519A',	'Add System Fk Triggers',	'2025-02-06 20:23:59.173454+00'),
('20210521A',	'Add Collections Icon Color',	'2025-02-06 20:23:59.176951+00'),
('20210525A',	'Add Insights',	'2025-02-06 20:23:59.187499+00'),
('20210608A',	'Add Deep Clone Config',	'2025-02-06 20:23:59.191604+00'),
('20210626A',	'Change Filesize Bigint',	'2025-02-06 20:23:59.200881+00'),
('20210716A',	'Add Conditions to Fields',	'2025-02-06 20:23:59.2056+00'),
('20210721A',	'Add Default Folder',	'2025-02-06 20:23:59.211799+00'),
('20210802A',	'Replace Groups',	'2025-02-06 20:23:59.216712+00'),
('20210803A',	'Add Required to Fields',	'2025-02-06 20:23:59.220152+00'),
('20210805A',	'Update Groups',	'2025-02-06 20:23:59.224475+00'),
('20210805B',	'Change Image Metadata Structure',	'2025-02-06 20:23:59.229458+00'),
('20210811A',	'Add Geometry Config',	'2025-02-06 20:23:59.232933+00'),
('20210831A',	'Remove Limit Column',	'2025-02-06 20:23:59.23689+00'),
('20210903A',	'Add Auth Provider',	'2025-02-06 20:23:59.249032+00'),
('20210907A',	'Webhooks Collections Not Null',	'2025-02-06 20:23:59.255587+00'),
('20210910A',	'Move Module Setup',	'2025-02-06 20:23:59.260311+00'),
('20210920A',	'Webhooks URL Not Null',	'2025-02-06 20:23:59.26736+00'),
('20210924A',	'Add Collection Organization',	'2025-02-06 20:23:59.272181+00'),
('20210927A',	'Replace Fields Group',	'2025-02-06 20:23:59.279411+00'),
('20210927B',	'Replace M2M Interface',	'2025-02-06 20:23:59.282314+00'),
('20210929A',	'Rename Login Action',	'2025-02-06 20:23:59.285337+00'),
('20211007A',	'Update Presets',	'2025-02-06 20:23:59.292512+00'),
('20211009A',	'Add Auth Data',	'2025-02-06 20:23:59.296127+00'),
('20211016A',	'Add Webhook Headers',	'2025-02-06 20:23:59.29968+00'),
('20211103A',	'Set Unique to User Token',	'2025-02-06 20:23:59.303522+00'),
('20211103B',	'Update Special Geometry',	'2025-02-06 20:23:59.306886+00'),
('20211104A',	'Remove Collections Listing',	'2025-02-06 20:23:59.310425+00'),
('20211118A',	'Add Notifications',	'2025-02-06 20:23:59.319206+00'),
('20211211A',	'Add Shares',	'2025-02-06 20:23:59.331217+00'),
('20211230A',	'Add Project Descriptor',	'2025-02-06 20:23:59.334879+00'),
('20220303A',	'Remove Default Project Color',	'2025-02-06 20:23:59.343059+00'),
('20220308A',	'Add Bookmark Icon and Color',	'2025-02-06 20:23:59.347722+00'),
('20220314A',	'Add Translation Strings',	'2025-02-06 20:23:59.352224+00'),
('20220322A',	'Rename Field Typecast Flags',	'2025-02-06 20:23:59.361251+00'),
('20220323A',	'Add Field Validation',	'2025-02-06 20:23:59.37974+00'),
('20220325A',	'Fix Typecast Flags',	'2025-02-06 20:23:59.392798+00'),
('20220325B',	'Add Default Language',	'2025-02-06 20:23:59.406554+00'),
('20220402A',	'Remove Default Value Panel Icon',	'2025-02-06 20:23:59.418583+00'),
('20220429A',	'Add Flows',	'2025-02-06 20:23:59.451339+00'),
('20220429B',	'Add Color to Insights Icon',	'2025-02-06 20:23:59.455525+00'),
('20220429C',	'Drop Non Null From IP of Activity',	'2025-02-06 20:23:59.461416+00'),
('20220429D',	'Drop Non Null From Sender of Notifications',	'2025-02-06 20:23:59.465797+00'),
('20220614A',	'Rename Hook Trigger to Event',	'2025-02-06 20:23:59.469747+00'),
('20220801A',	'Update Notifications Timestamp Column',	'2025-02-06 20:23:59.478401+00'),
('20220802A',	'Add Custom Aspect Ratios',	'2025-02-06 20:23:59.483078+00'),
('20220826A',	'Add Origin to Accountability',	'2025-02-06 20:23:59.489522+00'),
('20230401A',	'Update Material Icons',	'2025-02-06 20:23:59.499099+00'),
('20230525A',	'Add Preview Settings',	'2025-02-06 20:23:59.504554+00'),
('20230526A',	'Migrate Translation Strings',	'2025-02-06 20:23:59.513131+00'),
('20230721A',	'Require Shares Fields',	'2025-02-06 20:23:59.52046+00'),
('20230823A',	'Add Content Versioning',	'2025-02-06 20:23:59.534972+00'),
('20230927A',	'Themes',	'2025-02-06 20:23:59.550049+00'),
('20231009A',	'Update CSV Fields to Text',	'2025-02-06 20:23:59.555127+00'),
('20231009B',	'Update Panel Options',	'2025-02-06 20:23:59.558848+00'),
('20231010A',	'Add Extensions',	'2025-02-06 20:23:59.564705+00'),
('20231215A',	'Add Focalpoints',	'2025-02-06 20:23:59.569612+00'),
('20240122A',	'Add Report URL Fields',	'2025-02-06 20:23:59.57436+00'),
('20240204A',	'Marketplace',	'2025-02-06 20:23:59.603641+00'),
('20240305A',	'Change Useragent Type',	'2025-02-06 20:23:59.616656+00'),
('20240311A',	'Deprecate Webhooks',	'2025-02-06 20:23:59.626665+00'),
('20240422A',	'Public Registration',	'2025-02-06 20:23:59.633818+00'),
('20240515A',	'Add Session Window',	'2025-02-06 20:23:59.638003+00'),
('20240701A',	'Add Tus Data',	'2025-02-06 20:23:59.642257+00'),
('20240716A',	'Update Files Date Fields',	'2025-02-06 20:23:59.648977+00'),
('20240806A',	'Permissions Policies',	'2025-02-06 20:23:59.678549+00'),
('20240817A',	'Update Icon Fields Length',	'2025-02-06 20:23:59.719571+00'),
('20240909A',	'Separate Comments',	'2025-02-06 20:23:59.727057+00'),
('20240909B',	'Consolidate Content Versioning',	'2025-02-06 20:23:59.73056+00'),
('20240924A',	'Migrate Legacy Comments',	'2025-02-06 20:23:59.738355+00'),
('20240924B',	'Populate Versioning Deltas',	'2025-02-06 20:23:59.742869+00');

DROP TABLE IF EXISTS "directus_notifications";
DROP SEQUENCE IF EXISTS directus_notifications_id_seq;
CREATE SEQUENCE directus_notifications_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_notifications" (
    "id" integer DEFAULT nextval('directus_notifications_id_seq') NOT NULL,
    "timestamp" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "status" character varying(255) DEFAULT 'inbox',
    "recipient" uuid NOT NULL,
    "sender" uuid,
    "subject" character varying(255) NOT NULL,
    "message" text,
    "collection" character varying(64),
    "item" character varying(255),
    CONSTRAINT "directus_notifications_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_operations";
CREATE TABLE "public"."directus_operations" (
    "id" uuid NOT NULL,
    "name" character varying(255),
    "key" character varying(255) NOT NULL,
    "type" character varying(255) NOT NULL,
    "position_x" integer NOT NULL,
    "position_y" integer NOT NULL,
    "options" json,
    "resolve" uuid,
    "reject" uuid,
    "flow" uuid NOT NULL,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_operations_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "directus_operations_reject_unique" UNIQUE ("reject"),
    CONSTRAINT "directus_operations_resolve_unique" UNIQUE ("resolve")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_panels";
CREATE TABLE "public"."directus_panels" (
    "id" uuid NOT NULL,
    "dashboard" uuid NOT NULL,
    "name" character varying(255),
    "icon" character varying(64),
    "color" character varying(10),
    "show_header" boolean DEFAULT false NOT NULL,
    "note" text,
    "type" character varying(255) NOT NULL,
    "position_x" integer NOT NULL,
    "position_y" integer NOT NULL,
    "width" integer NOT NULL,
    "height" integer NOT NULL,
    "options" json,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    CONSTRAINT "directus_panels_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_permissions";
DROP SEQUENCE IF EXISTS directus_permissions_id_seq;
CREATE SEQUENCE directus_permissions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_permissions" (
    "id" integer DEFAULT nextval('directus_permissions_id_seq') NOT NULL,
    "collection" character varying(64) NOT NULL,
    "action" character varying(10) NOT NULL,
    "permissions" json,
    "validation" json,
    "presets" json,
    "fields" text,
    "policy" uuid NOT NULL,
    CONSTRAINT "directus_permissions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_permissions" ("id", "collection", "action", "permissions", "validation", "presets", "fields", "policy") VALUES
(1,	'lieux',	'create',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(2,	'lieux',	'read',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(3,	'lieux',	'update',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(4,	'lieux',	'delete',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(5,	'lieux',	'share',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(6,	'lieux_files',	'create',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(7,	'lieux_files',	'read',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(8,	'lieux_files',	'update',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(9,	'lieux_files',	'delete',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(10,	'lieux_files',	'share',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(11,	'directus_collections',	'create',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(12,	'directus_collections',	'read',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(13,	'directus_collections',	'update',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(14,	'directus_collections',	'delete',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(15,	'directus_collections',	'share',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(16,	'directus_fields',	'create',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(17,	'directus_fields',	'read',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(18,	'directus_fields',	'update',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(19,	'directus_fields',	'delete',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(20,	'directus_fields',	'share',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(21,	'directus_files',	'create',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(22,	'directus_files',	'read',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(23,	'directus_files',	'update',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(24,	'directus_files',	'delete',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17'),
(25,	'directus_files',	'share',	NULL,	NULL,	NULL,	'*',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17');

DROP TABLE IF EXISTS "directus_policies";
CREATE TABLE "public"."directus_policies" (
    "id" uuid NOT NULL,
    "name" character varying(100) NOT NULL,
    "icon" character varying(64) DEFAULT 'badge' NOT NULL,
    "description" text,
    "ip_access" text,
    "enforce_tfa" boolean DEFAULT false NOT NULL,
    "admin_access" boolean DEFAULT false NOT NULL,
    "app_access" boolean DEFAULT false NOT NULL,
    CONSTRAINT "directus_policies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_policies" ("id", "name", "icon", "description", "ip_access", "enforce_tfa", "admin_access", "app_access") VALUES
('c9ea2441-186a-4060-bcf5-c7bcd443282b',	'Administrator',	'verified',	'$t:admin_description',	NULL,	'f',	't',	't'),
('abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'$t:public_label',	'public',	'$t:public_description',	NULL,	'f',	'f',	'f');

DROP TABLE IF EXISTS "directus_presets";
DROP SEQUENCE IF EXISTS directus_presets_id_seq;
CREATE SEQUENCE directus_presets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_presets" (
    "id" integer DEFAULT nextval('directus_presets_id_seq') NOT NULL,
    "bookmark" character varying(255),
    "user" uuid,
    "role" uuid,
    "collection" character varying(64),
    "search" character varying(100),
    "layout" character varying(100) DEFAULT 'tabular',
    "layout_query" json,
    "layout_options" json,
    "refresh_interval" integer,
    "filter" json,
    "icon" character varying(64) DEFAULT 'bookmark',
    "color" character varying(255),
    CONSTRAINT "directus_presets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_presets" ("id", "bookmark", "user", "role", "collection", "search", "layout", "layout_query", "layout_options", "refresh_interval", "filter", "icon", "color") VALUES
(4,	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	NULL,	'lieux_files',	NULL,	NULL,	'{"tabular":{"fields":["id","lieux_id","directus_files_id"],"page":2}}',	'{"tabular":{"widths":{"directus_files_id":471}}}',	NULL,	NULL,	'bookmark',	NULL),
(5,	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	NULL,	'directus_files',	NULL,	'cards',	'{"cards":{"sort":["-uploaded_on"],"page":2}}',	'{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}',	NULL,	NULL,	'bookmark',	NULL),
(3,	NULL,	'c687c13d-984b-42fb-bcde-694ff68e23d2',	NULL,	'lieux',	NULL,	NULL,	'{"tabular":{"fields":["categorie","latitude","longitude","ville","photo","id","nom"],"page":2}}',	NULL,	NULL,	NULL,	'bookmark',	NULL);

DROP TABLE IF EXISTS "directus_relations";
DROP SEQUENCE IF EXISTS directus_relations_id_seq;
CREATE SEQUENCE directus_relations_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_relations" (
    "id" integer DEFAULT nextval('directus_relations_id_seq') NOT NULL,
    "many_collection" character varying(64) NOT NULL,
    "many_field" character varying(64) NOT NULL,
    "one_collection" character varying(64),
    "one_field" character varying(64),
    "one_collection_field" character varying(64),
    "one_allowed_collections" text,
    "junction_field" character varying(64),
    "sort_field" character varying(64),
    "one_deselect_action" character varying(255) DEFAULT 'nullify' NOT NULL,
    CONSTRAINT "directus_relations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_relations" ("id", "many_collection", "many_field", "one_collection", "one_field", "one_collection_field", "one_allowed_collections", "junction_field", "sort_field", "one_deselect_action") VALUES
(3,	'lieux_files',	'directus_files_id',	'directus_files',	NULL,	NULL,	NULL,	'lieux_id',	NULL,	'nullify'),
(4,	'lieux_files',	'lieux_id',	'lieux',	'photo',	NULL,	NULL,	'directus_files_id',	NULL,	'nullify');

DROP TABLE IF EXISTS "directus_revisions";
DROP SEQUENCE IF EXISTS directus_revisions_id_seq;
CREATE SEQUENCE directus_revisions_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_revisions" (
    "id" integer DEFAULT nextval('directus_revisions_id_seq') NOT NULL,
    "activity" integer NOT NULL,
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "data" json,
    "delta" json,
    "parent" integer,
    "version" uuid,
    CONSTRAINT "directus_revisions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_revisions" ("id", "activity", "collection", "item", "data", "delta", "parent", "version") VALUES
(1,	2,	'directus_fields',	'1',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	NULL,	NULL),
(2,	3,	'directus_collections',	'lieux',	'{"singleton":false,"collection":"lieux"}',	'{"singleton":false,"collection":"lieux"}',	NULL,	NULL),
(3,	4,	'directus_fields',	'2',	'{"sort":2,"interface":"input","special":null,"collection":"lieux","field":"categorie"}',	'{"sort":2,"interface":"input","special":null,"collection":"lieux","field":"categorie"}',	NULL,	NULL),
(4,	5,	'directus_fields',	'3',	'{"sort":3,"interface":"input","special":null,"collection":"lieux","field":"longitude"}',	'{"sort":3,"interface":"input","special":null,"collection":"lieux","field":"longitude"}',	NULL,	NULL),
(5,	6,	'directus_fields',	'4',	'{"sort":4,"interface":"input","special":null,"collection":"lieux","field":"latitude"}',	'{"sort":4,"interface":"input","special":null,"collection":"lieux","field":"latitude"}',	NULL,	NULL),
(6,	7,	'directus_fields',	'5',	'{"sort":5,"interface":"input","special":null,"collection":"lieux","field":"ville"}',	'{"sort":5,"interface":"input","special":null,"collection":"lieux","field":"ville"}',	NULL,	NULL),
(7,	8,	'directus_fields',	'6',	'{"sort":6,"interface":"input","special":null,"collection":"lieux","field":"nom"}',	'{"sort":6,"interface":"input","special":null,"collection":"lieux","field":"nom"}',	NULL,	NULL),
(8,	9,	'directus_fields',	'1',	'{"id":1,"collection":"lieux","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"id","sort":1,"group":null}',	NULL,	NULL),
(9,	10,	'directus_fields',	'2',	'{"id":2,"collection":"lieux","field":"categorie","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"categorie","sort":2,"group":null}',	NULL,	NULL),
(10,	11,	'directus_fields',	'4',	'{"id":4,"collection":"lieux","field":"latitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"latitude","sort":3,"group":null}',	NULL,	NULL),
(11,	12,	'directus_fields',	'3',	'{"id":3,"collection":"lieux","field":"longitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"longitude","sort":4,"group":null}',	NULL,	NULL),
(12,	13,	'directus_fields',	'5',	'{"id":5,"collection":"lieux","field":"ville","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"ville","sort":5,"group":null}',	NULL,	NULL),
(13,	14,	'directus_fields',	'6',	'{"id":6,"collection":"lieux","field":"nom","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"nom","sort":6,"group":null}',	NULL,	NULL),
(14,	15,	'directus_fields',	'1',	'{"id":1,"collection":"lieux","field":"id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"id","sort":1,"group":null}',	NULL,	NULL),
(15,	16,	'directus_fields',	'2',	'{"id":2,"collection":"lieux","field":"categorie","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"categorie","sort":2,"group":null}',	NULL,	NULL),
(16,	17,	'directus_fields',	'3',	'{"id":3,"collection":"lieux","field":"longitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":3,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"longitude","sort":3,"group":null}',	NULL,	NULL),
(17,	18,	'directus_fields',	'4',	'{"id":4,"collection":"lieux","field":"latitude","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":4,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"latitude","sort":4,"group":null}',	NULL,	NULL),
(18,	19,	'directus_fields',	'5',	'{"id":5,"collection":"lieux","field":"ville","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":5,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"ville","sort":5,"group":null}',	NULL,	NULL),
(19,	20,	'directus_fields',	'6',	'{"id":6,"collection":"lieux","field":"nom","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":6,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}',	'{"collection":"lieux","field":"nom","sort":6,"group":null}',	NULL,	NULL),
(20,	21,	'directus_fields',	'7',	'{"sort":7,"interface":"files","special":["files"],"collection":"lieux","field":"photo"}',	'{"sort":7,"interface":"files","special":["files"],"collection":"lieux","field":"photo"}',	NULL,	NULL),
(21,	22,	'directus_fields',	'8',	'{"sort":1,"hidden":true,"field":"id","collection":"lieux_files"}',	'{"sort":1,"hidden":true,"field":"id","collection":"lieux_files"}',	NULL,	NULL),
(22,	23,	'directus_collections',	'lieux_files',	'{"hidden":true,"icon":"import_export","collection":"lieux_files"}',	'{"hidden":true,"icon":"import_export","collection":"lieux_files"}',	NULL,	NULL),
(23,	24,	'directus_fields',	'9',	'{"sort":2,"hidden":true,"collection":"lieux_files","field":"lieux_id"}',	'{"sort":2,"hidden":true,"collection":"lieux_files","field":"lieux_id"}',	NULL,	NULL),
(24,	25,	'directus_fields',	'10',	'{"sort":3,"hidden":true,"collection":"lieux_files","field":"directus_files_id"}',	'{"sort":3,"hidden":true,"collection":"lieux_files","field":"directus_files_id"}',	NULL,	NULL),
(227,	282,	'directus_fields',	'15',	'{"sort":4,"interface":"input","special":null,"collection":"lieux","field":"latitude"}',	'{"sort":4,"interface":"input","special":null,"collection":"lieux","field":"latitude"}',	NULL,	NULL),
(25,	26,	'directus_policies',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'{"id":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","name":"$t:public_label","icon":"public","description":"$t:public_description","ip_access":null,"enforce_tfa":false,"admin_access":true,"app_access":false,"permissions":[],"users":["e1c71c3f-bee0-42fe-be04-f4d58668f078"],"roles":["e1c71c3f-bee0-42fe-be04-f4d58668f078"]}',	'{"admin_access":true}',	NULL,	NULL),
(26,	27,	'directus_collections',	'lieux_files',	'{"collection":"lieux_files","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}',	'{"hidden":false}',	NULL,	NULL),
(228,	283,	'directus_fields',	'16',	'{"sort":5,"interface":"input","special":null,"collection":"lieux","field":"ville"}',	'{"sort":5,"interface":"input","special":null,"collection":"lieux","field":"ville"}',	NULL,	NULL),
(229,	284,	'directus_fields',	'17',	'{"sort":6,"interface":"input","special":null,"collection":"lieux","field":"nom"}',	'{"sort":6,"interface":"input","special":null,"collection":"lieux","field":"nom"}',	NULL,	NULL),
(278,	333,	'directus_fields',	'18',	'{"sort":7,"interface":"files","special":["files"],"collection":"lieux","field":"photo"}',	'{"sort":7,"interface":"files","special":["files"],"collection":"lieux","field":"photo"}',	NULL,	NULL),
(279,	334,	'directus_fields',	'19',	'{"sort":1,"hidden":true,"field":"id","collection":"lieux_files"}',	'{"sort":1,"hidden":true,"field":"id","collection":"lieux_files"}',	NULL,	NULL),
(280,	335,	'directus_collections',	'lieux_files',	'{"hidden":true,"icon":"import_export","collection":"lieux_files"}',	'{"hidden":true,"icon":"import_export","collection":"lieux_files"}',	NULL,	NULL),
(281,	336,	'directus_fields',	'20',	'{"sort":2,"hidden":true,"collection":"lieux_files","field":"lieux_id"}',	'{"sort":2,"hidden":true,"collection":"lieux_files","field":"lieux_id"}',	NULL,	NULL),
(282,	337,	'directus_fields',	'21',	'{"sort":3,"hidden":true,"collection":"lieux_files","field":"directus_files_id"}',	'{"sort":3,"hidden":true,"collection":"lieux_files","field":"directus_files_id"}',	NULL,	NULL),
(283,	338,	'directus_collections',	'lieux_files',	'{"collection":"lieux_files","icon":"import_export","note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}',	'{"hidden":false}',	NULL,	NULL),
(284,	339,	'lieux_files',	'1',	'{"lieux_id":"1","directus_files_id":{"id":"1fbba087-a9aa-4ff4-a1a9-d75977ac6460"}}',	'{"lieux_id":"1","directus_files_id":{"id":"1fbba087-a9aa-4ff4-a1a9-d75977ac6460"}}',	NULL,	NULL),
(298,	367,	'lieux_files',	'15',	'{"lieux_id":"15","directus_files_id":{"id":"055ab0e0-8a92-41dc-9b5d-64a617ba31bd"}}',	'{"lieux_id":"15","directus_files_id":{"id":"055ab0e0-8a92-41dc-9b5d-64a617ba31bd"}}',	NULL,	NULL),
(308,	387,	'lieux_files',	'25',	'{"lieux_id":"25","directus_files_id":{"id":"387223ab-cf55-4d08-bed0-c7d1868ac0e8"}}',	'{"lieux_id":"25","directus_files_id":{"id":"387223ab-cf55-4d08-bed0-c7d1868ac0e8"}}',	NULL,	NULL),
(309,	389,	'lieux_files',	'26',	'{"lieux_id":"26","directus_files_id":{"id":"67570c38-da82-41d1-9db1-f6bdc16949e5"}}',	'{"lieux_id":"26","directus_files_id":{"id":"67570c38-da82-41d1-9db1-f6bdc16949e5"}}',	NULL,	NULL),
(317,	405,	'lieux_files',	'34',	'{"lieux_id":"34","directus_files_id":{"id":"89017ea3-c34c-4eaf-829a-b052a5adb00e"}}',	'{"lieux_id":"34","directus_files_id":{"id":"89017ea3-c34c-4eaf-829a-b052a5adb00e"}}',	NULL,	NULL),
(320,	411,	'lieux_files',	'37',	'{"lieux_id":"37","directus_files_id":{"id":"1b207fd0-45c9-4bda-a5db-a0d2dc6cf984"}}',	'{"lieux_id":"37","directus_files_id":{"id":"1b207fd0-45c9-4bda-a5db-a0d2dc6cf984"}}',	NULL,	NULL),
(328,	427,	'lieux_files',	'45',	'{"lieux_id":"45","directus_files_id":{"id":"e06903a4-9e50-440f-a8ae-89a4896a3760"}}',	'{"lieux_id":"45","directus_files_id":{"id":"e06903a4-9e50-440f-a8ae-89a4896a3760"}}',	NULL,	NULL),
(360,	463,	'lieux',	'49',	'{"categorie":"Parc","longitude":"6.1552545","latitude":"48.6625643","ville":"Nancy","nom":"Jardin Botanique Jean-Marie Pelt","photo":{"create":[{"lieux_id":"+","directus_files_id":{"id":"fcfb48c2-e432-4e24-870e-cb246b86fd37"}}],"update":[],"delete":[]}}',	'{"categorie":"Parc","longitude":"6.1552545","latitude":"48.6625643","ville":"Nancy","nom":"Jardin Botanique Jean-Marie Pelt","photo":{"create":[{"lieux_id":"+","directus_files_id":{"id":"fcfb48c2-e432-4e24-870e-cb246b86fd37"}}],"update":[],"delete":[]}}',	NULL,	NULL),
(359,	462,	'lieux_files',	'49',	'{"lieux_id":49,"directus_files_id":{"id":"fcfb48c2-e432-4e24-870e-cb246b86fd37"}}',	'{"lieux_id":49,"directus_files_id":{"id":"fcfb48c2-e432-4e24-870e-cb246b86fd37"}}',	360,	NULL),
(230,	285,	'lieux',	'1',	'{"categorie":"Monument","longitude":"6.18275","latitude":"48.694306","ville":"Nancy","nom":"Arc Héré"}',	'{"categorie":"Monument","longitude":"6.18275","latitude":"48.694306","ville":"Nancy","nom":"Arc Héré"}',	NULL,	NULL),
(231,	286,	'lieux',	'2',	'{"categorie":"Monument","longitude":"6.1803072","latitude":"48.6965855","ville":"Nancy","nom":"Nancy Saint-Epvre"}',	'{"categorie":"Monument","longitude":"6.1803072","latitude":"48.6965855","ville":"Nancy","nom":"Nancy Saint-Epvre"}',	NULL,	NULL),
(232,	287,	'lieux',	'3',	'{"categorie":"Monument","longitude":"6.1855486","latitude":"48.6918687","ville":"Nancy","nom":"Cathédrale Notre-Dame-de-l''Annonciation"}',	'{"categorie":"Monument","longitude":"6.1855486","latitude":"48.6918687","ville":"Nancy","nom":"Cathédrale Notre-Dame-de-l''Annonciation"}',	NULL,	NULL),
(233,	288,	'lieux',	'4',	'{"categorie":"Monument","longitude":"6.1675878","latitude":"48.686626","ville":"Nancy","nom":"Commanderie Saint-Jean-du-Vieil-Aître"}',	'{"categorie":"Monument","longitude":"6.1675878","latitude":"48.686626","ville":"Nancy","nom":"Commanderie Saint-Jean-du-Vieil-Aître"}',	NULL,	NULL),
(234,	289,	'lieux',	'5',	'{"categorie":"Monument","longitude":"6.1793714","latitude":"48.679947","ville":"Nancy","nom":"Établissement d''Émile Gallé"}',	'{"categorie":"Monument","longitude":"6.1793714","latitude":"48.679947","ville":"Nancy","nom":"Établissement d''Émile Gallé"}',	NULL,	NULL),
(235,	290,	'lieux',	'6',	'{"categorie":"Monument","longitude":"6.1779966","latitude":"48.6986534","ville":"Nancy","nom":"Porte de la Craffe"}',	'{"categorie":"Monument","longitude":"6.1779966","latitude":"48.6986534","ville":"Nancy","nom":"Porte de la Craffe"}',	NULL,	NULL),
(236,	291,	'lieux',	'7',	'{"categorie":"Monument","longitude":"6.1834332","latitude":"48.6933232","ville":"Nancy","nom":"Place Stanislas"}',	'{"categorie":"Monument","longitude":"6.1834332","latitude":"48.6933232","ville":"Nancy","nom":"Place Stanislas"}',	NULL,	NULL),
(237,	292,	'lieux',	'8',	'{"categorie":"Monument","longitude":"6.178198","latitude":"48.6898844","ville":"Nancy","nom":"Temple protestant de Nancy"}',	'{"categorie":"Monument","longitude":"6.178198","latitude":"48.6898844","ville":"Nancy","nom":"Temple protestant de Nancy"}',	NULL,	NULL),
(238,	293,	'lieux',	'9',	'{"categorie":"Monument","longitude":"6.178285","latitude":"48.6893755","ville":"Nancy","nom":"Banque Charles Renauld"}',	'{"categorie":"Monument","longitude":"6.178285","latitude":"48.6893755","ville":"Nancy","nom":"Banque Charles Renauld"}',	NULL,	NULL),
(239,	294,	'lieux',	'10',	'{"categorie":"Monument","longitude":"6.1772529","latitude":"48.6896","ville":"Nancy","nom":"Banque SNVB"}',	'{"categorie":"Monument","longitude":"6.1772529","latitude":"48.6896","ville":"Nancy","nom":"Banque SNVB"}',	NULL,	NULL),
(240,	295,	'lieux',	'11',	'{"categorie":"ecole","longitude":"6.161971","latitude":"48.6832288","ville":"Nancy","nom":"IUT Nancy-Charlemagne"}',	'{"categorie":"ecole","longitude":"6.161971","latitude":"48.6832288","ville":"Nancy","nom":"IUT Nancy-Charlemagne"}',	NULL,	NULL),
(241,	296,	'lieux',	'12',	'{"categorie":"ecole","longitude":"6.1517384","latitude":"48.660013","ville":"Nancy","nom":"Iut Nancy-Brabois"}',	'{"categorie":"ecole","longitude":"6.1517384","latitude":"48.660013","ville":"Nancy","nom":"Iut Nancy-Brabois"}',	NULL,	NULL),
(242,	297,	'lieux',	'13',	'{"categorie":"ecole","longitude":"6.1885486","latitude":"48.6598459","ville":"Nancy","nom":"Polytech Nancy"}',	'{"categorie":"ecole","longitude":"6.1885486","latitude":"48.6598459","ville":"Nancy","nom":"Polytech Nancy"}',	NULL,	NULL),
(243,	298,	'lieux',	'14',	'{"categorie":"ecole","longitude":"6.1589926","latitude":"48.6669704","ville":"Nancy","nom":"Faculté des Sciences et Technologies Nancy"}',	'{"categorie":"ecole","longitude":"6.1589926","latitude":"48.6669704","ville":"Nancy","nom":"Faculté des Sciences et Technologies Nancy"}',	NULL,	NULL),
(244,	299,	'lieux',	'15',	'{"categorie":"ecole","longitude":"6.1718599","latitude":"48.6975363","ville":"Nancy","nom":"IAE Nancy école Universitaire de management"}',	'{"categorie":"ecole","longitude":"6.1718599","latitude":"48.6975363","ville":"Nancy","nom":"IAE Nancy école Universitaire de management"}',	NULL,	NULL),
(245,	300,	'lieux',	'16',	'{"categorie":"ecole","longitude":"6.1769844","latitude":"48.692992","ville":"Nancy","nom":"Faculte de Droit sciences economiques et gestion"}',	'{"categorie":"ecole","longitude":"6.1769844","latitude":"48.692992","ville":"Nancy","nom":"Faculte de Droit sciences economiques et gestion"}',	NULL,	NULL),
(246,	301,	'lieux',	'17',	'{"categorie":"ecole","longitude":"6.1766223","latitude":"48.6934953","ville":"Nancy","nom":"centre européen universitaire"}',	'{"categorie":"ecole","longitude":"6.1766223","latitude":"48.6934953","ville":"Nancy","nom":"centre européen universitaire"}',	NULL,	NULL),
(247,	302,	'lieux',	'18',	'{"categorie":"ecole","longitude":"6.1427061","latitude":"48.6510349","ville":"Nancy","nom":"faculté d''odontologie"}',	'{"categorie":"ecole","longitude":"6.1427061","latitude":"48.6510349","ville":"Nancy","nom":"faculté d''odontologie"}',	NULL,	NULL),
(248,	303,	'lieux',	'19',	'{"categorie":"ecole","longitude":"6.1936218","latitude":"48.6957736","ville":"Nancy","nom":"Ecole Européenne d''Ingénieurs en Génie des Matériaux"}',	'{"categorie":"ecole","longitude":"6.1936218","latitude":"48.6957736","ville":"Nancy","nom":"Ecole Européenne d''Ingénieurs en Génie des Matériaux"}',	NULL,	NULL),
(249,	304,	'lieux',	'20',	'{"categorie":"ecole","longitude":"6.1721733","latitude":"48.6971154","ville":"Nancy","nom":"Institut Européen du Cinéma et de l''Audiovisuel"}',	'{"categorie":"ecole","longitude":"6.1721733","latitude":"48.6971154","ville":"Nancy","nom":"Institut Européen du Cinéma et de l''Audiovisuel"}',	NULL,	NULL),
(250,	305,	'lieux',	'21',	'{"categorie":"Fast food","longitude":"6.1854075","latitude":"48.6896406","ville":"Nancy","nom":"foodies burger"}',	'{"categorie":"Fast food","longitude":"6.1854075","latitude":"48.6896406","ville":"Nancy","nom":"foodies burger"}',	NULL,	NULL),
(251,	306,	'lieux',	'22',	'{"categorie":"Fast food","longitude":"6.1837812","latitude":"48.6900766","ville":"Nancy","nom":"Voyou Delivery"}',	'{"categorie":"Fast food","longitude":"6.1837812","latitude":"48.6900766","ville":"Nancy","nom":"Voyou Delivery"}',	NULL,	NULL),
(252,	307,	'lieux',	'23',	'{"categorie":"Fast food","longitude":"6.1728704","latitude":"48.6903745","ville":"Nancy","nom":"Rice and Curry"}',	'{"categorie":"Fast food","longitude":"6.1728704","latitude":"48.6903745","ville":"Nancy","nom":"Rice and Curry"}',	NULL,	NULL),
(253,	308,	'lieux',	'24',	'{"categorie":"Fast food","longitude":"6.1711804","latitude":"48.6740372","ville":"Nancy","nom":"Bonidé"}',	'{"categorie":"Fast food","longitude":"6.1711804","latitude":"48.6740372","ville":"Nancy","nom":"Bonidé"}',	NULL,	NULL),
(254,	309,	'lieux',	'25',	'{"categorie":"Fast food","longitude":"6.1840356","latitude":"48.6886593","ville":"Nancy","nom":"Green Kebab"}',	'{"categorie":"Fast food","longitude":"6.1840356","latitude":"48.6886593","ville":"Nancy","nom":"Green Kebab"}',	NULL,	NULL),
(255,	310,	'lieux',	'26',	'{"categorie":"Fast food","longitude":"6.1843143","latitude":"48.6904101","ville":"Nancy","nom":"Asia Wok"}',	'{"categorie":"Fast food","longitude":"6.1843143","latitude":"48.6904101","ville":"Nancy","nom":"Asia Wok"}',	NULL,	NULL),
(256,	311,	'lieux',	'27',	'{"categorie":"Fast food","longitude":"6.1761438","latitude":"48.6893167","ville":"Nancy","nom":"Burger Kebab"}',	'{"categorie":"Fast food","longitude":"6.1761438","latitude":"48.6893167","ville":"Nancy","nom":"Burger Kebab"}',	NULL,	NULL),
(257,	312,	'lieux',	'28',	'{"categorie":"Fast food","longitude":"6.1815256","latitude":"48.6893391","ville":"Nancy","nom":"Pokawa"}',	'{"categorie":"Fast food","longitude":"6.1815256","latitude":"48.6893391","ville":"Nancy","nom":"Pokawa"}',	NULL,	NULL),
(258,	313,	'lieux',	'29',	'{"categorie":"Fast food","longitude":"6.1792033","latitude":"48.6966367","ville":"Nancy","nom":"made in france"}',	'{"categorie":"Fast food","longitude":"6.1792033","latitude":"48.6966367","ville":"Nancy","nom":"made in france"}',	NULL,	NULL),
(259,	314,	'lieux',	'30',	'{"categorie":"Fast food","longitude":"6.1830834","latitude":"48.6898507","ville":"Nancy","nom":"Five Guys"}',	'{"categorie":"Fast food","longitude":"6.1830834","latitude":"48.6898507","ville":"Nancy","nom":"Five Guys"}',	NULL,	NULL),
(260,	315,	'lieux',	'31',	'{"categorie":"Magasin","longitude":"6.1814435","latitude":"48.6888106","ville":"Nancy","nom":"Saint Sébastien"}',	'{"categorie":"Magasin","longitude":"6.1814435","latitude":"48.6888106","ville":"Nancy","nom":"Saint Sébastien"}',	NULL,	NULL),
(261,	316,	'lieux',	'32',	'{"categorie":"Magasin","longitude":"6.2207768","latitude":"48.6855104","ville":"Nancy","nom":"Auchan Hypermarché"}',	'{"categorie":"Magasin","longitude":"6.2207768","latitude":"48.6855104","ville":"Nancy","nom":"Auchan Hypermarché"}',	NULL,	NULL),
(262,	317,	'lieux',	'33',	'{"categorie":"Magasin","longitude":"6.1761183","latitude":"48.6613595","ville":"Nancy","nom":"centre commerciale les nations"}',	'{"categorie":"Magasin","longitude":"6.1761183","latitude":"48.6613595","ville":"Nancy","nom":"centre commerciale les nations"}',	NULL,	NULL),
(263,	318,	'lieux',	'34',	'{"categorie":"Magasin","longitude":"6.1763422","latitude":"48.6894079","ville":"Nancy","nom":"Printemps Nancy"}',	'{"categorie":"Magasin","longitude":"6.1763422","latitude":"48.6894079","ville":"Nancy","nom":"Printemps Nancy"}',	NULL,	NULL),
(264,	319,	'lieux',	'35',	'{"categorie":"Magasin","longitude":"6.1839106","latitude":"48.6901134","ville":"Nancy","nom":"La Caverne du Gobelin"}',	'{"categorie":"Magasin","longitude":"6.1839106","latitude":"48.6901134","ville":"Nancy","nom":"La Caverne du Gobelin"}',	NULL,	NULL),
(265,	320,	'lieux',	'36',	'{"categorie":"Magasin","longitude":"6.1828913","latitude":"48.6909836","ville":"Nancy","nom":"The LEGO® Certified Store"}',	'{"categorie":"Magasin","longitude":"6.1828913","latitude":"48.6909836","ville":"Nancy","nom":"The LEGO® Certified Store"}',	NULL,	NULL),
(266,	321,	'lieux',	'37',	'{"categorie":"Magasin","longitude":"6.1841596","latitude":"48.6884899","ville":"Nancy","nom":"Le comptoir Irlandais"}',	'{"categorie":"Magasin","longitude":"6.1841596","latitude":"48.6884899","ville":"Nancy","nom":"Le comptoir Irlandais"}',	NULL,	NULL),
(267,	322,	'lieux',	'38',	'{"categorie":"Magasin","longitude":"6.1816782","latitude":"48.6899451","ville":"Nancy","nom":"À l''Ombre des Marques"}',	'{"categorie":"Magasin","longitude":"6.1816782","latitude":"48.6899451","ville":"Nancy","nom":"À l''Ombre des Marques"}',	NULL,	NULL),
(268,	323,	'lieux',	'39',	'{"categorie":"Magasin","longitude":"6.1802466","latitude":"48.69012","ville":"Nancy","nom":"Snipes"}',	'{"categorie":"Magasin","longitude":"6.1802466","latitude":"48.69012","ville":"Nancy","nom":"Snipes"}',	NULL,	NULL),
(269,	324,	'lieux',	'40',	'{"categorie":"Magasin","longitude":"6.1805757","latitude":"48.6933388","ville":"Nancy","nom":"Jass"}',	'{"categorie":"Magasin","longitude":"6.1805757","latitude":"48.6933388","ville":"Nancy","nom":"Jass"}',	NULL,	NULL),
(270,	325,	'lieux',	'41',	'{"categorie":"Parc","longitude":"6.1896376","latitude":"48.6947803","ville":"Nancy","nom":"Jardin Dominique Alexandre Godron"}',	'{"categorie":"Parc","longitude":"6.1896376","latitude":"48.6947803","ville":"Nancy","nom":"Jardin Dominique Alexandre Godron"}',	NULL,	NULL),
(271,	326,	'lieux',	'42',	'{"categorie":"Parc","longitude":"6.1851428","latitude":"48.6979955","ville":"Nancy","nom":"Parc de la Pépinière"}',	'{"categorie":"Parc","longitude":"6.1851428","latitude":"48.6979955","ville":"Nancy","nom":"Parc de la Pépinière"}',	NULL,	NULL),
(272,	327,	'lieux',	'43',	'{"categorie":"Parc","longitude":"6.170953","latitude":"48.6815382","ville":"Nancy","nom":"Parc Sainte-Marie de Nancy"}',	'{"categorie":"Parc","longitude":"6.170953","latitude":"48.6815382","ville":"Nancy","nom":"Parc Sainte-Marie de Nancy"}',	NULL,	NULL),
(273,	328,	'lieux',	'44',	'{"categorie":"Parc","longitude":"6.189867","latitude":"48.6890104","ville":"Nancy","nom":"Parc Charles III"}',	'{"categorie":"Parc","longitude":"6.189867","latitude":"48.6890104","ville":"Nancy","nom":"Parc Charles III"}',	NULL,	NULL),
(274,	329,	'lieux',	'45',	'{"categorie":"Parc","longitude":"6.1938402","latitude":"48.6936363","ville":"Nancy","nom":"Jardin d''eau"}',	'{"categorie":"Parc","longitude":"6.1938402","latitude":"48.6936363","ville":"Nancy","nom":"Jardin d''eau"}',	NULL,	NULL),
(275,	330,	'lieux',	'46',	'{"categorie":"Parc","longitude":"6.154209","latitude":"48.6908079","ville":"Nancy","nom":"Jardin du Belvédère"}',	'{"categorie":"Parc","longitude":"6.154209","latitude":"48.6908079","ville":"Nancy","nom":"Jardin du Belvédère"}',	NULL,	NULL),
(276,	331,	'lieux',	'47',	'{"categorie":"Parc","longitude":"6.1742817","latitude":"48.6684332","ville":"Nancy","nom":"Domaine et Château du Charmois"}',	'{"categorie":"Parc","longitude":"6.1742817","latitude":"48.6684332","ville":"Nancy","nom":"Domaine et Château du Charmois"}',	NULL,	NULL),
(277,	332,	'lieux',	'48',	'{"categorie":"Parc","longitude":"6.183001","latitude":"48.6984113","ville":"Nancy","nom":"La Roseraie"}',	'{"categorie":"Parc","longitude":"6.183001","latitude":"48.6984113","ville":"Nancy","nom":"La Roseraie"}',	NULL,	NULL),
(303,	377,	'lieux_files',	'20',	'{"lieux_id":"20","directus_files_id":{"id":"0374151e-342f-4943-aa7e-5ebc224829fa"}}',	'{"lieux_id":"20","directus_files_id":{"id":"0374151e-342f-4943-aa7e-5ebc224829fa"}}',	NULL,	NULL),
(305,	381,	'lieux_files',	'22',	'{"lieux_id":"22","directus_files_id":{"id":"37a4c703-1fbf-4649-8e4d-a9a7be875303"}}',	'{"lieux_id":"22","directus_files_id":{"id":"37a4c703-1fbf-4649-8e4d-a9a7be875303"}}',	NULL,	NULL),
(307,	385,	'lieux_files',	'24',	'{"lieux_id":"24","directus_files_id":{"id":"6edd6994-ef18-45f3-8afd-656f44603a46"}}',	'{"lieux_id":"24","directus_files_id":{"id":"6edd6994-ef18-45f3-8afd-656f44603a46"}}',	NULL,	NULL),
(319,	409,	'lieux_files',	'36',	'{"lieux_id":"36","directus_files_id":{"id":"d30c5c73-f57b-41a9-a5a1-a6a0822219c5"}}',	'{"lieux_id":"36","directus_files_id":{"id":"d30c5c73-f57b-41a9-a5a1-a6a0822219c5"}}',	NULL,	NULL),
(322,	415,	'lieux_files',	'39',	'{"lieux_id":"39","directus_files_id":{"id":"87bf3509-283e-4db2-94ff-9c7690edea24"}}',	'{"lieux_id":"39","directus_files_id":{"id":"87bf3509-283e-4db2-94ff-9c7690edea24"}}',	NULL,	NULL),
(325,	421,	'lieux_files',	'42',	'{"lieux_id":"42","directus_files_id":{"id":"6dcae1cb-0db7-4117-b722-2ef265ac0dc6"}}',	'{"lieux_id":"42","directus_files_id":{"id":"6dcae1cb-0db7-4117-b722-2ef265ac0dc6"}}',	NULL,	NULL),
(361,	464,	'directus_files',	'4d07e99f-5780-4d2f-8847-ded2982a206c',	'{"title":"Parc D''agrement","filename_download":"parc_d''agrement.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Parc D''agrement","filename_download":"parc_d''agrement.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(285,	341,	'lieux_files',	'2',	'{"lieux_id":"2","directus_files_id":{"id":"ccbc35e7-2e07-49f7-ac4e-48b85eeb2147"}}',	'{"lieux_id":"2","directus_files_id":{"id":"ccbc35e7-2e07-49f7-ac4e-48b85eeb2147"}}',	NULL,	NULL),
(123,	124,	'directus_files',	'a141e808-6ab9-4598-b03a-32657783a00b',	'{"title":"85px Tour De La Commanderie","filename_download":"85px-Tour_de_la_Commanderie.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"85px Tour De La Commanderie","filename_download":"85px-Tour_de_la_Commanderie.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(124,	125,	'directus_files',	'581bc14e-5421-49c3-80e3-3b3901758769',	'{"title":"120px La Place Stanislas   Nancy","filename_download":"120px-La_Place_Stanislas_-_nancy.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"120px La Place Stanislas   Nancy","filename_download":"120px-La_Place_Stanislas_-_nancy.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(125,	126,	'directus_files',	'9d9e72f0-3095-4534-8a64-305339046dc7',	'{"title":"A Lombre Des Marques","filename_download":"A_Lombre_des_marques.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"A Lombre Des Marques","filename_download":"A_Lombre_des_marques.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(126,	127,	'directus_files',	'67570c38-da82-41d1-9db1-f6bdc16949e5',	'{"title":"Asia Wok","filename_download":"asia-wok.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Asia Wok","filename_download":"asia-wok.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(127,	128,	'directus_files',	'1fbba087-a9aa-4ff4-a1a9-d75977ac6460',	'{"title":"Arc Héré, Place Stanislas, Nancy","filename_download":"Arc_Héré,_Place_Stanislas,_Nancy.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Arc Héré, Place Stanislas, Nancy","filename_download":"Arc_Héré,_Place_Stanislas,_Nancy.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(128,	129,	'directus_files',	'2c6e096b-5d8c-4c43-ab9f-fe0d0154065b',	'{"title":"Auchan","filename_download":"Auchan.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Auchan","filename_download":"Auchan.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(129,	130,	'directus_files',	'0fb8ec8a-4d7a-4900-9db0-2232f620b35c',	'{"title":"Burger Kebab","filename_download":"burger_kebab.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Burger Kebab","filename_download":"burger_kebab.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(130,	131,	'directus_files',	'6edd6994-ef18-45f3-8afd-656f44603a46',	'{"title":"Bonide","filename_download":"bonide.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Bonide","filename_download":"bonide.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(131,	132,	'directus_files',	'a8d4392a-1449-4819-ac01-9a5a52e6e355',	'{"title":"Caverne Du Goblin","filename_download":"CaverneDuGoblin.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Caverne Du Goblin","filename_download":"CaverneDuGoblin.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(138,	139,	'directus_files',	'e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef',	'{"title":"Ecole Européenned Ingénieurs En Génie Des Matériaux","filename_download":"EcoleEuropéenned_Ingénieurs_enGénie_des_Matériaux.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Ecole Européenned Ingénieurs En Génie Des Matériaux","filename_download":"EcoleEuropéenned_Ingénieurs_enGénie_des_Matériaux.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(140,	141,	'directus_files',	'e5e962c1-fd7b-4c50-8b07-317406fd2933',	'{"title":"Foodies Burger","filename_download":"foodies_burger.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Foodies Burger","filename_download":"foodies_burger.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(166,	167,	'directus_files',	'5228db5d-ef5b-48c5-a4be-f2841e3fcc26',	'{"title":"Riceand Curry","filename_download":"RiceandCurry.png","type":"image/png","storage":"local"}',	'{"title":"Riceand Curry","filename_download":"RiceandCurry.png","type":"image/png","storage":"local"}',	NULL,	NULL),
(167,	168,	'directus_files',	'f738364c-aa7e-415d-b8a5-c4fac9afa71d',	'{"title":"Saint Seb","filename_download":"saint-seb.png","type":"image/png","storage":"local"}',	'{"title":"Saint Seb","filename_download":"saint-seb.png","type":"image/png","storage":"local"}',	NULL,	NULL),
(168,	169,	'directus_files',	'87bf3509-283e-4db2-94ff-9c7690edea24',	'{"title":"Snipes","filename_download":"snipes.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Snipes","filename_download":"snipes.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(286,	343,	'lieux_files',	'3',	'{"lieux_id":"3","directus_files_id":{"id":"4f9d31c9-a26c-4f4b-9823-c4eea6c8f902"}}',	'{"lieux_id":"3","directus_files_id":{"id":"4f9d31c9-a26c-4f4b-9823-c4eea6c8f902"}}',	NULL,	NULL),
(357,	460,	'directus_policies',	'abf8a154-5b1c-4a46-ac9c-7300570f4f17',	'{"id":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","name":"$t:public_label","icon":"public","description":"$t:public_description","ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":false,"permissions":[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],"users":["e1c71c3f-bee0-42fe-be04-f4d58668f078"],"roles":["e1c71c3f-bee0-42fe-be04-f4d58668f078"]}',	'{"admin_access":false}',	NULL,	NULL),
(332,	435,	'directus_permissions',	'1',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"create"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"create"}',	357,	NULL),
(333,	436,	'directus_permissions',	'2',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"read"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"read"}',	357,	NULL),
(132,	133,	'directus_files',	'9e6bfa1b-8e1e-4b45-b7de-3179b031a91c',	'{"title":"Centre Commerciale Les Nations","filename_download":"centre_commerciale_les_nations.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Centre Commerciale Les Nations","filename_download":"centre_commerciale_les_nations.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(134,	135,	'directus_files',	'1b207fd0-45c9-4bda-a5db-a0d2dc6cf984',	'{"title":"Compto Irlandais","filename_download":"ComptoIrlandais.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Compto Irlandais","filename_download":"ComptoIrlandais.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(137,	138,	'directus_files',	'fb466a98-2aa0-425d-865b-9a729efcdcf6',	'{"title":"Domaine Et Château Du Charmois","filename_download":"Domaine_et_Château_du_Charmois.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Domaine Et Château Du Charmois","filename_download":"Domaine_et_Château_du_Charmois.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(141,	142,	'directus_files',	'387223ab-cf55-4d08-bed0-c7d1868ac0e8',	'{"title":"Green Kebab","filename_download":"GreenKebab.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Green Kebab","filename_download":"GreenKebab.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(145,	146,	'directus_files',	'fd4dbe84-edb0-4f26-953f-e78b9a8148d2',	'{"title":"Gallécristallerie","filename_download":"GalléCristallerie.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Gallécristallerie","filename_download":"GalléCristallerie.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(148,	149,	'directus_files',	'eef713a3-5211-43fb-99f6-3c0043850e87',	'{"title":"Jass","filename_download":"jass.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Jass","filename_download":"jass.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(155,	156,	'directus_files',	'b45b34a1-defa-486d-8b52-51f15e4a62ca',	'{"title":"Nancy   4 Place Maginot","filename_download":"Nancy_-_4_place_Maginot.JPG","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy   4 Place Maginot","filename_download":"Nancy_-_4_place_Maginot.JPG","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(160,	161,	'directus_files',	'9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596',	'{"title":"Parc Charles Iii","filename_download":"Parc_Charles_III.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Parc Charles Iii","filename_download":"Parc_Charles_III.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(161,	162,	'directus_files',	'16106068-98e3-4273-93cb-62455c3eb25a',	'{"title":"Polytech","filename_download":"Polytech.png","type":"image/png","storage":"local"}',	'{"title":"Polytech","filename_download":"Polytech.png","type":"image/png","storage":"local"}',	NULL,	NULL),
(287,	345,	'lieux_files',	'4',	'{"lieux_id":"4","directus_files_id":{"id":"a141e808-6ab9-4598-b03a-32657783a00b"}}',	'{"lieux_id":"4","directus_files_id":{"id":"a141e808-6ab9-4598-b03a-32657783a00b"}}',	NULL,	NULL),
(289,	349,	'lieux_files',	'6',	'{"lieux_id":"6","directus_files_id":{"id":"bacbd383-6652-4a00-b291-9ef6cf6933b2"}}',	'{"lieux_id":"6","directus_files_id":{"id":"bacbd383-6652-4a00-b291-9ef6cf6933b2"}}',	NULL,	NULL),
(290,	351,	'lieux_files',	'7',	'{"lieux_id":"7","directus_files_id":{"id":"581bc14e-5421-49c3-80e3-3b3901758769"}}',	'{"lieux_id":"7","directus_files_id":{"id":"581bc14e-5421-49c3-80e3-3b3901758769"}}',	NULL,	NULL),
(291,	353,	'lieux_files',	'8',	'{"lieux_id":"8","directus_files_id":{"id":"8cce8533-e622-47b5-a116-a1bef26c2f8c"}}',	'{"lieux_id":"8","directus_files_id":{"id":"8cce8533-e622-47b5-a116-a1bef26c2f8c"}}',	NULL,	NULL),
(297,	365,	'lieux_files',	'14',	'{"lieux_id":"14","directus_files_id":{"id":"1fec3bb7-5aac-4474-8e36-7e8ea7537e55"}}',	'{"lieux_id":"14","directus_files_id":{"id":"1fec3bb7-5aac-4474-8e36-7e8ea7537e55"}}',	NULL,	NULL),
(299,	369,	'lieux_files',	'16',	'{"lieux_id":"16","directus_files_id":{"id":"dbdd123b-5557-43c4-8de4-71a0a24116c8"}}',	'{"lieux_id":"16","directus_files_id":{"id":"dbdd123b-5557-43c4-8de4-71a0a24116c8"}}',	NULL,	NULL),
(301,	373,	'lieux_files',	'18',	'{"lieux_id":"18","directus_files_id":{"id":"210a9381-92d6-48c3-8846-1f8289d31eb7"}}',	'{"lieux_id":"18","directus_files_id":{"id":"210a9381-92d6-48c3-8846-1f8289d31eb7"}}',	NULL,	NULL),
(327,	425,	'lieux_files',	'44',	'{"lieux_id":"44","directus_files_id":{"id":"9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596"}}',	'{"lieux_id":"44","directus_files_id":{"id":"9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596"}}',	NULL,	NULL),
(334,	437,	'directus_permissions',	'3',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"update"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"update"}',	357,	NULL),
(335,	438,	'directus_permissions',	'4',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"delete"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"delete"}',	357,	NULL),
(336,	439,	'directus_permissions',	'5',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"share"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux","action":"share"}',	357,	NULL),
(337,	440,	'directus_permissions',	'6',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"create"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"create"}',	357,	NULL),
(338,	441,	'directus_permissions',	'7',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"read"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"read"}',	357,	NULL),
(339,	442,	'directus_permissions',	'8',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"update"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"update"}',	357,	NULL),
(340,	443,	'directus_permissions',	'9',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"delete"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"delete"}',	357,	NULL),
(341,	444,	'directus_permissions',	'10',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"share"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"lieux_files","action":"share"}',	357,	NULL),
(133,	134,	'directus_files',	'e87df09d-5184-4092-94b3-5d2a36ebcac7',	'{"title":"Centre Européen Universitaire","filename_download":"centre_européen_universitaire.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Centre Européen Universitaire","filename_download":"centre_européen_universitaire.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(135,	136,	'directus_files',	'dbdd123b-5557-43c4-8de4-71a0a24116c8',	'{"title":"Faculte De Droit Sciences Economiques Et Gestion","filename_download":"Faculte de Droit sciences economiques et gestion.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Faculte De Droit Sciences Economiques Et Gestion","filename_download":"Faculte de Droit sciences economiques et gestion.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(136,	137,	'directus_files',	'210a9381-92d6-48c3-8846-1f8289d31eb7',	'{"title":"Facultédodontologie","filename_download":"facultéDodontologie.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Facultédodontologie","filename_download":"facultéDodontologie.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(139,	140,	'directus_files',	'1fec3bb7-5aac-4474-8e36-7e8ea7537e55',	'{"title":"Faculte Sciences","filename_download":"faculte_sciences.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Faculte Sciences","filename_download":"faculte_sciences.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(142,	143,	'directus_files',	'0374151e-342f-4943-aa7e-5ebc224829fa',	'{"title":"Institut Européen Du Cinéma Et De L Audiovisuel","filename_download":"Institut_Européen_du_Cinéma_et_de_lAudiovisuel.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Institut Européen Du Cinéma Et De L Audiovisuel","filename_download":"Institut_Européen_du_Cinéma_et_de_lAudiovisuel.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(144,	145,	'directus_files',	'c2aef6d9-8569-4296-8fba-b554ded565ef',	'{"title":"Jardin Dominique Alexandre Godron","filename_download":"Jardin_Dominique_Alexandre_Godron.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Jardin Dominique Alexandre Godron","filename_download":"Jardin_Dominique_Alexandre_Godron.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(146,	147,	'directus_files',	'382aac3c-e895-4d47-8807-ab2c9c821c70',	'{"title":"Jardin Du Belvedere","filename_download":"Jardin_du_Belvedere.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Jardin Du Belvedere","filename_download":"Jardin_du_Belvedere.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(149,	150,	'directus_files',	'055ab0e0-8a92-41dc-9b5d-64a617ba31bd',	'{"title":"Iae Nancy School of Management ","filename_download":"iae-nancy-school-of-management-.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Iae Nancy School of Management ","filename_download":"iae-nancy-school-of-management-.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(151,	152,	'directus_files',	'd30c5c73-f57b-41a9-a5a1-a6a0822219c5',	'{"title":"Lego","filename_download":"LEGO.png","type":"image/png","storage":"local"}',	'{"title":"Lego","filename_download":"LEGO.png","type":"image/png","storage":"local"}',	NULL,	NULL),
(152,	153,	'directus_files',	'bacbd383-6652-4a00-b291-9ef6cf6933b2',	'{"title":"Nancy   Porte De La Craffe 20131007 01","filename_download":"Nancy_-_Porte_de_la_Craffe_20131007-01.JPG","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy   Porte De La Craffe 20131007 01","filename_download":"Nancy_-_Porte_de_la_Craffe_20131007-01.JPG","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(154,	155,	'directus_files',	'46d64354-3977-400c-9dc2-21a04ccc04f1',	'{"title":"Nancy Brabois","filename_download":"Nancy_brabois.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy Brabois","filename_download":"Nancy_brabois.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(157,	158,	'directus_files',	'ccbc35e7-2e07-49f7-ac4e-48b85eeb2147',	'{"title":"Nancy Saint Epvre Bw 2015 07 18 10 42 10","filename_download":"Nancy_Saint-Epvre_BW_2015-07-18_10-42-10.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy Saint Epvre Bw 2015 07 18 10 42 10","filename_download":"Nancy_Saint-Epvre_BW_2015-07-18_10-42-10.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(159,	160,	'directus_files',	'72c4d2be-e76c-4864-801c-825ebdf4d9a4',	'{"title":"Nancy Bw 2015 07 18 13 13 45","filename_download":"Nancy_BW_2015-07-18_13-13-45.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy Bw 2015 07 18 13 13 45","filename_download":"Nancy_BW_2015-07-18_13-13-45.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(162,	163,	'directus_files',	'6dcae1cb-0db7-4117-b722-2ef265ac0dc6',	'{"title":"Pepiniere","filename_download":"pepiniere.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Pepiniere","filename_download":"pepiniere.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(164,	165,	'directus_files',	'89017ea3-c34c-4eaf-829a-b052a5adb00e',	'{"title":"Printemps Nancy","filename_download":"Printemps_Nancy.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Printemps Nancy","filename_download":"Printemps_Nancy.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(170,	170,	'directus_files',	'37a4c703-1fbf-4649-8e4d-a9a7be875303',	'{"title":"Voyou Delivery","filename_download":"Voyou_Delivery.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Voyou Delivery","filename_download":"Voyou_Delivery.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(288,	347,	'lieux_files',	'5',	'{"lieux_id":"5","directus_files_id":{"id":"fd4dbe84-edb0-4f26-953f-e78b9a8148d2"}}',	'{"lieux_id":"5","directus_files_id":{"id":"fd4dbe84-edb0-4f26-953f-e78b9a8148d2"}}',	NULL,	NULL),
(342,	445,	'directus_permissions',	'11',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"create"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"create"}',	357,	NULL),
(343,	446,	'directus_permissions',	'12',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"read"}',	357,	NULL),
(344,	447,	'directus_permissions',	'13',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"update"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"update"}',	357,	NULL),
(345,	448,	'directus_permissions',	'14',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"delete"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"delete"}',	357,	NULL),
(346,	449,	'directus_permissions',	'15',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"share"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_collections","action":"share"}',	357,	NULL),
(143,	144,	'directus_files',	'66574d82-cfef-4b1a-8346-563cea295afa',	'{"title":"Five Guys","filename_download":"five_guys.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Five Guys","filename_download":"five_guys.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(147,	148,	'directus_files',	'e06903a4-9e50-440f-a8ae-89a4896a3760',	'{"title":"Jardin Deau","filename_download":"JardinDeau.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Jardin Deau","filename_download":"JardinDeau.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(150,	151,	'directus_files',	'cced8498-0372-417c-9e9c-46f2d5b51d12',	'{"title":"La Roseraie","filename_download":"LaRoseraie.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"La Roseraie","filename_download":"LaRoseraie.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(153,	154,	'directus_files',	'1edecadd-6209-42e6-8ea8-525a09bbf38f',	'{"title":"Made in France","filename_download":"made-in-france.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Made in France","filename_download":"made-in-france.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(156,	157,	'directus_files',	'4f9d31c9-a26c-4f4b-9823-c4eea6c8f902',	'{"title":"Nancy Cathedral Bw 2015 07 18 16 31 28","filename_download":"Nancy_Cathedral_BW_2015-07-18_16-31-28.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy Cathedral Bw 2015 07 18 16 31 28","filename_download":"Nancy_Cathedral_BW_2015-07-18_16-31-28.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(158,	159,	'directus_files',	'e82c61a9-4be6-4647-a29e-e16b5418973a',	'{"title":"Nancy Charlemagne","filename_download":"nancy_charlemagne.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Nancy Charlemagne","filename_download":"nancy_charlemagne.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(163,	164,	'directus_files',	'7f10017f-5c26-4905-90d2-460b72476ed9',	'{"title":"Pokawa","filename_download":"pokawa.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Pokawa","filename_download":"pokawa.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(165,	166,	'directus_files',	'38e102f9-cda8-4a7f-8e9b-38a010daf52b',	'{"title":"Sainte Marie","filename_download":"Sainte-Marie.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Sainte Marie","filename_download":"Sainte-Marie.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(169,	171,	'directus_files',	'8cce8533-e622-47b5-a116-a1bef26c2f8c',	'{"title":"Temple Protestant","filename_download":"Temple_protestant.jpg","type":"image/jpeg","storage":"local"}',	'{"title":"Temple Protestant","filename_download":"Temple_protestant.jpg","type":"image/jpeg","storage":"local"}',	NULL,	NULL),
(292,	355,	'lieux_files',	'9',	'{"lieux_id":"9","directus_files_id":{"id":"72c4d2be-e76c-4864-801c-825ebdf4d9a4"}}',	'{"lieux_id":"9","directus_files_id":{"id":"72c4d2be-e76c-4864-801c-825ebdf4d9a4"}}',	NULL,	NULL),
(294,	359,	'lieux_files',	'11',	'{"lieux_id":"11","directus_files_id":{"id":"e82c61a9-4be6-4647-a29e-e16b5418973a"}}',	'{"lieux_id":"11","directus_files_id":{"id":"e82c61a9-4be6-4647-a29e-e16b5418973a"}}',	NULL,	NULL),
(304,	379,	'lieux_files',	'21',	'{"lieux_id":"21","directus_files_id":{"id":"e5e962c1-fd7b-4c50-8b07-317406fd2933"}}',	'{"lieux_id":"21","directus_files_id":{"id":"e5e962c1-fd7b-4c50-8b07-317406fd2933"}}',	NULL,	NULL),
(306,	383,	'lieux_files',	'23',	'{"lieux_id":"23","directus_files_id":{"id":"5228db5d-ef5b-48c5-a4be-f2841e3fcc26"}}',	'{"lieux_id":"23","directus_files_id":{"id":"5228db5d-ef5b-48c5-a4be-f2841e3fcc26"}}',	NULL,	NULL),
(312,	395,	'lieux_files',	'29',	'{"lieux_id":"29","directus_files_id":{"id":"1edecadd-6209-42e6-8ea8-525a09bbf38f"}}',	'{"lieux_id":"29","directus_files_id":{"id":"1edecadd-6209-42e6-8ea8-525a09bbf38f"}}',	NULL,	NULL),
(324,	419,	'lieux_files',	'41',	'{"lieux_id":"41","directus_files_id":{"id":"c2aef6d9-8569-4296-8fba-b554ded565ef"}}',	'{"lieux_id":"41","directus_files_id":{"id":"c2aef6d9-8569-4296-8fba-b554ded565ef"}}',	NULL,	NULL),
(331,	433,	'lieux_files',	'48',	'{"lieux_id":"48","directus_files_id":{"id":"cced8498-0372-417c-9e9c-46f2d5b51d12"}}',	'{"lieux_id":"48","directus_files_id":{"id":"cced8498-0372-417c-9e9c-46f2d5b51d12"}}',	NULL,	NULL),
(347,	450,	'directus_permissions',	'16',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"create"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"create"}',	357,	NULL),
(348,	451,	'directus_permissions',	'17',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"read"}',	357,	NULL),
(349,	452,	'directus_permissions',	'18',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"update"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"update"}',	357,	NULL),
(350,	453,	'directus_permissions',	'19',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"delete"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"delete"}',	357,	NULL),
(351,	454,	'directus_permissions',	'20',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"share"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_fields","action":"share"}',	357,	NULL),
(352,	455,	'directus_permissions',	'21',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"create"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"create"}',	357,	NULL),
(353,	456,	'directus_permissions',	'22',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"read"}',	357,	NULL),
(354,	457,	'directus_permissions',	'23',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"update"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"update"}',	357,	NULL),
(355,	458,	'directus_permissions',	'24',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"delete"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"delete"}',	357,	NULL),
(293,	357,	'lieux_files',	'10',	'{"lieux_id":"10","directus_files_id":{"id":"b45b34a1-defa-486d-8b52-51f15e4a62ca"}}',	'{"lieux_id":"10","directus_files_id":{"id":"b45b34a1-defa-486d-8b52-51f15e4a62ca"}}',	NULL,	NULL),
(295,	361,	'lieux_files',	'12',	'{"lieux_id":"12","directus_files_id":{"id":"46d64354-3977-400c-9dc2-21a04ccc04f1"}}',	'{"lieux_id":"12","directus_files_id":{"id":"46d64354-3977-400c-9dc2-21a04ccc04f1"}}',	NULL,	NULL),
(310,	391,	'lieux_files',	'27',	'{"lieux_id":"27","directus_files_id":{"id":"0fb8ec8a-4d7a-4900-9db0-2232f620b35c"}}',	'{"lieux_id":"27","directus_files_id":{"id":"0fb8ec8a-4d7a-4900-9db0-2232f620b35c"}}',	NULL,	NULL),
(311,	393,	'lieux_files',	'28',	'{"lieux_id":"28","directus_files_id":{"id":"7f10017f-5c26-4905-90d2-460b72476ed9"}}',	'{"lieux_id":"28","directus_files_id":{"id":"7f10017f-5c26-4905-90d2-460b72476ed9"}}',	NULL,	NULL),
(314,	399,	'lieux_files',	'31',	'{"lieux_id":"31","directus_files_id":{"id":"f738364c-aa7e-415d-b8a5-c4fac9afa71d"}}',	'{"lieux_id":"31","directus_files_id":{"id":"f738364c-aa7e-415d-b8a5-c4fac9afa71d"}}',	NULL,	NULL),
(315,	401,	'lieux_files',	'32',	'{"lieux_id":"32","directus_files_id":{"id":"2c6e096b-5d8c-4c43-ab9f-fe0d0154065b"}}',	'{"lieux_id":"32","directus_files_id":{"id":"2c6e096b-5d8c-4c43-ab9f-fe0d0154065b"}}',	NULL,	NULL),
(316,	403,	'lieux_files',	'33',	'{"lieux_id":"33","directus_files_id":{"id":"9e6bfa1b-8e1e-4b45-b7de-3179b031a91c"}}',	'{"lieux_id":"33","directus_files_id":{"id":"9e6bfa1b-8e1e-4b45-b7de-3179b031a91c"}}',	NULL,	NULL),
(318,	407,	'lieux_files',	'35',	'{"lieux_id":"35","directus_files_id":{"id":"a8d4392a-1449-4819-ac01-9a5a52e6e355"}}',	'{"lieux_id":"35","directus_files_id":{"id":"a8d4392a-1449-4819-ac01-9a5a52e6e355"}}',	NULL,	NULL),
(330,	431,	'lieux_files',	'47',	'{"lieux_id":"47","directus_files_id":{"id":"fb466a98-2aa0-425d-865b-9a729efcdcf6"}}',	'{"lieux_id":"47","directus_files_id":{"id":"fb466a98-2aa0-425d-865b-9a729efcdcf6"}}',	NULL,	NULL),
(356,	459,	'directus_permissions',	'25',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"share"}',	'{"policy":"abf8a154-5b1c-4a46-ac9c-7300570f4f17","permissions":null,"validation":null,"fields":["*"],"presets":null,"collection":"directus_files","action":"share"}',	357,	NULL),
(363,	466,	'lieux',	'50',	'{"categorie":"Parc","ville":"Nancy","nom":"parc d''agrément","longitude":"6.1315299","latitude":"48.6972179","photo":{"create":[{"lieux_id":"+","directus_files_id":{"id":"4d07e99f-5780-4d2f-8847-ded2982a206c"}}],"update":[],"delete":[]}}',	'{"categorie":"Parc","ville":"Nancy","nom":"parc d''agrément","longitude":"6.1315299","latitude":"48.6972179","photo":{"create":[{"lieux_id":"+","directus_files_id":{"id":"4d07e99f-5780-4d2f-8847-ded2982a206c"}}],"update":[],"delete":[]}}',	NULL,	NULL),
(362,	465,	'lieux_files',	'50',	'{"lieux_id":50,"directus_files_id":{"id":"4d07e99f-5780-4d2f-8847-ded2982a206c"}}',	'{"lieux_id":50,"directus_files_id":{"id":"4d07e99f-5780-4d2f-8847-ded2982a206c"}}',	363,	NULL),
(296,	363,	'lieux_files',	'13',	'{"lieux_id":"13","directus_files_id":{"id":"16106068-98e3-4273-93cb-62455c3eb25a"}}',	'{"lieux_id":"13","directus_files_id":{"id":"16106068-98e3-4273-93cb-62455c3eb25a"}}',	NULL,	NULL),
(300,	371,	'lieux_files',	'17',	'{"lieux_id":"17","directus_files_id":{"id":"e87df09d-5184-4092-94b3-5d2a36ebcac7"}}',	'{"lieux_id":"17","directus_files_id":{"id":"e87df09d-5184-4092-94b3-5d2a36ebcac7"}}',	NULL,	NULL),
(302,	375,	'lieux_files',	'19',	'{"lieux_id":"19","directus_files_id":{"id":"e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef"}}',	'{"lieux_id":"19","directus_files_id":{"id":"e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef"}}',	NULL,	NULL),
(221,	275,	'directus_fields',	'11',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	NULL,	NULL),
(222,	276,	'directus_collections',	'lieux',	'{"singleton":false,"collection":"lieux"}',	'{"singleton":false,"collection":"lieux"}',	NULL,	NULL),
(223,	278,	'directus_fields',	'12',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	'{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"lieux"}',	NULL,	NULL),
(224,	279,	'directus_collections',	'lieux',	'{"singleton":false,"collection":"lieux"}',	'{"singleton":false,"collection":"lieux"}',	NULL,	NULL),
(225,	280,	'directus_fields',	'13',	'{"sort":2,"interface":"input","special":null,"collection":"lieux","field":"categorie"}',	'{"sort":2,"interface":"input","special":null,"collection":"lieux","field":"categorie"}',	NULL,	NULL),
(226,	281,	'directus_fields',	'14',	'{"sort":3,"interface":"input","special":null,"collection":"lieux","field":"longitude"}',	'{"sort":3,"interface":"input","special":null,"collection":"lieux","field":"longitude"}',	NULL,	NULL),
(313,	397,	'lieux_files',	'30',	'{"lieux_id":"30","directus_files_id":{"id":"66574d82-cfef-4b1a-8346-563cea295afa"}}',	'{"lieux_id":"30","directus_files_id":{"id":"66574d82-cfef-4b1a-8346-563cea295afa"}}',	NULL,	NULL),
(321,	413,	'lieux_files',	'38',	'{"lieux_id":"38","directus_files_id":{"id":"9d9e72f0-3095-4534-8a64-305339046dc7"}}',	'{"lieux_id":"38","directus_files_id":{"id":"9d9e72f0-3095-4534-8a64-305339046dc7"}}',	NULL,	NULL),
(323,	417,	'lieux_files',	'40',	'{"lieux_id":"40","directus_files_id":{"id":"eef713a3-5211-43fb-99f6-3c0043850e87"}}',	'{"lieux_id":"40","directus_files_id":{"id":"eef713a3-5211-43fb-99f6-3c0043850e87"}}',	NULL,	NULL),
(326,	423,	'lieux_files',	'43',	'{"lieux_id":"43","directus_files_id":{"id":"38e102f9-cda8-4a7f-8e9b-38a010daf52b"}}',	'{"lieux_id":"43","directus_files_id":{"id":"38e102f9-cda8-4a7f-8e9b-38a010daf52b"}}',	NULL,	NULL),
(329,	429,	'lieux_files',	'46',	'{"lieux_id":"46","directus_files_id":{"id":"382aac3c-e895-4d47-8807-ab2c9c821c70"}}',	'{"lieux_id":"46","directus_files_id":{"id":"382aac3c-e895-4d47-8807-ab2c9c821c70"}}',	NULL,	NULL),
(358,	461,	'directus_files',	'fcfb48c2-e432-4e24-870e-cb246b86fd37',	'{"title":"Jardin Botanique Jean Marie Pelt","filename_download":"Jardin Botanique Jean-Marie Pelt.png","type":"image/png","storage":"local"}',	'{"title":"Jardin Botanique Jean Marie Pelt","filename_download":"Jardin Botanique Jean-Marie Pelt.png","type":"image/png","storage":"local"}',	NULL,	NULL);

DROP TABLE IF EXISTS "directus_roles";
CREATE TABLE "public"."directus_roles" (
    "id" uuid NOT NULL,
    "name" character varying(100) NOT NULL,
    "icon" character varying(64) DEFAULT 'supervised_user_circle' NOT NULL,
    "description" text,
    "parent" uuid,
    CONSTRAINT "directus_roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "directus_roles" ("id", "name", "icon", "description", "parent") VALUES
('bf6816e1-8d4c-42f4-94c3-10323eb36c2c',	'Administrator',	'verified',	'$t:admin_description',	NULL);

DROP TABLE IF EXISTS "directus_sessions";
CREATE TABLE "public"."directus_sessions" (
    "token" character varying(64) NOT NULL,
    "user" uuid,
    "expires" timestamptz NOT NULL,
    "ip" character varying(255),
    "user_agent" text,
    "share" uuid,
    "origin" character varying(255),
    "next_token" character varying(64),
    CONSTRAINT "directus_sessions_pkey" PRIMARY KEY ("token")
) WITH (oids = false);

INSERT INTO "directus_sessions" ("token", "user", "expires", "ip", "user_agent", "share", "origin", "next_token") VALUES
('YbwKdnfhziXWljn_eSfwa4MeE1_-7c-K78tAKsWH52e4PrIOMz4Ka521Uiq7sXM4',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-07 09:32:33.767+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	NULL,	'http://localhost:42058',	'a3ypwZfSV8aMnh-3U0j8jvz-8F1YGE7hRwx9AApeyJOuyXCIpdRM1QwcAjCcb8F6'),
('a3ypwZfSV8aMnh-3U0j8jvz-8F1YGE7hRwx9AApeyJOuyXCIpdRM1QwcAjCcb8F6',	'c687c13d-984b-42fb-bcde-694ff68e23d2',	'2025-02-08 09:32:23.767+00',	'192.168.192.1',	'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 OPR/116.0.0.0',	NULL,	'http://localhost:42058',	NULL);

DROP TABLE IF EXISTS "directus_settings";
DROP SEQUENCE IF EXISTS directus_settings_id_seq;
CREATE SEQUENCE directus_settings_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_settings" (
    "id" integer DEFAULT nextval('directus_settings_id_seq') NOT NULL,
    "project_name" character varying(100) DEFAULT 'Directus' NOT NULL,
    "project_url" character varying(255),
    "project_color" character varying(255) DEFAULT '#6644FF' NOT NULL,
    "project_logo" uuid,
    "public_foreground" uuid,
    "public_background" uuid,
    "public_note" text,
    "auth_login_attempts" integer DEFAULT '25',
    "auth_password_policy" character varying(100),
    "storage_asset_transform" character varying(7) DEFAULT 'all',
    "storage_asset_presets" json,
    "custom_css" text,
    "storage_default_folder" uuid,
    "basemaps" json,
    "mapbox_key" character varying(255),
    "module_bar" json,
    "project_descriptor" character varying(100),
    "default_language" character varying(255) DEFAULT 'en-US' NOT NULL,
    "custom_aspect_ratios" json,
    "public_favicon" uuid,
    "default_appearance" character varying(255) DEFAULT 'auto' NOT NULL,
    "default_theme_light" character varying(255),
    "theme_light_overrides" json,
    "default_theme_dark" character varying(255),
    "theme_dark_overrides" json,
    "report_error_url" character varying(255),
    "report_bug_url" character varying(255),
    "report_feature_url" character varying(255),
    "public_registration" boolean DEFAULT false NOT NULL,
    "public_registration_verify_email" boolean DEFAULT true NOT NULL,
    "public_registration_role" uuid,
    "public_registration_email_filter" json,
    CONSTRAINT "directus_settings_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_shares";
CREATE TABLE "public"."directus_shares" (
    "id" uuid NOT NULL,
    "name" character varying(255),
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "role" uuid,
    "password" character varying(255),
    "user_created" uuid,
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_start" timestamptz,
    "date_end" timestamptz,
    "times_used" integer DEFAULT '0',
    "max_uses" integer,
    CONSTRAINT "directus_shares_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_translations";
CREATE TABLE "public"."directus_translations" (
    "id" uuid NOT NULL,
    "language" character varying(255) NOT NULL,
    "key" character varying(255) NOT NULL,
    "value" text NOT NULL,
    CONSTRAINT "directus_translations_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_users";
CREATE TABLE "public"."directus_users" (
    "id" uuid NOT NULL,
    "first_name" character varying(50),
    "last_name" character varying(50),
    "email" character varying(128),
    "password" character varying(255),
    "location" character varying(255),
    "title" character varying(50),
    "description" text,
    "tags" json,
    "avatar" uuid,
    "language" character varying(255),
    "tfa_secret" character varying(255),
    "status" character varying(16) DEFAULT 'active' NOT NULL,
    "role" uuid,
    "token" character varying(255),
    "last_access" timestamptz,
    "last_page" character varying(255),
    "provider" character varying(128) DEFAULT 'default' NOT NULL,
    "external_identifier" character varying(255),
    "auth_data" json,
    "email_notifications" boolean DEFAULT true,
    "appearance" character varying(255),
    "theme_dark" character varying(255),
    "theme_light" character varying(255),
    "theme_light_overrides" json,
    "theme_dark_overrides" json,
    CONSTRAINT "directus_users_email_unique" UNIQUE ("email"),
    CONSTRAINT "directus_users_external_identifier_unique" UNIQUE ("external_identifier"),
    CONSTRAINT "directus_users_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "directus_users_token_unique" UNIQUE ("token")
) WITH (oids = false);

INSERT INTO "directus_users" ("id", "first_name", "last_name", "email", "password", "location", "title", "description", "tags", "avatar", "language", "tfa_secret", "status", "role", "token", "last_access", "last_page", "provider", "external_identifier", "auth_data", "email_notifications", "appearance", "theme_dark", "theme_light", "theme_light_overrides", "theme_dark_overrides") VALUES
('c687c13d-984b-42fb-bcde-694ff68e23d2',	'Admin',	'User',	'admin@example.com',	'$argon2id$v=19$m=65536,t=3,p=4$FuJKsnW011ya46xZRMMBww$lav//VcBM3DAWtXyGsVAlLOaBSuBCz8w4FUSh2KnDDo',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'active',	'bf6816e1-8d4c-42f4-94c3-10323eb36c2c',	NULL,	'2025-02-07 09:32:23.771+00',	'/content/lieux',	'default',	NULL,	NULL,	't',	NULL,	NULL,	NULL,	NULL,	NULL);

DROP TABLE IF EXISTS "directus_versions";
CREATE TABLE "public"."directus_versions" (
    "id" uuid NOT NULL,
    "key" character varying(64) NOT NULL,
    "name" character varying(255),
    "collection" character varying(64) NOT NULL,
    "item" character varying(255) NOT NULL,
    "hash" character varying(255),
    "date_created" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "date_updated" timestamptz DEFAULT CURRENT_TIMESTAMP,
    "user_created" uuid,
    "user_updated" uuid,
    "delta" json,
    CONSTRAINT "directus_versions_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "directus_webhooks";
DROP SEQUENCE IF EXISTS directus_webhooks_id_seq;
CREATE SEQUENCE directus_webhooks_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."directus_webhooks" (
    "id" integer DEFAULT nextval('directus_webhooks_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "method" character varying(10) DEFAULT 'POST' NOT NULL,
    "url" character varying(255) NOT NULL,
    "status" character varying(10) DEFAULT 'active' NOT NULL,
    "data" boolean DEFAULT true NOT NULL,
    "actions" character varying(100) NOT NULL,
    "collections" character varying(255) NOT NULL,
    "headers" json,
    "was_active_before_deprecation" boolean DEFAULT false NOT NULL,
    "migrated_flow" uuid,
    CONSTRAINT "directus_webhooks_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "lieux";
DROP SEQUENCE IF EXISTS lieux_id_seq;
CREATE SEQUENCE lieux_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."lieux" (
    "id" integer DEFAULT nextval('lieux_id_seq') NOT NULL,
    "categorie" character varying(255),
    "longitude" character varying(255),
    "latitude" character varying(255),
    "ville" character varying(255),
    "nom" character varying(255),
    CONSTRAINT "lieux_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "lieux" ("id", "categorie", "longitude", "latitude", "ville", "nom") VALUES
(1,	'Monument',	'6.18275',	'48.694306',	'Nancy',	'Arc Héré'),
(2,	'Monument',	'6.1803072',	'48.6965855',	'Nancy',	'Nancy Saint-Epvre'),
(3,	'Monument',	'6.1855486',	'48.6918687',	'Nancy',	'Cathédrale Notre-Dame-de-l''Annonciation'),
(4,	'Monument',	'6.1675878',	'48.686626',	'Nancy',	'Commanderie Saint-Jean-du-Vieil-Aître'),
(5,	'Monument',	'6.1793714',	'48.679947',	'Nancy',	'Établissement d''Émile Gallé'),
(6,	'Monument',	'6.1779966',	'48.6986534',	'Nancy',	'Porte de la Craffe'),
(7,	'Monument',	'6.1834332',	'48.6933232',	'Nancy',	'Place Stanislas'),
(8,	'Monument',	'6.178198',	'48.6898844',	'Nancy',	'Temple protestant de Nancy'),
(9,	'Monument',	'6.178285',	'48.6893755',	'Nancy',	'Banque Charles Renauld'),
(10,	'Monument',	'6.1772529',	'48.6896',	'Nancy',	'Banque SNVB'),
(11,	'ecole',	'6.161971',	'48.6832288',	'Nancy',	'IUT Nancy-Charlemagne'),
(12,	'ecole',	'6.1517384',	'48.660013',	'Nancy',	'Iut Nancy-Brabois'),
(13,	'ecole',	'6.1885486',	'48.6598459',	'Nancy',	'Polytech Nancy'),
(14,	'ecole',	'6.1589926',	'48.6669704',	'Nancy',	'Faculté des Sciences et Technologies Nancy'),
(15,	'ecole',	'6.1718599',	'48.6975363',	'Nancy',	'IAE Nancy école Universitaire de management'),
(16,	'ecole',	'6.1769844',	'48.692992',	'Nancy',	'Faculte de Droit sciences economiques et gestion'),
(17,	'ecole',	'6.1766223',	'48.6934953',	'Nancy',	'centre européen universitaire'),
(18,	'ecole',	'6.1427061',	'48.6510349',	'Nancy',	'faculté d''odontologie'),
(19,	'ecole',	'6.1936218',	'48.6957736',	'Nancy',	'Ecole Européenne d''Ingénieurs en Génie des Matériaux'),
(20,	'ecole',	'6.1721733',	'48.6971154',	'Nancy',	'Institut Européen du Cinéma et de l''Audiovisuel'),
(21,	'Fast food',	'6.1854075',	'48.6896406',	'Nancy',	'foodies burger'),
(22,	'Fast food',	'6.1837812',	'48.6900766',	'Nancy',	'Voyou Delivery'),
(23,	'Fast food',	'6.1728704',	'48.6903745',	'Nancy',	'Rice and Curry'),
(24,	'Fast food',	'6.1711804',	'48.6740372',	'Nancy',	'Bonidé'),
(25,	'Fast food',	'6.1840356',	'48.6886593',	'Nancy',	'Green Kebab'),
(26,	'Fast food',	'6.1843143',	'48.6904101',	'Nancy',	'Asia Wok'),
(27,	'Fast food',	'6.1761438',	'48.6893167',	'Nancy',	'Burger Kebab'),
(28,	'Fast food',	'6.1815256',	'48.6893391',	'Nancy',	'Pokawa'),
(29,	'Fast food',	'6.1792033',	'48.6966367',	'Nancy',	'made in france'),
(30,	'Fast food',	'6.1830834',	'48.6898507',	'Nancy',	'Five Guys'),
(31,	'Magasin',	'6.1814435',	'48.6888106',	'Nancy',	'Saint Sébastien'),
(32,	'Magasin',	'6.2207768',	'48.6855104',	'Nancy',	'Auchan Hypermarché'),
(33,	'Magasin',	'6.1761183',	'48.6613595',	'Nancy',	'centre commerciale les nations'),
(34,	'Magasin',	'6.1763422',	'48.6894079',	'Nancy',	'Printemps Nancy'),
(35,	'Magasin',	'6.1839106',	'48.6901134',	'Nancy',	'La Caverne du Gobelin'),
(36,	'Magasin',	'6.1828913',	'48.6909836',	'Nancy',	'The LEGO® Certified Store'),
(37,	'Magasin',	'6.1841596',	'48.6884899',	'Nancy',	'Le comptoir Irlandais'),
(38,	'Magasin',	'6.1816782',	'48.6899451',	'Nancy',	'À l''Ombre des Marques'),
(39,	'Magasin',	'6.1802466',	'48.69012',	'Nancy',	'Snipes'),
(40,	'Magasin',	'6.1805757',	'48.6933388',	'Nancy',	'Jass'),
(41,	'Parc',	'6.1896376',	'48.6947803',	'Nancy',	'Jardin Dominique Alexandre Godron'),
(42,	'Parc',	'6.1851428',	'48.6979955',	'Nancy',	'Parc de la Pépinière'),
(43,	'Parc',	'6.170953',	'48.6815382',	'Nancy',	'Parc Sainte-Marie de Nancy'),
(44,	'Parc',	'6.189867',	'48.6890104',	'Nancy',	'Parc Charles III'),
(45,	'Parc',	'6.1938402',	'48.6936363',	'Nancy',	'Jardin d''eau'),
(46,	'Parc',	'6.154209',	'48.6908079',	'Nancy',	'Jardin du Belvédère'),
(47,	'Parc',	'6.1742817',	'48.6684332',	'Nancy',	'Domaine et Château du Charmois'),
(48,	'Parc',	'6.183001',	'48.6984113',	'Nancy',	'La Roseraie'),
(49,	'Parc',	'6.1552545',	'48.6625643',	'Nancy',	'Jardin Botanique Jean-Marie Pelt'),
(50,	'Parc',	'6.1315299',	'48.6972179',	'Nancy',	'parc d''agrément');

DROP TABLE IF EXISTS "lieux_files";
DROP SEQUENCE IF EXISTS lieux_files_id_seq;
CREATE SEQUENCE lieux_files_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."lieux_files" (
    "id" integer DEFAULT nextval('lieux_files_id_seq') NOT NULL,
    "lieux_id" integer,
    "directus_files_id" uuid,
    CONSTRAINT "lieux_files_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "lieux_files" ("id", "lieux_id", "directus_files_id") VALUES
(1,	1,	'1fbba087-a9aa-4ff4-a1a9-d75977ac6460'),
(2,	2,	'ccbc35e7-2e07-49f7-ac4e-48b85eeb2147'),
(3,	3,	'4f9d31c9-a26c-4f4b-9823-c4eea6c8f902'),
(4,	4,	'a141e808-6ab9-4598-b03a-32657783a00b'),
(5,	5,	'fd4dbe84-edb0-4f26-953f-e78b9a8148d2'),
(6,	6,	'bacbd383-6652-4a00-b291-9ef6cf6933b2'),
(7,	7,	'581bc14e-5421-49c3-80e3-3b3901758769'),
(8,	8,	'8cce8533-e622-47b5-a116-a1bef26c2f8c'),
(9,	9,	'72c4d2be-e76c-4864-801c-825ebdf4d9a4'),
(10,	10,	'b45b34a1-defa-486d-8b52-51f15e4a62ca'),
(11,	11,	'e82c61a9-4be6-4647-a29e-e16b5418973a'),
(12,	12,	'46d64354-3977-400c-9dc2-21a04ccc04f1'),
(13,	13,	'16106068-98e3-4273-93cb-62455c3eb25a'),
(14,	14,	'1fec3bb7-5aac-4474-8e36-7e8ea7537e55'),
(15,	15,	'055ab0e0-8a92-41dc-9b5d-64a617ba31bd'),
(16,	16,	'dbdd123b-5557-43c4-8de4-71a0a24116c8'),
(17,	17,	'e87df09d-5184-4092-94b3-5d2a36ebcac7'),
(18,	18,	'210a9381-92d6-48c3-8846-1f8289d31eb7'),
(19,	19,	'e88cc2ab-80ab-41c7-9fd3-f6fd5a2b5eef'),
(20,	20,	'0374151e-342f-4943-aa7e-5ebc224829fa'),
(21,	21,	'e5e962c1-fd7b-4c50-8b07-317406fd2933'),
(22,	22,	'37a4c703-1fbf-4649-8e4d-a9a7be875303'),
(23,	23,	'5228db5d-ef5b-48c5-a4be-f2841e3fcc26'),
(24,	24,	'6edd6994-ef18-45f3-8afd-656f44603a46'),
(25,	25,	'387223ab-cf55-4d08-bed0-c7d1868ac0e8'),
(26,	26,	'67570c38-da82-41d1-9db1-f6bdc16949e5'),
(27,	27,	'0fb8ec8a-4d7a-4900-9db0-2232f620b35c'),
(28,	28,	'7f10017f-5c26-4905-90d2-460b72476ed9'),
(29,	29,	'1edecadd-6209-42e6-8ea8-525a09bbf38f'),
(30,	30,	'66574d82-cfef-4b1a-8346-563cea295afa'),
(31,	31,	'f738364c-aa7e-415d-b8a5-c4fac9afa71d'),
(32,	32,	'2c6e096b-5d8c-4c43-ab9f-fe0d0154065b'),
(33,	33,	'9e6bfa1b-8e1e-4b45-b7de-3179b031a91c'),
(34,	34,	'89017ea3-c34c-4eaf-829a-b052a5adb00e'),
(35,	35,	'a8d4392a-1449-4819-ac01-9a5a52e6e355'),
(36,	36,	'd30c5c73-f57b-41a9-a5a1-a6a0822219c5'),
(37,	37,	'1b207fd0-45c9-4bda-a5db-a0d2dc6cf984'),
(38,	38,	'9d9e72f0-3095-4534-8a64-305339046dc7'),
(39,	39,	'87bf3509-283e-4db2-94ff-9c7690edea24'),
(40,	40,	'eef713a3-5211-43fb-99f6-3c0043850e87'),
(41,	41,	'c2aef6d9-8569-4296-8fba-b554ded565ef'),
(42,	42,	'6dcae1cb-0db7-4117-b722-2ef265ac0dc6'),
(43,	43,	'38e102f9-cda8-4a7f-8e9b-38a010daf52b'),
(44,	44,	'9e9aa1a1-891b-4ef2-8a95-d09d3fc1e596'),
(45,	45,	'e06903a4-9e50-440f-a8ae-89a4896a3760'),
(46,	46,	'382aac3c-e895-4d47-8807-ab2c9c821c70'),
(47,	47,	'fb466a98-2aa0-425d-865b-9a729efcdcf6'),
(48,	48,	'cced8498-0372-417c-9e9c-46f2d5b51d12'),
(49,	49,	'fcfb48c2-e432-4e24-870e-cb246b86fd37'),
(50,	50,	'4d07e99f-5780-4d2f-8847-ded2982a206c');

ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_policy_foreign" FOREIGN KEY (policy) REFERENCES directus_policies(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_access" ADD CONSTRAINT "directus_access_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_collections" ADD CONSTRAINT "directus_collections_group_foreign" FOREIGN KEY ("group") REFERENCES directus_collections(collection) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_comments" ADD CONSTRAINT "directus_comments_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_comments" ADD CONSTRAINT "directus_comments_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_dashboards" ADD CONSTRAINT "directus_dashboards_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_folder_foreign" FOREIGN KEY (folder) REFERENCES directus_folders(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_modified_by_foreign" FOREIGN KEY (modified_by) REFERENCES directus_users(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_files" ADD CONSTRAINT "directus_files_uploaded_by_foreign" FOREIGN KEY (uploaded_by) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_flows" ADD CONSTRAINT "directus_flows_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_folders" ADD CONSTRAINT "directus_folders_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_folders(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_notifications" ADD CONSTRAINT "directus_notifications_recipient_foreign" FOREIGN KEY (recipient) REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_notifications" ADD CONSTRAINT "directus_notifications_sender_foreign" FOREIGN KEY (sender) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_flow_foreign" FOREIGN KEY (flow) REFERENCES directus_flows(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_reject_foreign" FOREIGN KEY (reject) REFERENCES directus_operations(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_resolve_foreign" FOREIGN KEY (resolve) REFERENCES directus_operations(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_operations" ADD CONSTRAINT "directus_operations_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_panels" ADD CONSTRAINT "directus_panels_dashboard_foreign" FOREIGN KEY (dashboard) REFERENCES directus_dashboards(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_panels" ADD CONSTRAINT "directus_panels_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_permissions" ADD CONSTRAINT "directus_permissions_policy_foreign" FOREIGN KEY (policy) REFERENCES directus_policies(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_presets" ADD CONSTRAINT "directus_presets_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_presets" ADD CONSTRAINT "directus_presets_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_activity_foreign" FOREIGN KEY (activity) REFERENCES directus_activity(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_revisions(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_revisions" ADD CONSTRAINT "directus_revisions_version_foreign" FOREIGN KEY (version) REFERENCES directus_versions(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_roles" ADD CONSTRAINT "directus_roles_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_roles(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_sessions" ADD CONSTRAINT "directus_sessions_share_foreign" FOREIGN KEY (share) REFERENCES directus_shares(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_sessions" ADD CONSTRAINT "directus_sessions_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_project_logo_foreign" FOREIGN KEY (project_logo) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_background_foreign" FOREIGN KEY (public_background) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_favicon_foreign" FOREIGN KEY (public_favicon) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_foreground_foreign" FOREIGN KEY (public_foreground) REFERENCES directus_files(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_public_registration_role_foreign" FOREIGN KEY (public_registration_role) REFERENCES directus_roles(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_settings" ADD CONSTRAINT "directus_settings_storage_default_folder_foreign" FOREIGN KEY (storage_default_folder) REFERENCES directus_folders(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_collection_foreign" FOREIGN KEY (collection) REFERENCES directus_collections(collection) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_shares" ADD CONSTRAINT "directus_shares_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_users" ADD CONSTRAINT "directus_users_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_collection_foreign" FOREIGN KEY (collection) REFERENCES directus_collections(collection) ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_user_created_foreign" FOREIGN KEY (user_created) REFERENCES directus_users(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."directus_versions" ADD CONSTRAINT "directus_versions_user_updated_foreign" FOREIGN KEY (user_updated) REFERENCES directus_users(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."directus_webhooks" ADD CONSTRAINT "directus_webhooks_migrated_flow_foreign" FOREIGN KEY (migrated_flow) REFERENCES directus_flows(id) ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."lieux_files" ADD CONSTRAINT "lieux_files_directus_files_id_foreign" FOREIGN KEY (directus_files_id) REFERENCES directus_files(id) ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."lieux_files" ADD CONSTRAINT "lieux_files_lieux_id_foreign" FOREIGN KEY (lieux_id) REFERENCES lieux(id) ON DELETE SET NULL NOT DEFERRABLE;

-- 2025-02-07 10:22:35.565294+00
