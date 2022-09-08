--
-- PostgreSQL database dump
--

-- Dumped from database version 11.16
-- Dumped by pg_dump version 11.16

-- Started on 2022-09-08 06:44:11

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

SET default_with_oids = false;

--
-- TOC entry 207 (class 1259 OID 25440)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    idcustomer integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone_number character(15),
    document_type integer NOT NULL,
    document_number character(20),
    email character varying(50),
    pass character varying(50),
    last_access date,
    observations character varying(200)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25438)
-- Name: customers_idcustomer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_idcustomer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_idcustomer_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 206
-- Name: customers_idcustomer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_idcustomer_seq OWNED BY public.customers.idcustomer;


--
-- TOC entry 205 (class 1259 OID 25373)
-- Name: reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservations (
    idreservation integer NOT NULL,
    customer integer NOT NULL,
    room integer NOT NULL,
    initial_date date,
    final_date date,
    rstate integer NOT NULL,
    type_payment integer NOT NULL,
    observations character varying(500)
);


ALTER TABLE public.reservations OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25371)
-- Name: reservation_idreservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_idreservation_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_idreservation_seq OWNER TO postgres;

--
-- TOC entry 2894 (class 0 OID 0)
-- Dependencies: 204
-- Name: reservation_idreservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_idreservation_seq OWNED BY public.reservations.idreservation;


--
-- TOC entry 203 (class 1259 OID 25328)
-- Name: reservation_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation_states (
    idreservationstate integer NOT NULL,
    rstate character varying(30)
);


ALTER TABLE public.reservation_states OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25326)
-- Name: reservation_state_idreservationstate_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservation_state_idreservationstate_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservation_state_idreservationstate_seq OWNER TO postgres;

--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 202
-- Name: reservation_state_idreservationstate_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservation_state_idreservationstate_seq OWNED BY public.reservation_states.idreservationstate;


--
-- TOC entry 209 (class 1259 OID 25460)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    idroom integer NOT NULL,
    room_name character varying(100),
    price numeric(8,2)
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 25458)
-- Name: rooms_idroom_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_idroom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_idroom_seq OWNER TO postgres;

--
-- TOC entry 2896 (class 0 OID 0)
-- Dependencies: 208
-- Name: rooms_idroom_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_idroom_seq OWNED BY public.rooms.idroom;


--
-- TOC entry 197 (class 1259 OID 25265)
-- Name: type_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_documents (
    idtypedocument integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.type_documents OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25263)
-- Name: type_document_idtypedocument_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_document_idtypedocument_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_document_idtypedocument_seq OWNER TO postgres;

--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 196
-- Name: type_document_idtypedocument_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_document_idtypedocument_seq OWNED BY public.type_documents.idtypedocument;


--
-- TOC entry 201 (class 1259 OID 25308)
-- Name: type_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_payments (
    idtypepayment integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.type_payments OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25306)
-- Name: type_payment_idtypepayment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_payment_idtypepayment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_payment_idtypepayment_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 200
-- Name: type_payment_idtypepayment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_payment_idtypepayment_seq OWNED BY public.type_payments.idtypepayment;


--
-- TOC entry 199 (class 1259 OID 25284)
-- Name: type_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_rooms (
    idtyperoom integer NOT NULL,
    name character varying(100),
    price numeric(8,2)
);


ALTER TABLE public.type_rooms OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25282)
-- Name: type_room_idtyperoom_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_room_idtyperoom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_room_idtyperoom_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 198
-- Name: type_room_idtyperoom_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_room_idtyperoom_seq OWNED BY public.type_rooms.idtyperoom;


--
-- TOC entry 2727 (class 2604 OID 25443)
-- Name: customers idcustomer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN idcustomer SET DEFAULT nextval('public.customers_idcustomer_seq'::regclass);


--
-- TOC entry 2725 (class 2604 OID 25331)
-- Name: reservation_states idreservationstate; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_states ALTER COLUMN idreservationstate SET DEFAULT nextval('public.reservation_state_idreservationstate_seq'::regclass);


--
-- TOC entry 2726 (class 2604 OID 25376)
-- Name: reservations idreservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations ALTER COLUMN idreservation SET DEFAULT nextval('public.reservation_idreservation_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 25463)
-- Name: rooms idroom; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN idroom SET DEFAULT nextval('public.rooms_idroom_seq'::regclass);


--
-- TOC entry 2722 (class 2604 OID 25268)
-- Name: type_documents idtypedocument; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents ALTER COLUMN idtypedocument SET DEFAULT nextval('public.type_document_idtypedocument_seq'::regclass);


--
-- TOC entry 2724 (class 2604 OID 25311)
-- Name: type_payments idtypepayment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_payments ALTER COLUMN idtypepayment SET DEFAULT nextval('public.type_payment_idtypepayment_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 25287)
-- Name: type_rooms idtyperoom; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_rooms ALTER COLUMN idtyperoom SET DEFAULT nextval('public.type_room_idtyperoom_seq'::regclass);


--
-- TOC entry 2885 (class 0 OID 25440)
-- Dependencies: 207
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers VALUES (1, 'Pablo', 'Rosales', '+51981165782   ', 1, '568744233           ', 'prosales@gmail.com', '4V*aR8fv5', '2022-09-08', 'Cliente frecuente');
INSERT INTO public.customers VALUES (2, 'Maria', 'Rosales', '965236874      ', 1, '78965235            ', 'mrosales@gmail.com', '5V*aR8fv5', '2022-08-09', 'Cliente concurrido');
INSERT INTO public.customers VALUES (3, 'Thalia', 'Fernandez', '975663248      ', 1, '85674235            ', 'tfernandez@gmail.com', '6V*aR8fv5', '2022-08-09', 'Cliente concurrido');


--
-- TOC entry 2881 (class 0 OID 25328)
-- Dependencies: 203
-- Data for Name: reservation_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservation_states VALUES (1, 'Pendiente');
INSERT INTO public.reservation_states VALUES (2, 'Pagado');
INSERT INTO public.reservation_states VALUES (3, 'Eliminado');


--
-- TOC entry 2883 (class 0 OID 25373)
-- Dependencies: 205
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservations VALUES (1, 1, 1, '2022-09-09', '2022-09-11', 1, 1, 'Sin observaciones');
INSERT INTO public.reservations VALUES (2, 2, 1, '2022-09-09', '2022-08-09', 1, 2, 'Reserva importante');
INSERT INTO public.reservations VALUES (3, 3, 3, '2022-10-10', '2022-10-11', 1, 4, 'Reserva importante para conferencia');


--
-- TOC entry 2887 (class 0 OID 25460)
-- Dependencies: 209
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rooms VALUES (1, 'Habitación Simple (1 cama simple)', 85.00);
INSERT INTO public.rooms VALUES (2, 'Habitación Doble (2 camas simples o 01 cama matrimonial)', 100.00);
INSERT INTO public.rooms VALUES (3, 'Habitación Doble con Balcón (2 camas simples o 01 cama matrimonial)', 120.00);


--
-- TOC entry 2875 (class 0 OID 25265)
-- Dependencies: 197
-- Data for Name: type_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_documents VALUES (1, 'DNI');
INSERT INTO public.type_documents VALUES (2, 'PASAPORTE');
INSERT INTO public.type_documents VALUES (3, 'CARNET DE EXTRANJERIA');


--
-- TOC entry 2879 (class 0 OID 25308)
-- Dependencies: 201
-- Data for Name: type_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_payments VALUES (1, 'Efectivo');
INSERT INTO public.type_payments VALUES (2, 'Tarjeta débito');
INSERT INTO public.type_payments VALUES (3, 'Tarjeta crédito');
INSERT INTO public.type_payments VALUES (4, 'Transferencia bancaria');
INSERT INTO public.type_payments VALUES (5, 'Paypal');
INSERT INTO public.type_payments VALUES (6, 'Por móvil');


--
-- TOC entry 2877 (class 0 OID 25284)
-- Dependencies: 199
-- Data for Name: type_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.type_rooms VALUES (1, 'Habitación Simple (1 cama simple)', 85.00);
INSERT INTO public.type_rooms VALUES (2, 'Habitación Doble (2 camas simples o 01 cama matrimonial)', 100.00);
INSERT INTO public.type_rooms VALUES (3, 'Habitación Doble con Balcón (2 camas simples o 01 cama matrimonial)', 120.00);


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 206
-- Name: customers_idcustomer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_idcustomer_seq', 1, true);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 204
-- Name: reservation_idreservation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_idreservation_seq', 1, true);


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 202
-- Name: reservation_state_idreservationstate_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_state_idreservationstate_seq', 3, true);


--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 208
-- Name: rooms_idroom_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_idroom_seq', 3, true);


--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 196
-- Name: type_document_idtypedocument_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_document_idtypedocument_seq', 3, true);


--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 200
-- Name: type_payment_idtypepayment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_payment_idtypepayment_seq', 6, true);


--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 198
-- Name: type_room_idtyperoom_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_room_idtyperoom_seq', 3, true);


--
-- TOC entry 2744 (class 2606 OID 25445)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (idcustomer);


--
-- TOC entry 2742 (class 2606 OID 25381)
-- Name: reservations reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (idreservation);


--
-- TOC entry 2736 (class 2606 OID 25333)
-- Name: reservation_states reservation_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation_states
    ADD CONSTRAINT reservation_state_pkey PRIMARY KEY (idreservationstate);


--
-- TOC entry 2747 (class 2606 OID 25465)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (idroom);


--
-- TOC entry 2730 (class 2606 OID 25270)
-- Name: type_documents type_document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_documents
    ADD CONSTRAINT type_document_pkey PRIMARY KEY (idtypedocument);


--
-- TOC entry 2734 (class 2606 OID 25401)
-- Name: type_payments type_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_payments
    ADD CONSTRAINT type_payment_pkey PRIMARY KEY (idtypepayment);


--
-- TOC entry 2732 (class 2606 OID 25289)
-- Name: type_rooms type_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_rooms
    ADD CONSTRAINT type_room_pkey PRIMARY KEY (idtyperoom);


--
-- TOC entry 2737 (class 1259 OID 25387)
-- Name: fki_fk_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_customer ON public.reservations USING btree (customer);


--
-- TOC entry 2738 (class 1259 OID 25393)
-- Name: fki_fk_room; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_room ON public.reservations USING btree (room);


--
-- TOC entry 2739 (class 1259 OID 25399)
-- Name: fki_fk_rstate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_rstate ON public.reservations USING btree (rstate);


--
-- TOC entry 2745 (class 1259 OID 25456)
-- Name: fki_fk_type_document; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_type_document ON public.customers USING btree (document_type);


--
-- TOC entry 2740 (class 1259 OID 25407)
-- Name: fki_fk_type_payment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_type_payment ON public.reservations USING btree (type_payment);


--
-- TOC entry 2750 (class 2606 OID 25446)
-- Name: reservations fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer) REFERENCES public.customers(idcustomer) NOT VALID;


--
-- TOC entry 2751 (class 2606 OID 25466)
-- Name: reservations fk_room; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_room FOREIGN KEY (room) REFERENCES public.rooms(idroom) NOT VALID;


--
-- TOC entry 2748 (class 2606 OID 25394)
-- Name: reservations fk_rstate; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_rstate FOREIGN KEY (rstate) REFERENCES public.reservation_states(idreservationstate) NOT VALID;


--
-- TOC entry 2752 (class 2606 OID 25451)
-- Name: customers fk_type_document; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_type_document FOREIGN KEY (document_type) REFERENCES public.type_documents(idtypedocument) NOT VALID;


--
-- TOC entry 2749 (class 2606 OID 25402)
-- Name: reservations fk_type_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_type_payment FOREIGN KEY (type_payment) REFERENCES public.type_payments(idtypepayment) NOT VALID;


-- Completed on 2022-09-08 06:44:11

--
-- PostgreSQL database dump complete
--

