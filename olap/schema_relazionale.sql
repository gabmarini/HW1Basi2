--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-04-05 19:21:51 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16459)
-- Name: AVA; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AVA";


ALTER SCHEMA "AVA" OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = "AVA", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16557)
-- Name: anno_accademico; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE anno_accademico (
    kanno_accademico integer NOT NULL,
    nome_anno_x text,
    "nome_anno_x-1" text,
    "nome_anno_x-1/x" text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16477)
-- Name: corso; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso (
    kcorso integer NOT NULL,
    nome_corso text,
    cfu_corso integer,
    ssd_corso text,
    codice_corso text
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16569)
-- Name: corso_di_studio; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE corso_di_studio (
    kcorso_di_studio integer NOT NULL,
    data_inizio_validita text,
    data_fine_validita text,
    nome_cds text,
    tipo_cds text,
    nome_dipartimento text,
    codice_dipartimento integer,
    codice_corso_studi bigint,
    codice_ateneo text
);


ALTER TABLE corso_di_studio OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16577)
-- Name: esami; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE esami (
    kstudente integer NOT NULL,
    kanno_accademico integer NOT NULL,
    kcorso_di_studi integer NOT NULL,
    ktempo integer NOT NULL,
    kcorso integer NOT NULL,
    voto integer,
    cfu_esame integer
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16590)
-- Name: ingressi; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE ingressi (
    kstudente integer NOT NULL,
    kanno_accademico integer NOT NULL,
    kcorso_di_studi integer NOT NULL,
    ktipo_immatricolazione integer NOT NULL,
    ktempo integer NOT NULL,
    voto_test_ingresso text,
    immatricolato integer
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16585)
-- Name: lauree; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE lauree (
    kstudente integer NOT NULL,
    kanno_accademico integer NOT NULL,
    kcorso_di_studi integer NOT NULL,
    ktempo integer NOT NULL,
    voto_finale text
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16549)
-- Name: studente; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE studente (
    kstudente integer NOT NULL,
    data_di_nascita text,
    coorte integer,
    titolo_di_studio text,
    sesso text,
    regione_residenza text,
    provincia_residenza text,
    comune_residenza text,
    stato_residenza text,
    cittadinanza text,
    codice_fiscale text,
    nazione_diploma text,
    tipo_scuola_superiore text,
    istituto_superiore text,
    anno_diploma integer,
    voto_diploma text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16460)
-- Name: tempo; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tempo (
    ktempo integer NOT NULL,
    anno integer,
    mese integer,
    giorno integer
);


ALTER TABLE tempo OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16471)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: AVA; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    ktipo_immatricolazione integer NOT NULL,
    tipo_ingresso text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 2067 (class 2606 OID 16564)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (kanno_accademico);


--
-- TOC entry 2069 (class 2606 OID 16576)
-- Name: corso_di_studio_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso_di_studio
    ADD CONSTRAINT corso_di_studio_pkey PRIMARY KEY (kcorso_di_studio);


--
-- TOC entry 2063 (class 2606 OID 16486)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (kcorso);


--
-- TOC entry 2071 (class 2606 OID 16581)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (kstudente, kanno_accademico, kcorso_di_studi, ktempo, kcorso);


--
-- TOC entry 2075 (class 2606 OID 16594)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (kstudente, kanno_accademico, kcorso_di_studi, ktipo_immatricolazione, ktempo);


--
-- TOC entry 2073 (class 2606 OID 16589)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (kstudente, kanno_accademico, kcorso_di_studi, ktempo);


--
-- TOC entry 2065 (class 2606 OID 16556)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (kstudente);


--
-- TOC entry 2059 (class 2606 OID 16464)
-- Name: tempo_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tempo
    ADD CONSTRAINT tempo_pkey PRIMARY KEY (ktempo);


--
-- TOC entry 2061 (class 2606 OID 16484)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: AVA; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (ktipo_immatricolazione);


-- Completed on 2016-04-05 19:21:51 CEST

--
-- PostgreSQL database dump complete
--

