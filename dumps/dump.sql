--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: genderenum; Type: TYPE; Schema: public; Owner: user
--

CREATE TYPE public.genderenum AS ENUM (
    'male',
    'female',
    'unknown'
);


ALTER TYPE public.genderenum OWNER TO "user";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: article; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.article (
    title character varying(50) NOT NULL,
    text character varying NOT NULL,
    pet_id integer NOT NULL,
    publish_date timestamp with time zone NOT NULL,
    images character varying[],
    id integer NOT NULL
);


ALTER TABLE public.article OWNER TO "user";

--
-- Name: articleContents; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."articleContents" (
    article_id integer NOT NULL,
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    uri character varying NOT NULL,
    comment character varying(255),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public."articleContents" OWNER TO "user";

--
-- Name: articleContents_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."articleContents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."articleContents_id_seq" OWNER TO "user";

--
-- Name: articleContents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."articleContents_id_seq" OWNED BY public."articleContents".id;


--
-- Name: article_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.article_id_seq OWNER TO "user";

--
-- Name: article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.article_id_seq OWNED BY public.article.id;


--
-- Name: manager; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.manager (
    first_name character varying(50) NOT NULL,
    second_name character varying(50) NOT NULL,
    phone character varying(11) NOT NULL,
    email character varying(255),
    password character varying(60) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.manager OWNER TO "user";

--
-- Name: manager_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.manager_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.manager_id_seq OWNER TO "user";

--
-- Name: manager_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.manager_id_seq OWNED BY public.manager.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    text character varying NOT NULL,
    publish_date timestamp with time zone NOT NULL,
    images character varying[]
);


ALTER TABLE public.news OWNER TO "user";

--
-- Name: newsContents; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."newsContents" (
    news_id integer NOT NULL,
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    uri character varying NOT NULL,
    comment character varying(255),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public."newsContents" OWNER TO "user";

--
-- Name: newsContents_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."newsContents_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."newsContents_id_seq" OWNER TO "user";

--
-- Name: newsContents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."newsContents_id_seq" OWNED BY public."newsContents".id;


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO "user";

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: pet; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.pet (
    status_id integer NOT NULL,
    name character varying NOT NULL,
    gender public.genderenum NOT NULL,
    sterilized boolean NOT NULL,
    type_id integer NOT NULL,
    description text,
    year_birth integer,
    in_shelter_from timestamp without time zone,
    images character varying[],
    id integer NOT NULL
);


ALTER TABLE public.pet OWNER TO "user";

--
-- Name: petContent; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."petContent" (
    pet_id integer NOT NULL,
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    uri character varying NOT NULL,
    comment character varying(255),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public."petContent" OWNER TO "user";

--
-- Name: petContent_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."petContent_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."petContent_id_seq" OWNER TO "user";

--
-- Name: petContent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."petContent_id_seq" OWNED BY public."petContent".id;


--
-- Name: petStatus; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."petStatus" (
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public."petStatus" OWNER TO "user";

--
-- Name: petStatus_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."petStatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."petStatus_id_seq" OWNER TO "user";

--
-- Name: petStatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."petStatus_id_seq" OWNED BY public."petStatus".id;


--
-- Name: petType; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."petType" (
    name character varying NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public."petType" OWNER TO "user";

--
-- Name: petType_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."petType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."petType_id_seq" OWNER TO "user";

--
-- Name: petType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."petType_id_seq" OWNED BY public."petType".id;


--
-- Name: pet_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pet_id_seq OWNER TO "user";

--
-- Name: pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.pet_id_seq OWNED BY public.pet.id;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.transaction (
    date_of_payment timestamp with time zone NOT NULL,
    amount integer NOT NULL,
    sender_receiver character varying,
    comment text,
    images character varying[],
    id integer NOT NULL,
    incoming boolean NOT NULL
);


ALTER TABLE public.transaction OWNER TO "user";

--
-- Name: transactionContent; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public."transactionContent" (
    transaction_id integer NOT NULL,
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    uri character varying NOT NULL,
    comment character varying(255),
    create_date timestamp with time zone NOT NULL,
    modify_date timestamp with time zone NOT NULL
);


ALTER TABLE public."transactionContent" OWNER TO "user";

--
-- Name: transactionContent_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public."transactionContent_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."transactionContent_id_seq" OWNER TO "user";

--
-- Name: transactionContent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public."transactionContent_id_seq" OWNED BY public."transactionContent".id;


--
-- Name: transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_id_seq OWNER TO "user";

--
-- Name: transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;


--
-- Name: article id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article ALTER COLUMN id SET DEFAULT nextval('public.article_id_seq'::regclass);


--
-- Name: articleContents id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."articleContents" ALTER COLUMN id SET DEFAULT nextval('public."articleContents_id_seq"'::regclass);


--
-- Name: manager id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.manager ALTER COLUMN id SET DEFAULT nextval('public.manager_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: newsContents id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."newsContents" ALTER COLUMN id SET DEFAULT nextval('public."newsContents_id_seq"'::regclass);


--
-- Name: pet id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pet ALTER COLUMN id SET DEFAULT nextval('public.pet_id_seq'::regclass);


--
-- Name: petContent id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petContent" ALTER COLUMN id SET DEFAULT nextval('public."petContent_id_seq"'::regclass);


--
-- Name: petStatus id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petStatus" ALTER COLUMN id SET DEFAULT nextval('public."petStatus_id_seq"'::regclass);


--
-- Name: petType id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petType" ALTER COLUMN id SET DEFAULT nextval('public."petType_id_seq"'::regclass);


--
-- Name: transaction id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);


--
-- Name: transactionContent id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."transactionContent" ALTER COLUMN id SET DEFAULT nextval('public."transactionContent_id_seq"'::regclass);


--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: user
--



--
-- Data for Name: articleContents; Type: TABLE DATA; Schema: public; Owner: user
--



--
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.manager (first_name, second_name, phone, email, password, id) VALUES ('Главный', 'Менеджер', '1', 'matv864@gmail.com', '$2b$12$3WgZW0SrWFuejCQSl1aJBuLxAybyPRJW82Pps51hKFQ3tqILIMH5O', 1);


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.news (id, title, text, publish_date, images) VALUES (2, '1', '<p>212121</p>', '2025-07-03 14:45:11.08662+00', NULL);


--
-- Data for Name: newsContents; Type: TABLE DATA; Schema: public; Owner: user
--



--
-- Data for Name: pet; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.pet (status_id, name, gender, sterilized, type_id, description, year_birth, in_shelter_from, images, id) VALUES (1, '1', 'unknown', true, 1, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: petContent; Type: TABLE DATA; Schema: public; Owner: user
--



--
-- Data for Name: petStatus; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public."petStatus" (name, id) VALUES ('дома', 1);


--
-- Data for Name: petType; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public."petType" (name, id) VALUES ('кошка', 1);
INSERT INTO public."petType" (name, id) VALUES ('собака', 2);


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: user
--

INSERT INTO public.transaction (date_of_payment, amount, sender_receiver, comment, images, id, incoming) VALUES ('2025-07-03 17:46:13.144846+00', 21, NULL, NULL, NULL, 11, false);


--
-- Data for Name: transactionContent; Type: TABLE DATA; Schema: public; Owner: user
--



--
-- Name: articleContents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."articleContents_id_seq"', 1, false);


--
-- Name: article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.article_id_seq', 1, false);


--
-- Name: manager_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.manager_id_seq', 1, true);


--
-- Name: newsContents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."newsContents_id_seq"', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.news_id_seq', 2, true);


--
-- Name: petContent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."petContent_id_seq"', 1, false);


--
-- Name: petStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."petStatus_id_seq"', 1, true);


--
-- Name: petType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."petType_id_seq"', 2, true);


--
-- Name: pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.pet_id_seq', 5, true);


--
-- Name: transactionContent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public."transactionContent_id_seq"', 1, false);


--
-- Name: transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--



--
-- Name: articleContents articleContents_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."articleContents"
    ADD CONSTRAINT "articleContents_pkey" PRIMARY KEY (id);


--
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- Name: manager manager_phone_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_phone_key UNIQUE (phone);


--
-- Name: manager manager_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (id);


--
-- Name: newsContents newsContents_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."newsContents"
    ADD CONSTRAINT "newsContents_pkey" PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: petContent petContent_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petContent"
    ADD CONSTRAINT "petContent_pkey" PRIMARY KEY (id);


--
-- Name: petStatus petStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petStatus"
    ADD CONSTRAINT "petStatus_pkey" PRIMARY KEY (id);


--
-- Name: petType petType_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petType"
    ADD CONSTRAINT "petType_pkey" PRIMARY KEY (id);


--
-- Name: pet pet_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_pkey PRIMARY KEY (id);


--
-- Name: transactionContent transactionContent_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."transactionContent"
    ADD CONSTRAINT "transactionContent_pkey" PRIMARY KEY (id);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);


--
-- Name: articleContents articleContents_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."articleContents"
    ADD CONSTRAINT "articleContents_article_id_fkey" FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- Name: article article_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES public.pet(id);


--
-- Name: newsContents newsContents_news_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."newsContents"
    ADD CONSTRAINT "newsContents_news_id_fkey" FOREIGN KEY (news_id) REFERENCES public.news(id);


--
-- Name: petContent petContent_pet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."petContent"
    ADD CONSTRAINT "petContent_pet_id_fkey" FOREIGN KEY (pet_id) REFERENCES public.pet(id);


--
-- Name: pet pet_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_status_id_fkey FOREIGN KEY (status_id) REFERENCES public."petStatus"(id);


--
-- Name: pet pet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.pet
    ADD CONSTRAINT pet_type_id_fkey FOREIGN KEY (type_id) REFERENCES public."petType"(id);


--
-- Name: transactionContent transactionContent_transaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public."transactionContent"
    ADD CONSTRAINT "transactionContent_transaction_id_fkey" FOREIGN KEY (transaction_id) REFERENCES public.transaction(id);


--
-- PostgreSQL database dump complete
--

