--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-15 08:37:27

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
-- TOC entry 201 (class 1259 OID 16397)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    account_no integer NOT NULL,
    balance money NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 203 (class 1259 OID 16419)
-- Name: depositor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.depositor (
    transcation_id integer NOT NULL,
    customer_id integer,
    cust_name character varying(30) NOT NULL,
    time_date timestamp without time zone NOT NULL,
    amount money
);


ALTER TABLE public.depositor OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16417)
-- Name: depositor_transcation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.depositor ALTER COLUMN transcation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.depositor_transcation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16443)
-- Name: receiver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.receiver (
    transcation_id integer NOT NULL,
    customer_id integer,
    cust_name character varying(30) NOT NULL,
    amount money,
    time_date timestamp without time zone
);


ALTER TABLE public.receiver OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16462)
-- Name: transcation_tb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transcation_tb (
    tid integer NOT NULL,
    sender character varying(30),
    receiver character varying(30),
    amount money,
    time_date timestamp without time zone
);


ALTER TABLE public.transcation_tb OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16460)
-- Name: transcation_tb_tid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.transcation_tb ALTER COLUMN tid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.transcation_tb_tid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3011 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, email, account_no, balance) FROM stdin;
4	Elijah Freddie	elijahfreddie@gmail.com	78653421	$3,400.00
5	Jack John	jackjohn@gmail.com	65432187	$50,000.00
8	Lucas Mason	lucasmason@gmail.com	56782345	$1,000.00
9	Abigail	abigail02@gmail.com	78733783	$2,300.00
11	Oliver Declan	oliverdeclan@rediffmail.com	78654321	$6,589.00
12	Charlotte John	charlottejohn@rediffmail.com	78654327	$32,000.90
15	Austin Beckman	austinbeckman@yahoo.com	89653327	$6,783.00
13	Georgia Beckman	georgiabeckman@rediffmail.com	78653327	$319,000.00
14	Ginny Beckman	ginnybeckman@yahoo.com	68653327	$321,340.00
2	Avery Harley	averyharley@yahoo.com	56784567	$4,583.00
6	Mia Penelope	miapenelope@gmail.com	67538988	$32,579.00
1	Luke Joseph	lukejoseph@yahoo.com	12347689	$2,515.00
10	Aria	aria42@gmail.com	78346678	$22,969.00
3	Emma Grace	emmagrace@gmail.com	67548923	$12,953.00
7	Isabella	isabella@gmail.com	67538976	$25,842.00
\.


--
-- TOC entry 3013 (class 0 OID 16419)
-- Dependencies: 203
-- Data for Name: depositor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.depositor (transcation_id, customer_id, cust_name, time_date, amount) FROM stdin;
32	6	Mia Penelope	2021-05-14 14:31:01.526916	$2,000.00
33	1	Luke Joseph	2021-05-14 16:10:49.807649	$12.00
34	13	Georgia Beckman	2021-05-14 16:15:22.425949	$1,000.00
35	1	Luke Joseph	2021-05-14 16:20:06.887928	$123.00
36	3	Emma Grace	2021-05-14 16:21:13.655357	$100.00
37	3	Emma Grace	2021-05-14 16:22:01.171875	$1.00
38	1	Luke Joseph	2021-05-14 16:23:37.14472	$3.00
39	1	Luke Joseph	2021-05-14 16:25:24.288781	$12.00
40	3	Emma Grace	2021-05-14 16:26:10.371048	$123.00
41	3	Emma Grace	2021-05-14 16:27:28.035296	$12.00
42	7	Mia Penelope	2021-05-14 16:30:26.465828	$134.00
43	7	Mia Penelope	2021-05-14 16:31:13.197322	$134.00
44	7	Mia Penelope	2021-05-14 16:32:38.481335	$134.00
45	1	Luke Joseph	2021-05-14 16:32:51.100927	$134.00
46	1	Luke Joseph	2021-05-14 16:34:15.788992	$56.00
47	10	aria	2021-05-14 16:36:21.142307	$121.00
48	3	Emma Grace	2021-05-14 17:09:58.61638	$30,000.00
49	7	Isabella	2021-05-14 17:11:33.075473	$30,000.00
\.


--
-- TOC entry 3014 (class 0 OID 16443)
-- Dependencies: 204
-- Data for Name: receiver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.receiver (transcation_id, customer_id, cust_name, amount, time_date) FROM stdin;
0	7	Isabella	$2,000.00	2021-05-14 14:31:01.532833
0	2	Emma Grace	$12.00	2021-05-14 16:10:49.808972
0	14	Ginny Beckman	$1,000.00	2021-05-14 16:15:22.427883
0	3	Emma Grace	$123.00	2021-05-14 16:20:06.893528
0	1	Luke Joseph	$100.00	2021-05-14 16:21:13.657267
0	1	Luke Joseph	$1.00	2021-05-14 16:22:01.168229
0	2	Emma Grace	$3.00	2021-05-14 16:23:37.147042
0	3	Emma Grace	$12.00	2021-05-14 16:25:24.289745
0	7	Isabella	$123.00	2021-05-14 16:26:10.372085
0	6	Mia Penelope	$12.00	2021-05-14 16:27:28.036229
0	3	Emma Grace	$134.00	2021-05-14 16:30:26.469023
0	3	Emma Grace	$134.00	2021-05-14 16:31:13.199242
0	3	Emma Grace	$134.00	2021-05-14 16:32:38.483489
0	3	Emma Grace	$134.00	2021-05-14 16:32:51.103447
0	3	Emma Grace	$56.00	2021-05-14 16:34:15.797146
0	7	isabella	$121.00	2021-05-14 16:36:21.144457
0	7	Isabella	$30,000.00	2021-05-14 17:09:58.619286
0	3	Emma Grace	$30,000.00	2021-05-14 17:11:33.077214
\.


--
-- TOC entry 3016 (class 0 OID 16462)
-- Dependencies: 206
-- Data for Name: transcation_tb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transcation_tb (tid, sender, receiver, amount, time_date) FROM stdin;
1	Luke Joseph	Emma Grace	$12.00	2021-05-14 16:10:49.810616
2	Georgia Beckman	Ginny Beckman	$1,000.00	2021-05-14 16:15:22.431237
3	Luke Joseph	Emma Grace	$123.00	2021-05-14 16:20:06.889386
4	Emma Grace	Luke Joseph	$100.00	2021-05-14 16:21:13.660258
5	Emma Grace	Luke Joseph	$1.00	2021-05-14 16:22:01.174515
6	Luke Joseph	Emma Grace	$3.00	2021-05-14 16:23:37.152431
7	Luke Joseph	Emma Grace	$12.00	2021-05-14 16:25:24.293972
8	Emma Grace	Isabella	$123.00	2021-05-14 16:26:10.371436
9	Emma Grace	Mia Penelope	$12.00	2021-05-14 16:27:28.042474
10	Mia Penelope	Emma Grace	$134.00	2021-05-14 16:30:26.47143
11	Mia Penelope	Emma Grace	$134.00	2021-05-14 16:31:13.199676
12	Mia Penelope	Emma Grace	$134.00	2021-05-14 16:32:38.487558
13	Luke Joseph	Emma Grace	$134.00	2021-05-14 16:32:51.106027
14	Luke Joseph	Emma Grace	$56.00	2021-05-14 16:34:15.791846
15	aria	isabella	$121.00	2021-05-14 16:36:21.145226
16	Emma Grace	Isabella	$30,000.00	2021-05-14 17:09:58.625469
17	Isabella	Emma Grace	$30,000.00	2021-05-14 17:11:33.077935
\.


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 200
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 15, true);


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 202
-- Name: depositor_transcation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.depositor_transcation_id_seq', 49, true);


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 205
-- Name: transcation_tb_tid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transcation_tb_tid_seq', 17, true);


--
-- TOC entry 2867 (class 2606 OID 16407)
-- Name: customers customers_account_no_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_account_no_key UNIQUE (account_no);


--
-- TOC entry 2869 (class 2606 OID 16403)
-- Name: customers customers_customer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_customer_name_key UNIQUE (customer_name);


--
-- TOC entry 2871 (class 2606 OID 16405)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 2873 (class 2606 OID 16401)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 2875 (class 2606 OID 16423)
-- Name: depositor depositor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositor
    ADD CONSTRAINT depositor_pkey PRIMARY KEY (transcation_id);


--
-- TOC entry 2877 (class 2606 OID 16466)
-- Name: transcation_tb transcation_tb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transcation_tb
    ADD CONSTRAINT transcation_tb_pkey PRIMARY KEY (tid);


--
-- TOC entry 2878 (class 2606 OID 16426)
-- Name: depositor fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.depositor
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 2879 (class 2606 OID 16450)
-- Name: receiver receiver_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.receiver
    ADD CONSTRAINT receiver_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);

set timezone='Asia/Calcutta'
-- Completed on 2021-05-15 08:37:27

--
-- PostgreSQL database dump complete
--

