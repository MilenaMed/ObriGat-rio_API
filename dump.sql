--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cat; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cat (
    id integer NOT NULL,
    "catName" text NOT NULL,
    datadescription text NOT NULL,
    photo text NOT NULL,
    "ongId" integer,
    available boolean DEFAULT true,
    "forAdoption" boolean DEFAULT false,
    "ongContact" character varying(11)
);


--
-- Name: cat_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cat_id_seq OWNED BY public.cat.id;


--
-- Name: ong; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ong (
    id integer NOT NULL,
    "ongName" text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    city text NOT NULL,
    contact character varying(11) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: ong_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ong_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ong_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ong_id_seq OWNED BY public.ong.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id integer NOT NULL,
    token text NOT NULL,
    "ongId" integer
);


--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: cat id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat ALTER COLUMN id SET DEFAULT nextval('public.cat_id_seq'::regclass);


--
-- Name: ong id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ong ALTER COLUMN id SET DEFAULT nextval('public.ong_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Data for Name: cat; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cat VALUES (4, 'bigodes', 'um gato carinhoso e fofinho, resgatado ainda filhote, bigodes tem apenas 3 patinhas, mas isso não o impede de ser muito brincalhão', 'https://www.prefeitura.sp.gov.br/cidade/secretarias/upload/saude/Peppa.jpg', 2, true, false, '99999999909');
INSERT INTO public.cat VALUES (5, 'otelo', 'um gato preguiçoso que adora colo, por já ter certa idade (8 aninhos), Otelo prefere passar seu tempo quieto e confortável, de preferência ouvindo histórias. Então quer alguém pra conversar? Otelo é o gato pra você', 'https://www.patasdacasa.com.br/sites/patasdacasa/files/noticias/2022/11/gato-idoso-com-quantos-anos-os-felinos-entram-na-terceira-idade.jpg', 2, false, false, '99999999909');
INSERT INTO public.cat VALUES (6, 'batata', 'Gato filhote (apenas 3 meses) cheio de energia, adora brincar e pular, tão fofinho quando curioso', 'data:image/jpeg;base64,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', 4, false, false, '83996513622');


--
-- Data for Name: ong; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ong VALUES (1, 'Gatos de Rua', 'gatos@email.com', '$2b$10$qR28eF7OLNduPumoZ1hjwumn18sDZl2FYTnfsPUrq2N4vtkv3Wwdq', 'campina grande', '99999999999', '2023-08-09 22:56:22.325978');
INSERT INTO public.ong VALUES (2, 'patinhas', 'patinhas@email.com', '$2b$10$yVh.FqAY/UP0hkxwrQSiyutiamacVYotcsjSNpxaJrn..LyzWj6G2', 'campina grande', '99999999909', '2023-08-09 22:57:33.956423');
INSERT INTO public.ong VALUES (3, 'Animais de rua', 'animais@email.com', '$2b$10$o0wP.ENmRR/2RaLhAbupjeJE1vLPyHcr22ShlwVWhbCB5zeI6zvbC', 'cuite', '11333333333', '2023-08-14 15:50:47.787338');
INSERT INTO public.ong VALUES (4, 'MIlena', 'milena@email.com', '$2b$10$Ntq5sJ9kmhXNmv0V/62lK.7DrE83Fifh.jjpciawyHcrgg211lpda', 'aaaaa', '83996513622', '2023-08-14 17:22:40.831311');


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.session VALUES (1, '97d1ffd2-d2b9-44e1-baf1-daaa91ea8a71', 2);
INSERT INTO public.session VALUES (2, '29863050-afc7-43d9-8275-81c0d0afa20a', 2);
INSERT INTO public.session VALUES (3, 'e00e4e10-0b90-4a4b-9796-c4757c5eaf7f', 1);
INSERT INTO public.session VALUES (4, '848ced24-d21b-4698-a150-81fce3c4397e', 2);
INSERT INTO public.session VALUES (5, 'd3782503-3555-4315-8708-89bd027380f5', 2);
INSERT INTO public.session VALUES (6, 'c4905c46-3560-43f8-a5b1-04620a5f85ec', 2);
INSERT INTO public.session VALUES (7, '70b37a34-4714-4ef5-95a1-00c112e7f827', 2);
INSERT INTO public.session VALUES (8, 'e66495ef-7d1e-4e4b-8296-48fd4d49a38d', 2);
INSERT INTO public.session VALUES (9, '75fe85ff-6dec-4738-9e9b-1403dad5af9e', 1);
INSERT INTO public.session VALUES (10, '945e29e9-6ec0-4ec5-8e52-1ca2ed4589ef', 1);
INSERT INTO public.session VALUES (11, '5563fa8e-ed02-4c70-beb6-9d3d8b8c4a01', 1);
INSERT INTO public.session VALUES (12, '449585da-b703-4a7d-8b4d-cf55a95b7261', 1);
INSERT INTO public.session VALUES (13, '1ca3bd7b-9739-4093-9f19-45ea0882b434', 1);
INSERT INTO public.session VALUES (14, 'b5e81232-c6fa-4fb8-9658-c1ab8c68bbb6', 1);
INSERT INTO public.session VALUES (15, '2bed1b4d-124d-4db6-9569-1f7bedeb73c4', 1);
INSERT INTO public.session VALUES (16, 'c1d0fc76-344a-4203-b801-768598b0a7f6', 1);
INSERT INTO public.session VALUES (17, '31c60140-f97c-4d63-a462-37399168539e', 2);
INSERT INTO public.session VALUES (18, '08b70c43-379a-409e-831c-080f58c97b27', 2);
INSERT INTO public.session VALUES (19, '60298215-3a81-492e-8a9a-74b3e2aa7a40', 2);
INSERT INTO public.session VALUES (20, 'b78e18ab-b10c-4334-b771-5759e6eb201b', 3);
INSERT INTO public.session VALUES (21, '8af403d5-741d-4723-a8dd-4664ad3c2d8f', 2);
INSERT INTO public.session VALUES (22, '396a3014-20fd-466d-8171-610b2d69e792', 2);
INSERT INTO public.session VALUES (23, 'a2298f70-fc90-4fb8-ab64-8a4d00e387ad', 2);
INSERT INTO public.session VALUES (24, 'f5212ee9-b6f9-4905-8333-ca807c2f5fe4', 2);
INSERT INTO public.session VALUES (25, 'ea1f4882-d1e3-4f6b-86a4-23b4b7b5baa1', 2);
INSERT INTO public.session VALUES (26, 'baaf04a5-58d1-4199-a216-d71f5f40ab98', 2);
INSERT INTO public.session VALUES (27, 'dd93a7c4-e4a9-4783-87f7-b76e58d50f1b', 4);
INSERT INTO public.session VALUES (28, '65e31fb2-1f0a-4b47-a67f-ac38c2b8a261', 4);
INSERT INTO public.session VALUES (29, '48023738-8ffd-4045-902c-cbb801261c18', 4);
INSERT INTO public.session VALUES (30, 'c94ca99b-137f-461a-8b12-e4c7a904884a', 4);
INSERT INTO public.session VALUES (31, '7a3467fa-12ce-4f53-a79a-d138204cea5b', 4);
INSERT INTO public.session VALUES (32, '45b32822-7ddc-4c11-8230-9d0e61655e55', 4);
INSERT INTO public.session VALUES (33, '6cf5949a-3f02-4c0e-b31b-7109a9dc5e79', 4);
INSERT INTO public.session VALUES (34, '2d092823-640f-4f69-b5fc-96ff8cba89bd', 4);
INSERT INTO public.session VALUES (35, 'd86e4025-88d7-42ce-a9c6-05cebaa6ecc8', 4);
INSERT INTO public.session VALUES (36, '6324609b-8486-4fad-9256-30eb24b97f3f', 4);


--
-- Name: cat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cat_id_seq', 6, true);


--
-- Name: ong_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ong_id_seq', 4, true);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 36, true);


--
-- Name: cat cat_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT cat_pkey PRIMARY KEY (id);


--
-- Name: ong ong_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ong
    ADD CONSTRAINT ong_email_key UNIQUE (email);


--
-- Name: ong ong_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ong
    ADD CONSTRAINT ong_password_key UNIQUE (password);


--
-- Name: ong ong_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ong
    ADD CONSTRAINT ong_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_token_key UNIQUE (token);


--
-- Name: ong unique_ong_contact; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ong
    ADD CONSTRAINT unique_ong_contact UNIQUE (contact);


--
-- Name: cat cat_ongContact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT "cat_ongContact_fkey" FOREIGN KEY ("ongContact") REFERENCES public.ong(contact);


--
-- Name: cat cat_ongId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cat
    ADD CONSTRAINT "cat_ongId_fkey" FOREIGN KEY ("ongId") REFERENCES public.ong(id);


--
-- Name: session session_ongId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_ongId_fkey" FOREIGN KEY ("ongId") REFERENCES public.ong(id);


--
-- PostgreSQL database dump complete
--

