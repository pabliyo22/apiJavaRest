--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.24
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: afip_batch_shipping_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_batch_shipping_batch (
    id integer NOT NULL,
    shipping integer,
    oper_id integer,
    egm integer NOT NULL,
    codtipomaquina character varying(255) DEFAULT NULL::character varying,
    codmarca character varying(255) DEFAULT NULL::character varying,
    desctipomarca character varying(255) DEFAULT NULL::character varying,
    codmodelo character varying(255) DEFAULT NULL::character varying,
    descmodelo character varying(255) DEFAULT NULL::character varying,
    codjuego character varying(255) DEFAULT NULL::character varying,
    descjuego character varying(255) DEFAULT NULL::character varying,
    nroserie character varying(255) DEFAULT NULL::character varying,
    software character varying(255) DEFAULT NULL::character varying,
    multipuesto character varying(255) DEFAULT NULL::character varying,
    particoarrend character varying(255) DEFAULT NULL::character varying,
    codtipocomision character varying(255) DEFAULT NULL::character varying,
    porccomision character varying(255) DEFAULT NULL::character varying,
    cannoncomision character varying(255) DEFAULT NULL::character varying,
    observcomision character varying(255) DEFAULT NULL::character varying,
    feciniop date,
    codbaja character varying(255) DEFAULT NULL::character varying,
    descbaja character varying(255) DEFAULT NULL::character varying,
    fechabaja date
);


ALTER TABLE afip_batch_shipping_batch OWNER TO postgres;

--
-- Name: afip_batch_shipping_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_batch_shipping_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_batch_shipping_batch_id_seq OWNER TO postgres;

--
-- Name: afip_batch_shipping_batch_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_batch_shipping_batch_log (
    id integer NOT NULL,
    sent_at timestamp(0) without time zone NOT NULL,
    batch_num integer NOT NULL,
    explotation_point integer NOT NULL,
    said integer NOT NULL,
    error_cod integer NOT NULL,
    msg text NOT NULL
);


ALTER TABLE afip_batch_shipping_batch_log OWNER TO postgres;

--
-- Name: afip_batch_shipping_batch_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_batch_shipping_batch_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_batch_shipping_batch_log_id_seq OWNER TO postgres;

--
-- Name: afip_certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_certificate (
    id integer NOT NULL,
    cuit_id integer,
    keyfile character varying(255) NOT NULL,
    crtfile character varying(255) NOT NULL,
    timestamp_created timestamp(0) without time zone NOT NULL
);


ALTER TABLE afip_certificate OWNER TO postgres;

--
-- Name: afip_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_certificate_id_seq OWNER TO postgres;

--
-- Name: afip_cuits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_cuits (
    id integer NOT NULL,
    cuit character varying(255) NOT NULL,
    name character varying(250) DEFAULT NULL::character varying,
    code character varying(5) DEFAULT NULL::character varying,
    address character varying(250) DEFAULT NULL::character varying
);


ALTER TABLE afip_cuits OWNER TO postgres;

--
-- Name: afip_cuits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_cuits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_cuits_id_seq OWNER TO postgres;

--
-- Name: afip_egm_blocked; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_egm_blocked (
    id integer NOT NULL,
    accountingdate date NOT NULL,
    egm integer,
    datecratedrecord timestamp(0) without time zone NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_egm_blocked OWNER TO postgres;

--
-- Name: afip_egm_blocked_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_egm_blocked_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_egm_blocked_id_seq OWNER TO postgres;

--
-- Name: afip_egm_ship_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_egm_ship_counters (
    id integer NOT NULL,
    dateseqend timestamp(0) without time zone NOT NULL,
    dateseqstart timestamp(0) without time zone NOT NULL,
    jj bigint NOT NULL,
    ci bigint NOT NULL,
    co bigint NOT NULL,
    jp bigint NOT NULL
);


ALTER TABLE afip_egm_ship_counters OWNER TO postgres;

--
-- Name: afip_egm_ship_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_egm_ship_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_egm_ship_counters_id_seq OWNER TO postgres;

--
-- Name: afip_egm_ship_counters_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_egm_ship_counters_log (
    id integer NOT NULL,
    dateseqend timestamp(0) without time zone NOT NULL,
    dateseqstart timestamp(0) without time zone NOT NULL,
    jj bigint NOT NULL,
    ci bigint NOT NULL,
    co bigint NOT NULL,
    jp bigint NOT NULL
);


ALTER TABLE afip_egm_ship_counters_log OWNER TO postgres;

--
-- Name: afip_egm_shipping_egm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_egm_shipping_egm (
    id integer NOT NULL,
    shipping integer,
    firstcounter_id integer,
    lastcounter_id integer,
    state integer,
    egm integer NOT NULL,
    nrosec integer NOT NULL,
    nropres integer DEFAULT 1 NOT NULL,
    denomegm character varying(255) NOT NULL,
    datecratedrecord timestamp(0) without time zone NOT NULL,
    win double precision NOT NULL
);


ALTER TABLE afip_egm_shipping_egm OWNER TO postgres;

--
-- Name: afip_egm_shipping_egm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_egm_shipping_egm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_egm_shipping_egm_id_seq OWNER TO postgres;

--
-- Name: afip_egm_shipping_egm_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_egm_shipping_egm_log (
    id integer NOT NULL,
    shipping integer,
    firstcounter_id integer,
    lastcounter_id integer,
    state integer,
    egm integer NOT NULL,
    nrosec integer NOT NULL,
    nropres integer DEFAULT 1 NOT NULL,
    denomegm character varying(255) NOT NULL,
    datecratedrecord timestamp(0) without time zone NOT NULL,
    win double precision NOT NULL
);


ALTER TABLE afip_egm_shipping_egm_log OWNER TO postgres;

--
-- Name: afip_errors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_errors (
    id integer NOT NULL,
    description text NOT NULL,
    errorcode integer NOT NULL
);


ALTER TABLE afip_errors OWNER TO postgres;

--
-- Name: afip_errors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_errors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_errors_id_seq OWNER TO postgres;

--
-- Name: afip_explotation_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_explotation_points (
    id integer NOT NULL,
    floor_id integer,
    number bigint DEFAULT 0 NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    externidfloor integer NOT NULL
);


ALTER TABLE afip_explotation_points OWNER TO postgres;

--
-- Name: afip_explotation_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_explotation_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_explotation_points_id_seq OWNER TO postgres;

--
-- Name: afip_explotation_points_servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_explotation_points_servers (
    explotationpoint_id integer NOT NULL,
    server_id integer NOT NULL
);


ALTER TABLE afip_explotation_points_servers OWNER TO postgres;

--
-- Name: afip_handler_shipping_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_batch (
    id integer NOT NULL,
    handler_ship_egm_user integer,
    senddate timestamp(0) without time zone NOT NULL,
    nrolote integer DEFAULT 0 NOT NULL,
    resultado character varying(255) NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_handler_shipping_batch OWNER TO postgres;

--
-- Name: afip_handler_shipping_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_handler_shipping_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_handler_shipping_batch_id_seq OWNER TO postgres;

--
-- Name: afip_handler_shipping_egm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_egm (
    id integer NOT NULL,
    state integer,
    handler_ship_egm_user integer,
    vemachine boolean NOT NULL,
    senddate timestamp(0) without time zone NOT NULL,
    accountingdate date NOT NULL,
    winday double precision,
    lastsenddate timestamp(0) without time zone NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_handler_shipping_egm OWNER TO postgres;

--
-- Name: afip_handler_shipping_egm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_handler_shipping_egm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_handler_shipping_egm_id_seq OWNER TO postgres;

--
-- Name: afip_handler_shipping_egm_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_egm_log (
    id integer NOT NULL,
    state integer,
    handler_ship_egm_user integer,
    vemachine boolean NOT NULL,
    senddate timestamp(0) without time zone NOT NULL,
    accountingdate date NOT NULL,
    winday double precision,
    lastsenddate timestamp(0) without time zone NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_handler_shipping_egm_log OWNER TO postgres;

--
-- Name: afip_handler_shipping_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_table (
    id integer NOT NULL,
    state integer,
    handler_ship_table_user integer,
    bingo integer,
    senddate timestamp(0) without time zone NOT NULL,
    nropres integer DEFAULT 1 NOT NULL,
    accountingdate date NOT NULL,
    lastsenddate timestamp(0) without time zone NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_handler_shipping_table OWNER TO postgres;

--
-- Name: afip_handler_shipping_table_bingo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_table_bingo (
    id integer NOT NULL,
    efectivoapertura integer NOT NULL,
    efectivocierre integer NOT NULL,
    totalventas integer NOT NULL,
    totalpagos integer NOT NULL,
    diferenciacaja integer NOT NULL
);


ALTER TABLE afip_handler_shipping_table_bingo OWNER TO postgres;

--
-- Name: afip_handler_shipping_table_bingo_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_handler_shipping_table_bingo_data (
    id integer NOT NULL,
    id_bingo integer,
    nropartida integer DEFAULT 0 NOT NULL,
    fechainicio timestamp(0) without time zone NOT NULL,
    valorcarton integer DEFAULT 0 NOT NULL,
    nroserie integer DEFAULT 0 NOT NULL,
    cantcarserie integer DEFAULT 0 NOT NULL,
    cantcarven integer DEFAULT 0 NOT NULL,
    nroprimercarven integer DEFAULT 0 NOT NULL,
    nroultcarven integer DEFAULT 0 NOT NULL,
    totprempag double precision DEFAULT 0::double precision NOT NULL
);


ALTER TABLE afip_handler_shipping_table_bingo_data OWNER TO postgres;

--
-- Name: afip_handler_shipping_table_bingo_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_handler_shipping_table_bingo_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_handler_shipping_table_bingo_data_id_seq OWNER TO postgres;

--
-- Name: afip_handler_shipping_table_bingo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_handler_shipping_table_bingo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_handler_shipping_table_bingo_id_seq OWNER TO postgres;

--
-- Name: afip_handler_shipping_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_handler_shipping_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_handler_shipping_table_id_seq OWNER TO postgres;

--
-- Name: afip_operations_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_operations_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE afip_operations_types OWNER TO postgres;

--
-- Name: afip_servers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_servers (
    id integer NOT NULL,
    description character varying(255) NOT NULL,
    wsurl character varying(255) NOT NULL,
    wsport integer NOT NULL,
    wsuser character varying(255) NOT NULL,
    wspass character varying(255) NOT NULL,
    servertype_id integer
);


ALTER TABLE afip_servers OWNER TO postgres;

--
-- Name: afip_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_servers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_servers_id_seq OWNER TO postgres;

--
-- Name: afip_servers_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_servers_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE afip_servers_types OWNER TO postgres;

--
-- Name: afip_servers_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_servers_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_servers_types_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_errors_batch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_errors_batch (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    description text NOT NULL,
    shipping_id integer
);


ALTER TABLE afip_shipping_errors_batch OWNER TO postgres;

--
-- Name: afip_shipping_errors_batch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_shipping_errors_batch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_shipping_errors_batch_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_errors_bingo_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_errors_bingo_data (
    id integer NOT NULL,
    descriptionsingular character varying(255) NOT NULL,
    errorcodeafip_id integer,
    errorcodetable_id integer
);


ALTER TABLE afip_shipping_errors_bingo_data OWNER TO postgres;

--
-- Name: afip_shipping_errors_bingo_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_shipping_errors_bingo_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_shipping_errors_bingo_data_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_errors_egm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_errors_egm (
    id integer NOT NULL,
    descriptionsingular character varying(255) NOT NULL,
    errorcodeafip_id integer,
    errorcodeegm integer
);


ALTER TABLE afip_shipping_errors_egm OWNER TO postgres;

--
-- Name: afip_shipping_errors_egm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_shipping_errors_egm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_shipping_errors_egm_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_errors_egm_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_errors_egm_log (
    id integer NOT NULL,
    descriptionsingular character varying(255) NOT NULL,
    errorcodeafip_id integer,
    errorcodeegm integer
);


ALTER TABLE afip_shipping_errors_egm_log OWNER TO postgres;

--
-- Name: afip_shipping_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_state (
    id integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE afip_shipping_state OWNER TO postgres;

--
-- Name: afip_shipping_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_shipping_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_shipping_state_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_state_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_state_types (
    id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE afip_shipping_state_types OWNER TO postgres;

--
-- Name: afip_shipping_state_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_shipping_state_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_shipping_state_types_id_seq OWNER TO postgres;

--
-- Name: afip_shipping_states_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_shipping_states_types (
    shippingstate_id integer NOT NULL,
    shippingstatetype_id integer NOT NULL
);


ALTER TABLE afip_shipping_states_types OWNER TO postgres;

--
-- Name: afip_table_shipping_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_table_shipping_table (
    id integer NOT NULL,
    shipping integer,
    tabletype integer NOT NULL,
    tablesquantity integer NOT NULL,
    opencash double precision NOT NULL,
    closecash double precision NOT NULL,
    amounteqchipsopen double precision NOT NULL,
    amounteqchipsclose double precision NOT NULL,
    totalretirement double precision NOT NULL,
    totalrefill double precision NOT NULL,
    totaleqretirement double precision NOT NULL,
    totaleqrefill double precision NOT NULL,
    totalsell double precision NOT NULL,
    totalpay double precision NOT NULL,
    differencebox double precision NOT NULL,
    totalticketpromgive double precision NOT NULL,
    totalticketpromretrieve double precision NOT NULL
);


ALTER TABLE afip_table_shipping_table OWNER TO postgres;

--
-- Name: afip_table_shipping_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_table_shipping_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_table_shipping_table_id_seq OWNER TO postgres;

--
-- Name: afip_ve_comms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_ve_comms (
    id integer NOT NULL,
    state integer,
    cuit_adresee_id integer,
    idcomm character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    priority integer NOT NULL,
    subject character varying(255) NOT NULL,
    accountingdate date NOT NULL,
    attached character varying(255) DEFAULT NULL::character varying,
    datecreatedrecord timestamp(0) without time zone NOT NULL,
    explotationpoint_id integer
);


ALTER TABLE afip_ve_comms OWNER TO postgres;

--
-- Name: afip_ve_comms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_ve_comms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_ve_comms_id_seq OWNER TO postgres;

--
-- Name: afip_ve_machine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE afip_ve_machine (
    id integer NOT NULL,
    shipping_id integer,
    comm integer,
    statedesc character varying(255) DEFAULT NULL::character varying,
    idsolicitud character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE afip_ve_machine OWNER TO postgres;

--
-- Name: afip_ve_machine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE afip_ve_machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE afip_ve_machine_id_seq OWNER TO postgres;

--
-- Name: cr_authentication_error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_authentication_error_log (
    id integer NOT NULL,
    user_id integer,
    ip_address character varying(45) NOT NULL,
    attempt integer NOT NULL,
    created_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE cr_authentication_error_log OWNER TO postgres;

--
-- Name: cr_authentication_error_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_authentication_error_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_authentication_error_log_id_seq OWNER TO postgres;

--
-- Name: cr_floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_floor (
    id integer NOT NULL,
    owner_id integer,
    code character varying(3) NOT NULL,
    description character varying(30) NOT NULL,
    ip character varying(15) NOT NULL
);


ALTER TABLE cr_floor OWNER TO postgres;

--
-- Name: cr_floor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_floor_id_seq OWNER TO postgres;

--
-- Name: cr_global_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_parameter (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(255) NOT NULL,
    parametercategory_id integer,
    parametervalue_id integer
);


ALTER TABLE cr_global_parameter OWNER TO postgres;

--
-- Name: cr_global_parameter_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_parameter_category (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE cr_global_parameter_category OWNER TO postgres;

--
-- Name: cr_global_parameter_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_global_parameter_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_global_parameter_category_id_seq OWNER TO postgres;

--
-- Name: cr_global_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_global_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_global_parameter_id_seq OWNER TO postgres;

--
-- Name: cr_global_parameter_value; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_parameter_value (
    id integer NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE cr_global_parameter_value OWNER TO postgres;

--
-- Name: cr_global_parameter_value_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_global_parameter_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_global_parameter_value_id_seq OWNER TO postgres;

--
-- Name: cr_global_paramval_boolean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_boolean (
    id integer NOT NULL,
    value boolean,
    default_value boolean NOT NULL
);


ALTER TABLE cr_global_paramval_boolean OWNER TO postgres;

--
-- Name: cr_global_paramval_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_date (
    id integer NOT NULL,
    value date,
    default_value date NOT NULL
);


ALTER TABLE cr_global_paramval_date OWNER TO postgres;

--
-- Name: cr_global_paramval_datetime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_datetime (
    id integer NOT NULL,
    value timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    default_value timestamp(0) without time zone NOT NULL
);


ALTER TABLE cr_global_paramval_datetime OWNER TO postgres;

--
-- Name: cr_global_paramval_decimal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_decimal (
    id integer NOT NULL,
    value double precision,
    default_value double precision NOT NULL,
    minvalue double precision NOT NULL,
    max_value double precision NOT NULL
);


ALTER TABLE cr_global_paramval_decimal OWNER TO postgres;

--
-- Name: cr_global_paramval_integer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_integer (
    id integer NOT NULL,
    value integer,
    default_value integer NOT NULL,
    minvalue integer NOT NULL,
    max_value integer NOT NULL
);


ALTER TABLE cr_global_paramval_integer OWNER TO postgres;

--
-- Name: cr_global_paramval_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_options (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    default_value character varying(255) NOT NULL,
    options_values text NOT NULL
);


ALTER TABLE cr_global_paramval_options OWNER TO postgres;

--
-- Name: COLUMN cr_global_paramval_options.options_values; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cr_global_paramval_options.options_values IS '(DC2Type:array)';


--
-- Name: cr_global_paramval_string; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_string (
    id integer NOT NULL,
    value character varying(255) DEFAULT NULL::character varying,
    default_value character varying(255) NOT NULL
);


ALTER TABLE cr_global_paramval_string OWNER TO postgres;

--
-- Name: cr_global_paramval_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_global_paramval_time (
    id integer NOT NULL,
    value time(0) without time zone DEFAULT NULL::time without time zone,
    default_value time(0) without time zone NOT NULL
);


ALTER TABLE cr_global_paramval_time OWNER TO postgres;

--
-- Name: cr_locked_user_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_locked_user_log (
    id integer NOT NULL,
    locked_user_id integer,
    unlocked_user_id integer,
    locked boolean DEFAULT false NOT NULL,
    lock_timestamp timestamp(0) without time zone NOT NULL,
    unlock_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE cr_locked_user_log OWNER TO postgres;

--
-- Name: cr_locked_user_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_locked_user_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_locked_user_log_id_seq OWNER TO postgres;

--
-- Name: cr_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_owner (
    id integer NOT NULL,
    name character varying(250) DEFAULT NULL::character varying,
    code character varying(5) DEFAULT NULL::character varying,
    address character varying(250) DEFAULT NULL::character varying
);


ALTER TABLE cr_owner OWNER TO postgres;

--
-- Name: cr_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_owner_id_seq OWNER TO postgres;

--
-- Name: cr_password_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_password_log (
    id integer NOT NULL,
    user_id integer,
    floor_id integer,
    password character varying(64) NOT NULL,
    salt character varying(255) NOT NULL,
    password_change_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE cr_password_log OWNER TO postgres;

--
-- Name: cr_password_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_password_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_password_log_id_seq OWNER TO postgres;

--
-- Name: cr_session_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_session_log (
    id integer NOT NULL,
    user_id integer,
    timestamp_in timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    timestamp_out timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE cr_session_log OWNER TO postgres;

--
-- Name: cr_session_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_session_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_session_log_id_seq OWNER TO postgres;

--
-- Name: cr_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_user (
    id integer NOT NULL,
    username character varying(10) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(60) NOT NULL,
    last_name character varying(60) NOT NULL,
    password_reset boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    last_password_change timestamp(0) without time zone NOT NULL,
    salt character varying(255) NOT NULL,
    is_administrator boolean DEFAULT false NOT NULL
);


ALTER TABLE cr_user OWNER TO postgres;

--
-- Name: cr_user_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_user_access (
    id integer NOT NULL,
    user_profile_id integer,
    permissions text NOT NULL
);


ALTER TABLE cr_user_access OWNER TO postgres;

--
-- Name: COLUMN cr_user_access.permissions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN cr_user_access.permissions IS '(DC2Type:array)';


--
-- Name: cr_user_access_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_user_access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_user_access_id_seq OWNER TO postgres;

--
-- Name: cr_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_user_id_seq OWNER TO postgres;

--
-- Name: cr_user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_user_profile (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(255) NOT NULL,
    is_erasable boolean DEFAULT true NOT NULL
);


ALTER TABLE cr_user_profile OWNER TO postgres;

--
-- Name: cr_user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_user_profile_id_seq OWNER TO postgres;

--
-- Name: cr_user_user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_user_user_profile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    user_profile_id integer NOT NULL,
    floor_id integer
);


ALTER TABLE cr_user_user_profile OWNER TO postgres;

--
-- Name: cr_user_user_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cr_user_user_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cr_user_user_profile_id_seq OWNER TO postgres;

--
-- Name: cr_users_floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cr_users_floor (
    user_id integer NOT NULL,
    floor_id integer NOT NULL
);


ALTER TABLE cr_users_floor OWNER TO postgres;

--
-- Name: migrations_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations_versions (
    version character varying(255) NOT NULL
);


ALTER TABLE migrations_versions OWNER TO postgres;

--
-- Name: pr_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_areas (
    id integer NOT NULL,
    external_area_id integer NOT NULL,
    description character varying(50) NOT NULL
);


ALTER TABLE pr_areas OWNER TO postgres;

--
-- Name: pr_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_areas_id_seq OWNER TO postgres;

--
-- Name: pr_game_session_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_game_session_members (
    id integer NOT NULL,
    member_id integer,
    accounting_date date NOT NULL,
    system_date timestamp(0) without time zone NOT NULL,
    game_time time(0) without time zone NOT NULL,
    ci double precision NOT NULL,
    co double precision NOT NULL,
    jp bigint NOT NULL,
    jj bigint NOT NULL,
    jg bigint NOT NULL
);


ALTER TABLE pr_game_session_members OWNER TO postgres;

--
-- Name: pr_game_session_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_game_session_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_game_session_members_id_seq OWNER TO postgres;

--
-- Name: pr_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item (
    id integer NOT NULL,
    printer_type_id integer,
    name character varying(150) NOT NULL,
    quantity integer DEFAULT 1,
    available integer DEFAULT 1,
    enabled boolean DEFAULT true NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE pr_item OWNER TO postgres;

--
-- Name: pr_item_generated; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item_generated (
    id integer NOT NULL,
    promo_redeemed_id integer,
    item_id integer,
    observations character varying(255) DEFAULT 'item generado'::character varying NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE pr_item_generated OWNER TO postgres;

--
-- Name: pr_item_generated_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_item_generated_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_item_generated_id_seq OWNER TO postgres;

--
-- Name: pr_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_item_id_seq OWNER TO postgres;

--
-- Name: pr_item_tito; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item_tito (
    id integer NOT NULL,
    tito_type integer,
    area_tito integer,
    amount double precision NOT NULL,
    activationdaysdifered integer,
    activationhour time(0) without time zone DEFAULT NULL::time without time zone,
    validdays integer DEFAULT 30 NOT NULL
);


ALTER TABLE pr_item_tito OWNER TO postgres;

--
-- Name: pr_item_tito_generated; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item_tito_generated (
    id integer NOT NULL,
    status integer,
    ticketnumber integer NOT NULL,
    barcode character varying(255) NOT NULL,
    text text NOT NULL,
    voucher_title text NOT NULL,
    expiration_datetime timestamp(0) without time zone NOT NULL,
    expiration_numdays text NOT NULL,
    ticket_datetime timestamp(0) without time zone NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL
);


ALTER TABLE pr_item_tito_generated OWNER TO postgres;

--
-- Name: pr_item_voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item_voucher (
    id integer NOT NULL,
    seed character varying(255) DEFAULT NULL::character varying,
    valid_days integer DEFAULT 1
);


ALTER TABLE pr_item_voucher OWNER TO postgres;

--
-- Name: pr_item_voucher_generated; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_item_voucher_generated (
    id integer NOT NULL,
    status integer,
    barcode character varying(255) NOT NULL,
    text text NOT NULL,
    due_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE pr_item_voucher_generated OWNER TO postgres;

--
-- Name: pr_items_assiganted_promo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_items_assiganted_promo (
    promo_id integer NOT NULL,
    items_id integer NOT NULL
);


ALTER TABLE pr_items_assiganted_promo OWNER TO postgres;

--
-- Name: pr_last_update; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_last_update (
    id integer NOT NULL,
    date timestamp(0) without time zone NOT NULL
);


ALTER TABLE pr_last_update OWNER TO postgres;

--
-- Name: pr_last_update_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_last_update_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_last_update_id_seq OWNER TO postgres;

--
-- Name: pr_log_themler_change; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_log_themler_change (
    id integer NOT NULL,
    user_promo integer,
    creation_date timestamp(0) without time zone NOT NULL,
    json character varying(255) NOT NULL
);


ALTER TABLE pr_log_themler_change OWNER TO postgres;

--
-- Name: pr_log_themler_change_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_log_themler_change_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_log_themler_change_id_seq OWNER TO postgres;

--
-- Name: pr_member_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_member_points (
    id integer NOT NULL,
    member_id integer,
    system_date timestamp(0) without time zone NOT NULL,
    update_date timestamp(0) without time zone NOT NULL,
    tipe_point text NOT NULL,
    points bigint NOT NULL
);


ALTER TABLE pr_member_points OWNER TO postgres;

--
-- Name: pr_member_points_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_member_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_member_points_id_seq OWNER TO postgres;

--
-- Name: pr_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_members (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    external_socio_id bigint,
    card_id character varying(255) DEFAULT NULL::character varying,
    modification_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE pr_members OWNER TO postgres;

--
-- Name: pr_members_data_cvip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_members_data_cvip (
    id integer NOT NULL,
    member integer,
    atributo character varying(255) NOT NULL,
    valor character varying(255) NOT NULL
);


ALTER TABLE pr_members_data_cvip OWNER TO postgres;

--
-- Name: pr_members_data_cvip_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_members_data_cvip_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_members_data_cvip_id_seq OWNER TO postgres;

--
-- Name: pr_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_members_id_seq OWNER TO postgres;

--
-- Name: pr_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_operations (
    id integer NOT NULL,
    status integer,
    operation_origin integer,
    user_operator integer,
    item_generated_id integer,
    origin_id integer NOT NULL,
    date timestamp(0) without time zone NOT NULL
);


ALTER TABLE pr_operations OWNER TO postgres;

--
-- Name: pr_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_operations_id_seq OWNER TO postgres;

--
-- Name: pr_operators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_operators (
    id integer NOT NULL,
    symbol character varying(255) NOT NULL,
    symboltext character varying(255) NOT NULL
);


ALTER TABLE pr_operators OWNER TO postgres;

--
-- Name: pr_operators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_operators_id_seq OWNER TO postgres;

--
-- Name: pr_origin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_origin (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE pr_origin OWNER TO postgres;

--
-- Name: pr_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_origin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_origin_id_seq OWNER TO postgres;

--
-- Name: pr_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_parameters (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    strategy character varying(255) DEFAULT NULL::character varying,
    filter_json text,
    visible boolean DEFAULT true NOT NULL,
    type character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE pr_parameters OWNER TO postgres;

--
-- Name: pr_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_parameters_id_seq OWNER TO postgres;

--
-- Name: pr_parameters_operators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_parameters_operators (
    parameters_id integer NOT NULL,
    operators_id integer NOT NULL
);


ALTER TABLE pr_parameters_operators OWNER TO postgres;

--
-- Name: pr_printers_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_printers_type (
    id integer NOT NULL,
    code text NOT NULL
);


ALTER TABLE pr_printers_type OWNER TO postgres;

--
-- Name: pr_printers_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_printers_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_printers_type_id_seq OWNER TO postgres;

--
-- Name: pr_promo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_promo (
    id integer NOT NULL,
    user_promo integer,
    name character varying(255) NOT NULL,
    date_from timestamp(0) without time zone NOT NULL,
    date_to timestamp(0) without time zone NOT NULL,
    creation_date timestamp(0) without time zone NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE pr_promo OWNER TO postgres;

--
-- Name: pr_promo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_promo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_promo_id_seq OWNER TO postgres;

--
-- Name: pr_promo_redeemed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_promo_redeemed (
    id integer NOT NULL,
    promo_id integer,
    member_id integer,
    date timestamp(0) without time zone NOT NULL
);


ALTER TABLE pr_promo_redeemed OWNER TO postgres;

--
-- Name: pr_promo_redeemed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_promo_redeemed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_promo_redeemed_id_seq OWNER TO postgres;

--
-- Name: pr_promo_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_promo_rules (
    id integer NOT NULL,
    promo_id integer,
    formula character varying(255) NOT NULL,
    json text NOT NULL
);


ALTER TABLE pr_promo_rules OWNER TO postgres;

--
-- Name: pr_promo_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_promo_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_promo_rules_id_seq OWNER TO postgres;

--
-- Name: pr_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_rules (
    id integer NOT NULL,
    parameter integer,
    operator integer,
    associated_formula_id integer,
    value text NOT NULL
);


ALTER TABLE pr_rules OWNER TO postgres;

--
-- Name: pr_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_rules_id_seq OWNER TO postgres;

--
-- Name: pr_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_status (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE pr_status OWNER TO postgres;

--
-- Name: pr_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_status_id_seq OWNER TO postgres;

--
-- Name: pr_tito_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pr_tito_type (
    id integer NOT NULL,
    active boolean NOT NULL,
    description text NOT NULL,
    titonumber text NOT NULL
);


ALTER TABLE pr_tito_type OWNER TO postgres;

--
-- Name: pr_tito_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pr_tito_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pr_tito_type_id_seq OWNER TO postgres;

--
-- Data for Name: afip_batch_shipping_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_batch_shipping_batch_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_cuits; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_cuits VALUES (1, '20241712711', 'Teceng Gaming', NULL, NULL);
INSERT INTO afip_cuits VALUES (2, '20241712711', 'S.T.A.R.S Labs', NULL, NULL);
INSERT INTO afip_cuits VALUES (3, '20241712711', 'Wayne Enterprises', NULL, NULL);


--
-- Data for Name: afip_egm_blocked; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_egm_ship_counters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_egm_ship_counters_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_egm_shipping_egm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_egm_shipping_egm_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_errors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_errors VALUES (1, 'El punto de explotación deberá estar dado de alta en el sistema  JAzA para la CUIT representada', 2000);
INSERT INTO afip_errors VALUES (2, 'La fecha de presentación no puede ser superior a la fecha  actual', 2001);
INSERT INTO afip_errors VALUES (3, 'Si se trata de la primer   presentación para esa fecha de  presentación , CUIT y nro. de   punto de explotación , el número    de presentación debe ser 1. Si es   una presentación correctiva,  debe ser igual a 1 + el último  número de presentacióninformado para esa  fecha/CUIT/punto de explotación', 2002);
INSERT INTO afip_errors VALUES (4, 'La fecha de presentación no  puede ser posterior a la última fecha informada + 1 (no se  puede dejar un día sin informar  entre dos presentaciones', 2003);
INSERT INTO afip_errors VALUES (5, 'No puede informarse una rectificativa para esa fecha porque no hay ninguna presentación inicial para esa fecha', 2005);
INSERT INTO afip_errors VALUES (6, 'La fecha de presentación no puede ser anterior a la fecha de  la  última presentación autorizada', 2004);
INSERT INTO afip_errors VALUES (7, 'La cantidad de cartones vendidos  no debe superar los seis dígitos', 2101);
INSERT INTO afip_errors VALUES (8, 'La cantidad de cartones de la  serie no debe superar los seis dígitos', 2102);
INSERT INTO afip_errors VALUES (9, 'El número del primer cartón  vendido no debe superar los seis  dígitos', 2103);
INSERT INTO afip_errors VALUES (10, 'El número del último cartón  vendido no debe superar los seis  dígitos', 2104);
INSERT INTO afip_errors VALUES (11, 'La cantidad de cartones vendidos  no puede ser mayor a la cantidad  de cartones de la serie', 2105);
INSERT INTO afip_errors VALUES (12, 'La cantidad de  cartones de la  serie no puede ser menor a la  cantidad de cartones existente  entre el primer número de cartón vendido y el último', 2106);
INSERT INTO afip_errors VALUES (13, 'La cantidad de cartones vendidos  no puede ser mayor a la cantidad  de cartones existente entre el primer número de cartón  vendido y el último', 2107);
INSERT INTO afip_errors VALUES (14, 'Si la cantidad de cartones  vendidos es 0 (cero), el total de  premios pagados debe ser 0  (cero)', 2108);
INSERT INTO afip_errors VALUES (15, 'Si la cantidad de cartones  vendidos es mayor a 0 (cero), el total de premios pagados debe ser mayor a 0 (cero)', 2109);
INSERT INTO afip_errors VALUES (16, 'La fecha-hora informada no puede ser superior a la actual', 2110);
INSERT INTO afip_errors VALUES (17, 'El número de partida debe ser  único para el punto de explotación informado. Si existe más de una serie para una misma partida, el número de partida podrá estar duplicado, pero en cada caso con un  número de serie diferente', 2111);
INSERT INTO afip_errors VALUES (18, ' La fecha-hora de inicio de la partida informada no es compatible fecha de la presentacin . La fecha-hora de inicio debe estar dentro del dia de la presentacion o el dia siguiente', 2113);
INSERT INTO afip_errors VALUES (19, 'La cantidad de cartones vendidos  no debe superar los  cuatro dígitos', 2112);
INSERT INTO afip_errors VALUES (20, 'Efectivo de apertura + total de ventas + diferencia de caja -total de pagos debería ser igual al efectivo de cierre', 2201);
INSERT INTO afip_errors VALUES (21, 'El tipo de mesa debe ser uno de los siguientes valores: 1 –Ruleta,2 –Naipes,3 –Dados,4 –Torneo,99 –Otros', 2301);
INSERT INTO afip_errors VALUES (22, 'La cantidad de mesas debe ser mayor o igual a 0 (cero)', 2302);
INSERT INTO afip_errors VALUES (23, 'La cantidad de mesas debe ser menor o igual a 9999', 2303);
INSERT INTO afip_errors VALUES (24, 'No se debe informar un mismo tipo de mesa más de una vez en una presentación dada (se totaliza por tipo de mesa)', 2304);
INSERT INTO afip_errors VALUES (25, 'El punto de explotación deberá estar dado de alta en el sistema JAzA para la CUIT representada', 1000);
INSERT INTO afip_errors VALUES (26, 'La máquina que desea informar no está declarada en JAzA para la CUIT, punto de explotación y fecha indicada', 1001);
INSERT INTO afip_errors VALUES (27, 'La fecha de presentación no puede ser superior a la fecha actual', 1020);
INSERT INTO afip_errors VALUES (28, 'La fecha de presentación indicada no debe seranterior al inicio de operaciones registrado en JAzA para la máquina electrónica', 1002);
INSERT INTO afip_errors VALUES (29, 'Antes de informar los datos de la máquina electrónica para la fecha indicada, debe informarlos para la primer fecha pendiente', 1003);
INSERT INTO afip_errors VALUES (30, 'Sólo se pueden rectificar presentaciones dentro de los 30 días', 1004);
INSERT INTO afip_errors VALUES (31, 'Para el primer envío de información de una máquina en una fecha dada, se debe informar número de presentación 1', 1005);
INSERT INTO afip_errors VALUES (32, 'Para el primer envío de información de una máquina en una fecha dada, se debe informar secuencia 1', 1006);
INSERT INTO afip_errors VALUES (33, 'Si se informa una secuencia adicional para una máquina (debido a la existencia de un rollover o reseteo) se debe indicar el mismo número de presentación e incrementar el número de secuencia en uno para dicha máquina', 1007);
INSERT INTO afip_errors VALUES (34, 'Para el primer envío de información de una máquina en una fecha y número de presentación dada (rectificativa), se debe informar secuencia 1', 1008);
INSERT INTO afip_errors VALUES (35, 'Para una máquina, punto de explotación y fecha dada, se debe informar nro de presentación 1 si es el primer envío. Si no es el primer envío, se deberá informar el mismo número de presentación enviado previamente (si es una nueva secuencia) o incrementar el número de presentación en 1 (si es una rectificativa)', 1009);
INSERT INTO afip_errors VALUES (36, 'Si se informa una nueva secuencia para una máquina, la fecha-hora de inicio de secuencia debe ser mayor o igual a la fecha-hora de fin de secuencia de la secuencia anterior', 1010);
INSERT INTO afip_errors VALUES (37, 'Si se informa la primer secuencia de una máquina y existen datos informados el día anterior, el contador inicial de juegos jugados deberá coincidir con el contador final de juegos jugados de la última secuencia informada el día anterior para esa máquina', 1011);
INSERT INTO afip_errors VALUES (38, 'Si se informa la primer secuencia de una máquina y existen datos informados el día anterior, el contador inicial de coin-in deberá coincidir con el contador final de coin-in de la última secuencia informada el día anterior para esa máquina', 1012);
INSERT INTO afip_errors VALUES (39, 'Si se informa la primer secuencia de una máquina y existen datos informados el día anterior, el contador inicial de coin-out deberá coincidir con el contador final de coin-out de la última secuencia informada el día anterior para esa máquina', 1013);
INSERT INTO afip_errors VALUES (40, 'Si se informa la primer secuencia de una máquina y existen datos informados el día anterior, el contador inicial de jackpot 
deberá coincidir con el contador final de jackpot de la última secuencia informada el día anterior para esa máquina', 1014);
INSERT INTO afip_errors VALUES (41, 'El contador final de juegos debe ser mayor o igual al contador inicial', 1101);
INSERT INTO afip_errors VALUES (42, 'El contador final de coin-in debe ser mayor o igual al contador inicial', 1102);
INSERT INTO afip_errors VALUES (43, 'El contador final de coin-out debe ser mayor o igual al contador inicial', 1103);
INSERT INTO afip_errors VALUES (44, 'El contador final de jackpot debe ser mayor o igual al contador inicial', 1104);
INSERT INTO afip_errors VALUES (45, 'La Fecha y Hora de Secuencia Fin no puede ser menor a la Fecha y Hora de Secuencia de inicio', 1105);
INSERT INTO afip_errors VALUES (46, 'El campo "oper" es inválido.', 8000);
INSERT INTO afip_errors VALUES (47, 'El punto de explotación no existe para la cuit informada', 9998);
INSERT INTO afip_errors VALUES (48, 'Error de comunicacion con el Servidor de JAZA', 0);
INSERT INTO afip_errors VALUES (49, 'Para una operación de [alta/baja/modificación] el campo [nombre del campo] no puede ser nulo', 8001);


--
-- Data for Name: afip_explotation_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_explotation_points VALUES (1, 1, 1, true, 31);
INSERT INTO afip_explotation_points VALUES (2, 2, 1, true, 31);
INSERT INTO afip_explotation_points VALUES (3, 3, 2, true, 31);


--
-- Data for Name: afip_explotation_points_servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_explotation_points_servers VALUES (1, 2);
INSERT INTO afip_explotation_points_servers VALUES (1, 1);
INSERT INTO afip_explotation_points_servers VALUES (2, 1);
INSERT INTO afip_explotation_points_servers VALUES (3, 2);


--
-- Data for Name: afip_handler_shipping_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_handler_shipping_egm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_handler_shipping_egm_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_handler_shipping_table; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_handler_shipping_table_bingo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_handler_shipping_table_bingo_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_operations_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_operations_types VALUES (1, 'Alta');
INSERT INTO afip_operations_types VALUES (2, 'Baja');
INSERT INTO afip_operations_types VALUES (3, 'Modificacion');


--
-- Data for Name: afip_servers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_servers VALUES (1, 'ETABLE50', 'http://192.168.70.79/web_service/listener.php?', 0, 'teceng', '60b717f62b8692fb19a328ed0ddca1a39bb4b241dc62005fd6ddfff1314c3121', 1);
INSERT INTO afip_servers VALUES (2, 'SOL', 'http://192.168.70.55/sol/web_service/listener.php?', 0, 'teceng', '60b717f62b8692fb19a328ed0ddca1a39bb4b241dc62005fd6ddfff1314c3121', 2);
INSERT INTO afip_servers VALUES (4, 'CVIP', 'https://10.10.10.111/club_vip/web_service/listener.php?', 0, 'teceng', '60b717f62b8692fb19a328ed0ddca1a39bb4b241dc62005fd6ddfff1314c3121', 4);
INSERT INTO afip_servers VALUES (3, 'TITO', 'https://192.168.70.243/tito/web_service/listener.php?', 0, 'teceng', '20660fddfa16481930955cb0f21aa45bd8c8e658475315d5461937fae4e9be74', 3);


--
-- Data for Name: afip_servers_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_servers_types VALUES (1, 'ETABLE');
INSERT INTO afip_servers_types VALUES (2, 'SOL');
INSERT INTO afip_servers_types VALUES (3, 'TITO');
INSERT INTO afip_servers_types VALUES (4, 'CVIP');


--
-- Data for Name: afip_shipping_errors_batch; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_shipping_errors_bingo_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_shipping_errors_egm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_shipping_errors_egm_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_shipping_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_shipping_state VALUES (1, 'PENDING');
INSERT INTO afip_shipping_state VALUES (2, 'SENDING');
INSERT INTO afip_shipping_state VALUES (3, 'REJECT');
INSERT INTO afip_shipping_state VALUES (4, 'ACCEPTED');
INSERT INTO afip_shipping_state VALUES (5, 'BLOCKED');
INSERT INTO afip_shipping_state VALUES (6, 'COMPLETE');
INSERT INTO afip_shipping_state VALUES (7, 'INCOMPLETE');
INSERT INTO afip_shipping_state VALUES (8, 'CONSULTED');
INSERT INTO afip_shipping_state VALUES (9, 'INFORMED');


--
-- Data for Name: afip_shipping_state_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_shipping_state_types VALUES (1, 'PM');


--
-- Data for Name: afip_shipping_states_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO afip_shipping_states_types VALUES (1, 1);
INSERT INTO afip_shipping_states_types VALUES (3, 1);
INSERT INTO afip_shipping_states_types VALUES (5, 1);
INSERT INTO afip_shipping_states_types VALUES (6, 1);
INSERT INTO afip_shipping_states_types VALUES (7, 1);


--
-- Data for Name: afip_table_shipping_table; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_ve_comms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: afip_ve_machine; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cr_authentication_error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cr_floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_floor VALUES (1, 1, 'CTL', 'Sala Central', '127.0.0.1');
INSERT INTO cr_floor VALUES (2, 2, 'S2', 'Sala 2', '127.0.0.1');
INSERT INTO cr_floor VALUES (3, 3, 'S3', 'Sala 3', '127.0.0.1');


--
-- Data for Name: cr_global_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_parameter VALUES (1, 'password_minchar_length', 'Longitud mínima de la contraseña. Este valor debe estar entre 5 y 100', 1, 1);
INSERT INTO cr_global_parameter VALUES (2, 'password_number_count', 'Cantidad mínima de números en la contraseña. Este valor debe estar entre 2 y 100', 1, 2);
INSERT INTO cr_global_parameter VALUES (3, 'password_specialchar_count', 'Cantidad mínima de caracteres especiales en la contraseña. Este valor debe estar entre 2 y 100', 1, 3);
INSERT INTO cr_global_parameter VALUES (4, 'password_min_stregth', 'Fuerza mínima de la contraseña. Este valor debe estar entre 44 y 100', 1, 4);
INSERT INTO cr_global_parameter VALUES (5, 'password_permitted_count', 'Cantidad de contraseñas con las que se va a comparar para que no se repita su contraseña', 1, 5);
INSERT INTO cr_global_parameter VALUES (6, 'password_lifetime', 'Tiempo de vida de una contraseña, expresado en días. Mínimo 30, máximo 365.', 1, 6);
INSERT INTO cr_global_parameter VALUES (7, 'password_login_retry', 'Cantidad de intentos permitidos con una contraseña incorrecta. Mínimo 1, máximo 5.', 1, 7);
INSERT INTO cr_global_parameter VALUES (8, 'password_login_retry_time', 'Tiempo de espera en minutos para poder ingresar nuevamente la contraseña una vez superada la cantidad de intentos permitidos. Mínimo 1, máximo 30.', 1, 8);
INSERT INTO cr_global_parameter VALUES (9, 'floor_date', 'Fecha de la sala.', 2, 9);
INSERT INTO cr_global_parameter VALUES (10, 'floor_time', 'hora de la sala.', 2, 10);
INSERT INTO cr_global_parameter VALUES (11, 'floor_date_time', 'hora y fecha de la sala.', 2, 11);
INSERT INTO cr_global_parameter VALUES (12, 'floor_decimal_value', 'Valor decimal con 2 digitos, entre 0 y 30', 2, 12);
INSERT INTO cr_global_parameter VALUES (13, 'floor_boolean_value', 'Valor boleeano del sistema', 2, 13);
INSERT INTO cr_global_parameter VALUES (14, 'floor_string_value', 'Valor de la cadena del Sistema.', 2, 14);
INSERT INTO cr_global_parameter VALUES (15, 'time_expired_voucher', 'Tiempo en dias para la expiracion "default" para los vouchers.', 2, 16);
INSERT INTO cr_global_parameter VALUES (16, 'minutes_clean_vouchers', 'Tiempo en minutos para la limpieza de vouchers sin confirmación de impresión.', 2, 17);
INSERT INTO cr_global_parameter VALUES (17, 'default_point_member', 'Valor numerico que representa el tipo de cuenta que se muestra en la T.A.C para TODOS los miembres del modulo', 2, 19);
INSERT INTO cr_global_parameter VALUES (18, 'pos_id_TITO', 'Número de la terminal de autoconsulta', 2, 20);


--
-- Data for Name: cr_global_parameter_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_parameter_category VALUES (1, 'password', 'Parámetros relacionados con la contraseña de usuario.');
INSERT INTO cr_global_parameter_category VALUES (2, 'floor', 'Parámetros relacionados con la configuracion de la sala.');


--
-- Data for Name: cr_global_parameter_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_parameter_value VALUES (14, 'texto');
INSERT INTO cr_global_parameter_value VALUES (13, 'logico');
INSERT INTO cr_global_parameter_value VALUES (15, 'logico');
INSERT INTO cr_global_parameter_value VALUES (12, 'decimal');
INSERT INTO cr_global_parameter_value VALUES (11, 'fehca_hora');
INSERT INTO cr_global_parameter_value VALUES (10, 'hora');
INSERT INTO cr_global_parameter_value VALUES (9, 'fecha');
INSERT INTO cr_global_parameter_value VALUES (1, 'entero');
INSERT INTO cr_global_parameter_value VALUES (2, 'entero');
INSERT INTO cr_global_parameter_value VALUES (3, 'entero');
INSERT INTO cr_global_parameter_value VALUES (4, 'entero');
INSERT INTO cr_global_parameter_value VALUES (5, 'entero');
INSERT INTO cr_global_parameter_value VALUES (6, 'entero');
INSERT INTO cr_global_parameter_value VALUES (7, 'entero');
INSERT INTO cr_global_parameter_value VALUES (8, 'entero');
INSERT INTO cr_global_parameter_value VALUES (16, 'entero');
INSERT INTO cr_global_parameter_value VALUES (17, 'entero');
INSERT INTO cr_global_parameter_value VALUES (19, 'option');
INSERT INTO cr_global_parameter_value VALUES (18, 'entero');
INSERT INTO cr_global_parameter_value VALUES (20, 'texto');


--
-- Data for Name: cr_global_paramval_boolean; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_boolean VALUES (13, NULL, true);
INSERT INTO cr_global_paramval_boolean VALUES (15, false, false);


--
-- Data for Name: cr_global_paramval_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_date VALUES (9, NULL, '2013-02-02');


--
-- Data for Name: cr_global_paramval_datetime; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_datetime VALUES (11, NULL, '2013-02-02 22:17:06');


--
-- Data for Name: cr_global_paramval_decimal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_decimal VALUES (12, NULL, 10.5, 0, 30);


--
-- Data for Name: cr_global_paramval_integer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_integer VALUES (1, NULL, 5, 5, 100);
INSERT INTO cr_global_paramval_integer VALUES (2, NULL, 2, 2, 100);
INSERT INTO cr_global_paramval_integer VALUES (3, NULL, 2, 2, 100);
INSERT INTO cr_global_paramval_integer VALUES (4, NULL, 44, 44, 100);
INSERT INTO cr_global_paramval_integer VALUES (5, NULL, 5, 1, 1000);
INSERT INTO cr_global_paramval_integer VALUES (6, NULL, 90, 30, 365);
INSERT INTO cr_global_paramval_integer VALUES (7, NULL, 3, 1, 5);
INSERT INTO cr_global_paramval_integer VALUES (8, NULL, 5, 0, 30);
INSERT INTO cr_global_paramval_integer VALUES (16, NULL, 1, 1, 365);
INSERT INTO cr_global_paramval_integer VALUES (17, NULL, 5, 1, 999999);
INSERT INTO cr_global_paramval_integer VALUES (18, NULL, 2, 1, 7);


--
-- Data for Name: cr_global_paramval_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_options VALUES (19, 'theoretical', 'theoretical', 'a:1:{s:11:"theoretical";s:11:"theoretical";}');


--
-- Data for Name: cr_global_paramval_string; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_string VALUES (14, NULL, 'lorem ipsum');
INSERT INTO cr_global_paramval_string VALUES (20, NULL, '2000000000');


--
-- Data for Name: cr_global_paramval_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_global_paramval_time VALUES (10, NULL, '22:17:06');


--
-- Data for Name: cr_locked_user_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cr_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_owner VALUES (1, 'Teceng Gaming', NULL, NULL);
INSERT INTO cr_owner VALUES (2, 'LUTHORCORP', NULL, NULL);
INSERT INTO cr_owner VALUES (3, 'HAMMERTRONIC', NULL, NULL);


--
-- Data for Name: cr_password_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cr_session_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_session_log VALUES (1, 1, '2018-10-09 09:01:43', NULL);
INSERT INTO cr_session_log VALUES (2, 1, '2018-10-10 09:02:39', NULL);
INSERT INTO cr_session_log VALUES (3, 1, '2018-10-10 10:36:41', NULL);
INSERT INTO cr_session_log VALUES (4, 1, '2018-10-10 13:45:03', NULL);
INSERT INTO cr_session_log VALUES (5, 1, '2018-10-10 13:45:28', NULL);
INSERT INTO cr_session_log VALUES (6, 1, '2018-10-10 14:04:22', NULL);
INSERT INTO cr_session_log VALUES (7, 1, '2018-10-10 15:58:07', NULL);
INSERT INTO cr_session_log VALUES (8, 1, '2018-10-10 16:35:52', NULL);
INSERT INTO cr_session_log VALUES (9, 1, '2018-10-11 15:55:00', NULL);
INSERT INTO cr_session_log VALUES (10, 1, '2018-10-11 16:21:17', NULL);
INSERT INTO cr_session_log VALUES (11, 1, '2018-10-12 11:45:24', NULL);
INSERT INTO cr_session_log VALUES (12, 1, '2018-10-16 08:46:53', NULL);
INSERT INTO cr_session_log VALUES (13, 1, '2018-10-17 08:29:52', NULL);
INSERT INTO cr_session_log VALUES (14, 1, '2018-10-17 08:35:48', NULL);
INSERT INTO cr_session_log VALUES (15, 1, '2018-10-17 08:53:54', NULL);
INSERT INTO cr_session_log VALUES (16, 1, '2018-10-17 15:17:43', NULL);
INSERT INTO cr_session_log VALUES (17, 1, '2018-10-17 15:19:14', NULL);
INSERT INTO cr_session_log VALUES (18, 1, '2018-10-17 16:14:05', NULL);
INSERT INTO cr_session_log VALUES (19, 1, '2018-10-18 09:32:23', NULL);
INSERT INTO cr_session_log VALUES (20, 1, '2018-10-19 12:06:21', NULL);
INSERT INTO cr_session_log VALUES (21, 1, '2018-10-19 15:51:28', NULL);
INSERT INTO cr_session_log VALUES (22, 1, '2018-10-22 10:08:21', NULL);
INSERT INTO cr_session_log VALUES (23, 1, '2018-10-23 09:06:21', NULL);


--
-- Data for Name: cr_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_user VALUES (1, 'teceng', 'jX1+vecmVUcoKa0SNUg9iR7A8ojlB//xpKozvHC83r4=', 'Bruce', 'Wayne', false, true, '2018-10-08 17:27:20', 'e2cfd7428135ba5cc879996a7ba1f1e6', false);
INSERT INTO cr_user VALUES (2, 'admin', 'peHuvZrWyevU7k/blSw2hDUY20YBgo0bLeZGekurZIY=', 'Maria', 'Hill', false, true, '2018-10-08 17:27:20', 'a31a4effaf88a984f5ef984e7515ff00', false);
INSERT INTO cr_user VALUES (3, 'fidelg', 'b7CXj3qPOii8SJsQV8JUNj/VZ5iWB69odwfw9nWimE4=', 'Fidel', 'Galindex', false, true, '2018-10-08 17:27:20', 'ee6d30df15a1664420b86ab30bdc7d87', false);


--
-- Data for Name: cr_user_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_user_access VALUES (3, NULL, 'a:0:{}');
INSERT INTO cr_user_access VALUES (4, NULL, 'a:0:{}');
INSERT INTO cr_user_access VALUES (5, NULL, 'a:0:{}');
INSERT INTO cr_user_access VALUES (1, 1, 'a:13:{i:0;s:21:"ROLE_CORE_USER_CREATE";i:1;s:19:"ROLE_CORE_USER_EDIT";i:2;s:19:"ROLE_CORE_USER_VIEW";i:3;s:21:"ROLE_CORE_USER_DELETE";i:4;s:28:"ROLE_CORE_USERPROFILE_CREATE";i:5;s:26:"ROLE_CORE_USERPROFILE_EDIT";i:6;s:26:"ROLE_CORE_USERPROFILE_VIEW";i:7;s:28:"ROLE_CORE_USERPROFILE_DELETE";i:8;s:25:"ROLE_CORE_CURRENCY_CREATE";i:9;s:23:"ROLE_CORE_CURRENCY_EDIT";i:10;s:23:"ROLE_CORE_CURRENCY_VIEW";i:11;s:25:"ROLE_CORE_CURRENCY_DELETE";i:12;s:16:"ROLE_TECENG_ONLY";}');
INSERT INTO cr_user_access VALUES (2, 2, 'a:12:{i:0;s:21:"ROLE_CORE_USER_CREATE";i:1;s:19:"ROLE_CORE_USER_EDIT";i:2;s:19:"ROLE_CORE_USER_VIEW";i:3;s:21:"ROLE_CORE_USER_DELETE";i:4;s:28:"ROLE_CORE_USERPROFILE_CREATE";i:5;s:26:"ROLE_CORE_USERPROFILE_EDIT";i:6;s:26:"ROLE_CORE_USERPROFILE_VIEW";i:7;s:28:"ROLE_CORE_USERPROFILE_DELETE";i:8;s:25:"ROLE_CORE_CURRENCY_CREATE";i:9;s:23:"ROLE_CORE_CURRENCY_EDIT";i:10;s:23:"ROLE_CORE_CURRENCY_VIEW";i:11;s:25:"ROLE_CORE_CURRENCY_DELETE";}');
INSERT INTO cr_user_access VALUES (6, 3, 'a:1:{i:0;s:36:"ROLE_PROMO_EXCHANGETERMINAL_EXCHANGE";}');


--
-- Data for Name: cr_user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_user_profile VALUES (1, 'teceng', 'Perfil de Teceng Gaming.', false);
INSERT INTO cr_user_profile VALUES (2, 'admin', 'Perfil de administrador.', true);
INSERT INTO cr_user_profile VALUES (3, 'canjeador', 'Perfil de Canjeador.', true);


--
-- Data for Name: cr_user_user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_user_user_profile VALUES (1, 1, 1, 3);
INSERT INTO cr_user_user_profile VALUES (2, 2, 2, 3);
INSERT INTO cr_user_user_profile VALUES (3, 3, 3, 3);


--
-- Data for Name: cr_users_floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cr_users_floor VALUES (1, 1);
INSERT INTO cr_users_floor VALUES (1, 2);
INSERT INTO cr_users_floor VALUES (1, 3);
INSERT INTO cr_users_floor VALUES (2, 1);
INSERT INTO cr_users_floor VALUES (2, 2);
INSERT INTO cr_users_floor VALUES (2, 3);
INSERT INTO cr_users_floor VALUES (3, 1);
INSERT INTO cr_users_floor VALUES (3, 2);
INSERT INTO cr_users_floor VALUES (3, 3);


--
-- Data for Name: migrations_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO migrations_versions VALUES ('20180912153236');


--
-- Data for Name: pr_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_areas VALUES (1, 1, 'Area Central');


--
-- Data for Name: pr_game_session_members; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pr_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item VALUES (2, NULL, 'cafecito', NULL, NULL, true, 'item_voucher');
INSERT INTO pr_item VALUES (1, NULL, 'voucher', 3, 0, true, 'item_voucher');
INSERT INTO pr_item VALUES (4, 2, '12123', NULL, NULL, true, 'item_voucher');
INSERT INTO pr_item VALUES (3, 1, 'TITO Promocional No-Restrictivo', NULL, NULL, true, 'item_TITO');
INSERT INTO pr_item VALUES (5, 2, '&&', NULL, NULL, true, 'item_voucher');
INSERT INTO pr_item VALUES (6, 1, '&&', NULL, NULL, true, 'item_TITO');
INSERT INTO pr_item VALUES (12, 1, '444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444', NULL, NULL, true, 'item_voucher');


--
-- Data for Name: pr_item_generated; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item_generated VALUES (1, 1, 2, 'Estas son las observaciones', 'item_voucher');
INSERT INTO pr_item_generated VALUES (2, 1, 2, 'Estas son las observaciones', 'item_voucher');
INSERT INTO pr_item_generated VALUES (4, 2, 1, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (5, 3, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (6, 4, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (7, 5, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (8, 6, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (9, 7, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (10, 8, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (11, 9, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (17, 10, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (18, 11, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (20, 12, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (21, NULL, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (23, 13, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (24, 14, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (25, 15, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (26, 16, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (27, 17, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (28, 18, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (29, 19, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (30, 20, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (31, 21, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (32, 22, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (33, 23, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (34, 24, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (35, 25, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (36, 26, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (37, 27, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (38, 28, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (39, 29, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (40, 30, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (41, 31, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (42, 32, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (43, 33, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (44, 34, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (45, 35, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (46, 36, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (47, 37, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (48, 38, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (49, 39, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (50, 40, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (51, 41, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (52, 42, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (53, 43, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (54, 44, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (55, 45, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (56, 46, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (57, 47, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (58, 48, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (62, 49, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (63, 50, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (64, 51, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (65, 52, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (66, 53, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (67, 54, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (68, 55, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (69, 56, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (70, 57, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (71, 58, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (72, 59, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (73, 60, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (74, 61, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (75, 62, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (76, 63, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (77, 64, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (78, 65, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (79, 66, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (80, 67, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (81, 68, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (82, 69, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (83, 70, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (84, 71, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (85, 72, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (86, 73, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (87, 74, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (88, 75, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (89, 76, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (90, 77, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (91, 78, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (92, 79, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (93, 80, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (94, 81, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (95, 82, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (96, 83, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (97, 84, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (98, 85, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (99, 86, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (100, 87, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (101, 88, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (102, 89, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (103, 90, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (104, 91, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (105, 92, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (106, 93, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (107, 94, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (108, 95, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (109, 96, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (110, 97, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (111, 98, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (112, 99, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (113, 100, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (114, 101, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (115, 102, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (116, 103, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (117, 104, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (118, 105, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (119, 106, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (120, 107, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (121, 108, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (122, 109, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (123, 110, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (124, 111, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (125, 112, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (126, 113, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (127, 114, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (128, 115, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (129, 116, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (130, 117, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (131, 118, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (132, 119, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (133, 120, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (134, 121, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (135, 122, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (136, 123, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (137, 124, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (138, 125, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (139, 126, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (140, 127, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (141, 128, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (142, 129, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (143, 130, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (144, 131, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (145, 132, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (146, 133, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (147, 134, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (148, 135, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (149, 136, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (150, 137, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (151, 138, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (152, 139, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (153, 140, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (154, 141, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (155, 142, 3, 'OBS_TITO', 'item_TITO');
INSERT INTO pr_item_generated VALUES (156, 143, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (157, 144, 5, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (158, 145, 4, 'OBS_VOUCHER', 'item_voucher');
INSERT INTO pr_item_generated VALUES (159, 146, 3, 'OBS_TITO', 'item_TITO');


--
-- Data for Name: pr_item_tito; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item_tito VALUES (3, 8, 1, 666, NULL, NULL, 30);
INSERT INTO pr_item_tito VALUES (1, 1, 1, 10, NULL, NULL, 30);
INSERT INTO pr_item_tito VALUES (6, 8, 1, 10, NULL, NULL, 30);


--
-- Data for Name: pr_item_tito_generated; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item_tito_generated VALUES (5, 5, 22, '006634223342285375', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 10:53:08', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (6, 5, 42, '003128539774095306', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 02:32:35', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (8, 5, 43, '002880531152532130', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 02:35:00', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (9, 5, 44, '001045392606758522', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 02:35:31', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (10, 5, 49, '008807200233616338', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 02:42:55', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (11, 5, 51, '000475838528386402', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 02:53:04', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (18, 5, 52, '000532567231005626', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 03:08:40', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (21, 5, 53, '008185424531510706', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 03:09:29', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (24, 5, 54, '002036537227846506', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-08 11:59:00', '30', '2018-10-09 03:11:50', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (26, 5, 77, '003584148026049345', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 03:54:43', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (28, 5, 78, '001522913788673177', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 03:55:48', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (31, 5, 79, '001271628395498737', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 03:56:52', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (34, 5, 80, '001440585843433513', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:00:05', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (37, 5, 81, '000577340976574433', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:00:40', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (40, 5, 82, '000430911282424377', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:02:18', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (43, 5, 83, '004705544205035089', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:03:01', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (46, 5, 84, '006749985109751945', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:04:39', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (49, 5, 85, '002415949470256513', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:05:07', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (52, 5, 86, '006253135984495705', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:05:16', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (55, 5, 87, '004083768562929457', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:05:55', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (58, 5, 88, '000138039696034537', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:06:39', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (64, 5, 89, '000021535491386032', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:07:45', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (67, 5, 90, '006174109127710056', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:08:29', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (70, 5, 91, '004320948161937152', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:08:57', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (73, 5, 92, '000269544012949208', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-10 11:59:00', '30', '2018-10-11 04:30:37', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (76, 5, 93, '008656418933491152', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-11 11:59:00', '30', '2018-10-12 02:55:00', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (122, 5, 94, '000825376421425928', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-16 11:59:00', '30', '2018-10-17 04:03:25', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (126, 5, 95, '002574091028251488', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-17 11:59:00', '30', '2018-10-18 09:11:31', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (129, 5, 96, '008512856730875320', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-17 11:59:00', '30', '2018-10-18 09:11:41', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (135, 5, 97, '003347019627172720', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:13:34', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (139, 5, 98, '009391460511889576', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:16:09', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (143, 5, 99, '003666093574500288', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:16:31', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (147, 5, 100, '009519663800350232', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:17:08', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (151, 5, 101, '009120091580857360', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:17:40', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (155, 5, 102, '001174362693962440', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:21:14', 'SALA DEMO', 'PA');
INSERT INTO pr_item_tito_generated VALUES (159, 5, 103, '001004995272396192', 'Teceng Gaming', 'SOLO JUGABLE', '2018-11-22 11:59:00', '30', '2018-10-23 09:22:38', 'SALA DEMO', 'PA');


--
-- Data for Name: pr_item_voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item_voucher VALUES (1, '123456', 30);
INSERT INTO pr_item_voucher VALUES (2, '123456', 30);
INSERT INTO pr_item_voucher VALUES (4, NULL, 10);
INSERT INTO pr_item_voucher VALUES (5, NULL, NULL);
INSERT INTO pr_item_voucher VALUES (12, NULL, NULL);


--
-- Data for Name: pr_item_voucher_generated; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_item_voucher_generated VALUES (1, 1, '3412341243122421', 'Texto del ItemVoucher', '2018-10-08 17:27:20');
INSERT INTO pr_item_voucher_generated VALUES (2, 1, '1111111111111', 'Texto del ItemVoucher', '2018-10-09 17:27:20');
INSERT INTO pr_item_voucher_generated VALUES (4, 5, '314968283579206511', 'voucher', '2018-11-08 10:51:25');
INSERT INTO pr_item_voucher_generated VALUES (7, 5, '653920014731090695', '12123', '2018-10-19 14:34:59');
INSERT INTO pr_item_voucher_generated VALUES (17, 5, '341001066037510301', '12123', '2018-10-19 15:08:40');
INSERT INTO pr_item_voucher_generated VALUES (20, 5, '026778470373513945', '12123', '2018-10-19 15:09:29');
INSERT INTO pr_item_voucher_generated VALUES (23, 5, '048040769224896071', '12123', '2018-10-19 15:11:50');
INSERT INTO pr_item_voucher_generated VALUES (25, 5, '436924663227645927', '12123', '2018-10-21 15:54:41');
INSERT INTO pr_item_voucher_generated VALUES (27, 5, '849999052432206416', '12123', '2018-10-21 15:55:48');
INSERT INTO pr_item_voucher_generated VALUES (29, 5, '277030292608953418', '&&', '2018-10-12 15:56:51');
INSERT INTO pr_item_voucher_generated VALUES (30, 5, '403970463532227671', '12123', '2018-10-21 15:56:51');
INSERT INTO pr_item_voucher_generated VALUES (32, 5, '049640495586074019', '&&', '2018-10-12 16:00:04');
INSERT INTO pr_item_voucher_generated VALUES (33, 5, '393545062570250744', '12123', '2018-10-21 16:00:05');
INSERT INTO pr_item_voucher_generated VALUES (35, 5, '610898825947333692', '&&', '2018-10-12 16:00:39');
INSERT INTO pr_item_voucher_generated VALUES (36, 5, '645416418786757791', '12123', '2018-10-21 16:00:40');
INSERT INTO pr_item_voucher_generated VALUES (38, 5, '940656146106613914', '&&', '2018-10-12 16:02:18');
INSERT INTO pr_item_voucher_generated VALUES (39, 5, '438591588510795854', '12123', '2018-10-21 16:02:18');
INSERT INTO pr_item_voucher_generated VALUES (41, 5, '828949909833632542', '&&', '2018-10-12 16:03:00');
INSERT INTO pr_item_voucher_generated VALUES (42, 5, '223922518037703401', '12123', '2018-10-21 16:03:00');
INSERT INTO pr_item_voucher_generated VALUES (44, 5, '253153916388989565', '&&', '2018-10-12 16:04:38');
INSERT INTO pr_item_voucher_generated VALUES (45, 5, '107470597097449084', '12123', '2018-10-21 16:04:39');
INSERT INTO pr_item_voucher_generated VALUES (47, 5, '191699507531911710', '&&', '2018-10-12 16:05:06');
INSERT INTO pr_item_voucher_generated VALUES (48, 5, '786683007265947351', '12123', '2018-10-21 16:05:06');
INSERT INTO pr_item_voucher_generated VALUES (50, 5, '436200847447837801', '&&', '2018-10-12 16:05:15');
INSERT INTO pr_item_voucher_generated VALUES (51, 5, '606274950356470223', '12123', '2018-10-21 16:05:15');
INSERT INTO pr_item_voucher_generated VALUES (53, 5, '572661151206904229', '&&', '2018-10-12 16:05:54');
INSERT INTO pr_item_voucher_generated VALUES (54, 5, '772788652850505016', '12123', '2018-10-21 16:05:55');
INSERT INTO pr_item_voucher_generated VALUES (56, 5, '694888177953109956', '&&', '2018-10-12 16:06:39');
INSERT INTO pr_item_voucher_generated VALUES (57, 5, '174777409209933451', '12123', '2018-10-21 16:06:39');
INSERT INTO pr_item_voucher_generated VALUES (62, 5, '651903552783340071', '&&', '2018-10-12 16:07:45');
INSERT INTO pr_item_voucher_generated VALUES (63, 5, '842673049815462221', '12123', '2018-10-21 16:07:45');
INSERT INTO pr_item_voucher_generated VALUES (65, 5, '236579124207083044', '&&', '2018-10-12 16:08:26');
INSERT INTO pr_item_voucher_generated VALUES (66, 5, '152741269092077204', '12123', '2018-10-21 16:08:27');
INSERT INTO pr_item_voucher_generated VALUES (68, 5, '641924649055430209', '&&', '2018-10-12 16:08:57');
INSERT INTO pr_item_voucher_generated VALUES (69, 5, '919473881614003678', '12123', '2018-10-21 16:08:57');
INSERT INTO pr_item_voucher_generated VALUES (71, 5, '715120785301388270', '&&', '2018-10-12 16:30:37');
INSERT INTO pr_item_voucher_generated VALUES (72, 5, '377940626250833207', '12123', '2018-10-21 16:30:37');
INSERT INTO pr_item_voucher_generated VALUES (74, 5, '611488882207882963', '&&', '2018-10-13 14:54:57');
INSERT INTO pr_item_voucher_generated VALUES (75, 5, '165489658460848874', '12123', '2018-10-22 14:54:59');
INSERT INTO pr_item_voucher_generated VALUES (77, 5, '412888144681287178', '&&', '2018-10-18 14:42:27');
INSERT INTO pr_item_voucher_generated VALUES (78, 5, '665357804430987976', '&&', '2018-10-18 14:42:28');
INSERT INTO pr_item_voucher_generated VALUES (79, 5, '822725114591206059', '12123', '2018-10-27 14:42:28');
INSERT INTO pr_item_voucher_generated VALUES (80, 5, '965919174687296529', '&&', '2018-10-18 14:43:36');
INSERT INTO pr_item_voucher_generated VALUES (81, 5, '304558103160520206', '&&', '2018-10-18 14:43:36');
INSERT INTO pr_item_voucher_generated VALUES (82, 5, '977606698952998998', '12123', '2018-10-27 14:43:36');
INSERT INTO pr_item_voucher_generated VALUES (83, 5, '674047025062917680', '&&', '2018-10-18 14:43:40');
INSERT INTO pr_item_voucher_generated VALUES (84, 5, '921688466326476746', '&&', '2018-10-18 14:43:40');
INSERT INTO pr_item_voucher_generated VALUES (85, 5, '341360784054763361', '12123', '2018-10-27 14:43:40');
INSERT INTO pr_item_voucher_generated VALUES (86, 5, '618335127016832035', '&&', '2018-10-18 14:43:57');
INSERT INTO pr_item_voucher_generated VALUES (87, 5, '505901990859581992', '&&', '2018-10-18 14:43:57');
INSERT INTO pr_item_voucher_generated VALUES (88, 5, '012158047321350358', '12123', '2018-10-27 14:43:57');
INSERT INTO pr_item_voucher_generated VALUES (89, 5, '092798469173676919', '&&', '2018-10-18 14:46:02');
INSERT INTO pr_item_voucher_generated VALUES (90, 5, '558844023203893938', '&&', '2018-10-18 14:46:02');
INSERT INTO pr_item_voucher_generated VALUES (91, 5, '390519730105755796', '12123', '2018-10-27 14:46:02');
INSERT INTO pr_item_voucher_generated VALUES (92, 5, '458287377853995301', '&&', '2018-10-18 14:47:47');
INSERT INTO pr_item_voucher_generated VALUES (93, 5, '074900126879905478', '&&', '2018-10-18 14:47:47');
INSERT INTO pr_item_voucher_generated VALUES (94, 5, '177487206195206975', '12123', '2018-10-27 14:47:47');
INSERT INTO pr_item_voucher_generated VALUES (95, 5, '829689132621526131', '&&', '2018-10-18 14:48:08');
INSERT INTO pr_item_voucher_generated VALUES (96, 5, '778215826168762343', '&&', '2018-10-18 14:48:08');
INSERT INTO pr_item_voucher_generated VALUES (97, 5, '418184335675807673', '12123', '2018-10-27 14:48:08');
INSERT INTO pr_item_voucher_generated VALUES (98, 5, '210379196575293312', '&&', '2018-10-18 14:48:20');
INSERT INTO pr_item_voucher_generated VALUES (99, 5, '542034540978147985', '&&', '2018-10-18 14:48:20');
INSERT INTO pr_item_voucher_generated VALUES (100, 5, '846219046604688023', '12123', '2018-10-27 14:48:20');
INSERT INTO pr_item_voucher_generated VALUES (101, 5, '255888914884377734', '&&', '2018-10-18 14:48:32');
INSERT INTO pr_item_voucher_generated VALUES (102, 5, '131985920312065011', '&&', '2018-10-18 14:48:32');
INSERT INTO pr_item_voucher_generated VALUES (103, 5, '021676211010086091', '12123', '2018-10-27 14:48:32');
INSERT INTO pr_item_voucher_generated VALUES (104, 5, '669918228376666304', '&&', '2018-10-18 14:49:57');
INSERT INTO pr_item_voucher_generated VALUES (105, 5, '559432506828609797', '&&', '2018-10-18 14:49:58');
INSERT INTO pr_item_voucher_generated VALUES (106, 5, '858761900393405935', '12123', '2018-10-27 14:49:58');
INSERT INTO pr_item_voucher_generated VALUES (107, 5, '947840086489588217', '&&', '2018-10-18 14:50:10');
INSERT INTO pr_item_voucher_generated VALUES (108, 5, '023737813801880532', '&&', '2018-10-18 14:50:10');
INSERT INTO pr_item_voucher_generated VALUES (109, 5, '376769192025496188', '12123', '2018-10-27 14:50:10');
INSERT INTO pr_item_voucher_generated VALUES (110, 5, '786874486413836388', '&&', '2018-10-18 14:52:58');
INSERT INTO pr_item_voucher_generated VALUES (111, 5, '370410626770534220', '&&', '2018-10-18 14:52:58');
INSERT INTO pr_item_voucher_generated VALUES (112, 5, '328651241112917546', '12123', '2018-10-27 14:52:58');
INSERT INTO pr_item_voucher_generated VALUES (113, 5, '890442786248971975', '&&', '2018-10-18 14:54:26');
INSERT INTO pr_item_voucher_generated VALUES (114, 5, '916059917352494914', '&&', '2018-10-18 14:54:26');
INSERT INTO pr_item_voucher_generated VALUES (115, 5, '847409581576023816', '12123', '2018-10-27 14:54:26');
INSERT INTO pr_item_voucher_generated VALUES (116, 5, '414831946748508137', '&&', '2018-10-18 14:54:48');
INSERT INTO pr_item_voucher_generated VALUES (117, 5, '628661851145513814', '&&', '2018-10-18 14:54:48');
INSERT INTO pr_item_voucher_generated VALUES (118, 5, '377170420432116045', '12123', '2018-10-27 14:54:48');
INSERT INTO pr_item_voucher_generated VALUES (119, 5, '953021493717963193', '&&', '2018-10-18 15:02:47');
INSERT INTO pr_item_voucher_generated VALUES (120, 5, '404389467533922448', '&&', '2018-10-18 15:02:48');
INSERT INTO pr_item_voucher_generated VALUES (121, 5, '009642503594789381', '12123', '2018-10-27 15:02:48');
INSERT INTO pr_item_voucher_generated VALUES (123, 5, '909428454670091939', '&&', '2018-10-18 16:03:26');
INSERT INTO pr_item_voucher_generated VALUES (124, 5, '950250686824970678', '&&', '2018-10-18 16:03:26');
INSERT INTO pr_item_voucher_generated VALUES (125, 5, '410519434699951560', '12123', '2018-10-27 16:03:26');
INSERT INTO pr_item_voucher_generated VALUES (127, 5, '678774901370810985', '&&', '2018-10-19 09:11:29');
INSERT INTO pr_item_voucher_generated VALUES (128, 5, '583888220727653808', '12123', '2018-10-28 09:11:30');
INSERT INTO pr_item_voucher_generated VALUES (130, 5, '201545822256990360', '&&', '2018-10-19 09:11:39');
INSERT INTO pr_item_voucher_generated VALUES (131, 5, '531959861023835483', '12123', '2018-10-28 09:11:39');
INSERT INTO pr_item_voucher_generated VALUES (132, 5, '003353067260835240', '&&', '2018-10-24 09:13:32');
INSERT INTO pr_item_voucher_generated VALUES (133, 5, '540185840260211487', '&&', '2018-10-24 09:13:33');
INSERT INTO pr_item_voucher_generated VALUES (134, 5, '513021901053019838', '12123', '2018-11-02 09:13:33');
INSERT INTO pr_item_voucher_generated VALUES (136, 5, '648396663823002559', '&&', '2018-10-24 09:16:08');
INSERT INTO pr_item_voucher_generated VALUES (137, 5, '087975982016365922', '&&', '2018-10-24 09:16:08');
INSERT INTO pr_item_voucher_generated VALUES (138, 5, '388834908369343708', '12123', '2018-11-02 09:16:08');
INSERT INTO pr_item_voucher_generated VALUES (140, 5, '329081021446959810', '&&', '2018-10-24 09:16:30');
INSERT INTO pr_item_voucher_generated VALUES (141, 5, '817594503806329714', '&&', '2018-10-24 09:16:30');
INSERT INTO pr_item_voucher_generated VALUES (142, 5, '958651081647182923', '12123', '2018-11-02 09:16:30');
INSERT INTO pr_item_voucher_generated VALUES (144, 5, '816544829674974411', '&&', '2018-10-24 09:17:08');
INSERT INTO pr_item_voucher_generated VALUES (145, 5, '262298957272511940', '&&', '2018-10-24 09:17:08');
INSERT INTO pr_item_voucher_generated VALUES (146, 5, '647562100157968738', '12123', '2018-11-02 09:17:08');
INSERT INTO pr_item_voucher_generated VALUES (148, 5, '652736919616783467', '&&', '2018-10-24 09:17:40');
INSERT INTO pr_item_voucher_generated VALUES (149, 5, '153918231401072922', '&&', '2018-10-24 09:17:40');
INSERT INTO pr_item_voucher_generated VALUES (150, 5, '811048498829525697', '12123', '2018-11-02 09:17:40');
INSERT INTO pr_item_voucher_generated VALUES (152, 5, '266126230023171548', '&&', '2018-10-24 09:21:14');
INSERT INTO pr_item_voucher_generated VALUES (153, 5, '859674975518302756', '&&', '2018-10-24 09:21:14');
INSERT INTO pr_item_voucher_generated VALUES (154, 5, '606743284745281303', '12123', '2018-11-02 09:21:14');
INSERT INTO pr_item_voucher_generated VALUES (156, 5, '488043120461566717', '&&', '2018-10-24 09:22:36');
INSERT INTO pr_item_voucher_generated VALUES (157, 5, '200732483097787089', '&&', '2018-10-24 09:22:36');
INSERT INTO pr_item_voucher_generated VALUES (158, 5, '619526501465885073', '12123', '2018-11-02 09:22:36');


--
-- Data for Name: pr_items_assiganted_promo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_items_assiganted_promo VALUES (1, 1);
INSERT INTO pr_items_assiganted_promo VALUES (2, 3);
INSERT INTO pr_items_assiganted_promo VALUES (3, 4);
INSERT INTO pr_items_assiganted_promo VALUES (4, 5);
INSERT INTO pr_items_assiganted_promo VALUES (5, 5);
INSERT INTO pr_items_assiganted_promo VALUES (6, 3);
INSERT INTO pr_items_assiganted_promo VALUES (10, 1);
INSERT INTO pr_items_assiganted_promo VALUES (11, 1);
INSERT INTO pr_items_assiganted_promo VALUES (15, 1);


--
-- Data for Name: pr_last_update; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pr_log_themler_change; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_log_themler_change VALUES (1, 1, '2018-10-22 10:15:59', '1');
INSERT INTO pr_log_themler_change VALUES (2, 1, '2018-10-22 10:16:05', '1');
INSERT INTO pr_log_themler_change VALUES (3, 1, '2018-10-22 10:24:20', '1');
INSERT INTO pr_log_themler_change VALUES (4, 1, '2018-10-22 10:24:25', '1');
INSERT INTO pr_log_themler_change VALUES (5, 1, '2018-10-22 10:24:47', '1');
INSERT INTO pr_log_themler_change VALUES (6, 1, '2018-10-23 10:14:46', '1');


--
-- Data for Name: pr_member_points; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pr_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_members VALUES (1, 'Jorge', 'Estrasko', NULL, '331511097028851', '2018-10-08 17:27:20');
INSERT INTO pr_members VALUES (2, 'Carlos', 'Pérez', NULL, '058615698944777', '2018-10-08 17:27:20');
INSERT INTO pr_members VALUES (3, 'Luis', 'Bassi', NULL, '165632472839206', '2018-10-08 17:27:20');


--
-- Data for Name: pr_members_data_cvip; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pr_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_operations VALUES (2, 5, 1, 1, 4, 1, '2018-10-09 10:51:25');
INSERT INTO pr_operations VALUES (3, 5, 1, 1, 7, 1, '2018-10-09 14:34:59');
INSERT INTO pr_operations VALUES (9, 5, 1, 1, 17, 1, '2018-10-09 15:08:40');
INSERT INTO pr_operations VALUES (11, 5, 1, 1, 20, 1, '2018-10-09 15:09:29');
INSERT INTO pr_operations VALUES (13, 5, 1, 1, 23, 1, '2018-10-09 15:11:50');
INSERT INTO pr_operations VALUES (14, 5, 1, 1, 25, 1, '2018-10-11 15:54:41');
INSERT INTO pr_operations VALUES (15, 5, 1, 1, 27, 1, '2018-10-11 15:55:48');
INSERT INTO pr_operations VALUES (16, 5, 1, 1, 29, 1, '2018-10-11 15:56:51');
INSERT INTO pr_operations VALUES (17, 5, 1, 1, 30, 1, '2018-10-11 15:56:51');
INSERT INTO pr_operations VALUES (18, 5, 1, 1, 32, 1, '2018-10-11 16:00:04');
INSERT INTO pr_operations VALUES (19, 5, 1, 1, 33, 1, '2018-10-11 16:00:05');
INSERT INTO pr_operations VALUES (20, 5, 1, 1, 35, 1, '2018-10-11 16:00:39');
INSERT INTO pr_operations VALUES (21, 5, 1, 1, 36, 1, '2018-10-11 16:00:40');
INSERT INTO pr_operations VALUES (22, 5, 1, 1, 38, 1, '2018-10-11 16:02:18');
INSERT INTO pr_operations VALUES (23, 5, 1, 1, 39, 1, '2018-10-11 16:02:18');
INSERT INTO pr_operations VALUES (24, 5, 1, 1, 41, 1, '2018-10-11 16:03:00');
INSERT INTO pr_operations VALUES (25, 5, 1, 1, 42, 1, '2018-10-11 16:03:00');
INSERT INTO pr_operations VALUES (26, 5, 1, 1, 44, 1, '2018-10-11 16:04:38');
INSERT INTO pr_operations VALUES (27, 5, 1, 1, 45, 1, '2018-10-11 16:04:39');
INSERT INTO pr_operations VALUES (28, 5, 1, 1, 47, 1, '2018-10-11 16:05:06');
INSERT INTO pr_operations VALUES (29, 5, 1, 1, 48, 1, '2018-10-11 16:05:06');
INSERT INTO pr_operations VALUES (30, 5, 1, 1, 50, 1, '2018-10-11 16:05:15');
INSERT INTO pr_operations VALUES (31, 5, 1, 1, 51, 1, '2018-10-11 16:05:15');
INSERT INTO pr_operations VALUES (32, 5, 1, 1, 53, 1, '2018-10-11 16:05:54');
INSERT INTO pr_operations VALUES (33, 5, 1, 1, 54, 1, '2018-10-11 16:05:55');
INSERT INTO pr_operations VALUES (34, 5, 1, 1, 56, 1, '2018-10-11 16:06:39');
INSERT INTO pr_operations VALUES (35, 5, 1, 1, 57, 1, '2018-10-11 16:06:39');
INSERT INTO pr_operations VALUES (39, 5, 1, 1, 62, 1, '2018-10-11 16:07:45');
INSERT INTO pr_operations VALUES (40, 5, 1, 1, 63, 1, '2018-10-11 16:07:45');
INSERT INTO pr_operations VALUES (41, 5, 1, 1, 65, 1, '2018-10-11 16:08:26');
INSERT INTO pr_operations VALUES (42, 5, 1, 1, 66, 1, '2018-10-11 16:08:27');
INSERT INTO pr_operations VALUES (43, 5, 1, 1, 68, 1, '2018-10-11 16:08:57');
INSERT INTO pr_operations VALUES (44, 5, 1, 1, 69, 1, '2018-10-11 16:08:57');
INSERT INTO pr_operations VALUES (45, 5, 1, 1, 71, 1, '2018-10-11 16:30:37');
INSERT INTO pr_operations VALUES (46, 5, 1, 1, 72, 1, '2018-10-11 16:30:37');
INSERT INTO pr_operations VALUES (47, 5, 1, 1, 74, 1, '2018-10-12 14:54:57');
INSERT INTO pr_operations VALUES (48, 5, 1, 1, 75, 1, '2018-10-12 14:54:59');
INSERT INTO pr_operations VALUES (49, 5, 1, 1, 77, 1, '2018-10-17 14:42:27');
INSERT INTO pr_operations VALUES (50, 5, 1, 1, 78, 1, '2018-10-17 14:42:28');
INSERT INTO pr_operations VALUES (51, 5, 1, 1, 79, 1, '2018-10-17 14:42:28');
INSERT INTO pr_operations VALUES (52, 5, 1, 1, 80, 1, '2018-10-17 14:43:36');
INSERT INTO pr_operations VALUES (53, 5, 1, 1, 81, 1, '2018-10-17 14:43:36');
INSERT INTO pr_operations VALUES (54, 5, 1, 1, 82, 1, '2018-10-17 14:43:36');
INSERT INTO pr_operations VALUES (55, 5, 1, 1, 83, 1, '2018-10-17 14:43:40');
INSERT INTO pr_operations VALUES (56, 5, 1, 1, 84, 1, '2018-10-17 14:43:40');
INSERT INTO pr_operations VALUES (57, 5, 1, 1, 85, 1, '2018-10-17 14:43:40');
INSERT INTO pr_operations VALUES (58, 5, 1, 1, 86, 1, '2018-10-17 14:43:57');
INSERT INTO pr_operations VALUES (59, 5, 1, 1, 87, 1, '2018-10-17 14:43:57');
INSERT INTO pr_operations VALUES (60, 5, 1, 1, 88, 1, '2018-10-17 14:43:57');
INSERT INTO pr_operations VALUES (61, 5, 1, 1, 89, 1, '2018-10-17 14:46:02');
INSERT INTO pr_operations VALUES (62, 5, 1, 1, 90, 1, '2018-10-17 14:46:02');
INSERT INTO pr_operations VALUES (63, 5, 1, 1, 91, 1, '2018-10-17 14:46:02');
INSERT INTO pr_operations VALUES (64, 5, 1, 1, 92, 1, '2018-10-17 14:47:47');
INSERT INTO pr_operations VALUES (65, 5, 1, 1, 93, 1, '2018-10-17 14:47:47');
INSERT INTO pr_operations VALUES (66, 5, 1, 1, 94, 1, '2018-10-17 14:47:47');
INSERT INTO pr_operations VALUES (67, 5, 1, 1, 95, 1, '2018-10-17 14:48:08');
INSERT INTO pr_operations VALUES (68, 5, 1, 1, 96, 1, '2018-10-17 14:48:08');
INSERT INTO pr_operations VALUES (69, 5, 1, 1, 97, 1, '2018-10-17 14:48:08');
INSERT INTO pr_operations VALUES (70, 5, 1, 1, 98, 1, '2018-10-17 14:48:20');
INSERT INTO pr_operations VALUES (71, 5, 1, 1, 99, 1, '2018-10-17 14:48:20');
INSERT INTO pr_operations VALUES (72, 5, 1, 1, 100, 1, '2018-10-17 14:48:20');
INSERT INTO pr_operations VALUES (73, 5, 1, 1, 101, 1, '2018-10-17 14:48:32');
INSERT INTO pr_operations VALUES (74, 5, 1, 1, 102, 1, '2018-10-17 14:48:32');
INSERT INTO pr_operations VALUES (75, 5, 1, 1, 103, 1, '2018-10-17 14:48:32');
INSERT INTO pr_operations VALUES (76, 5, 1, 1, 104, 1, '2018-10-17 14:49:57');
INSERT INTO pr_operations VALUES (77, 5, 1, 1, 105, 1, '2018-10-17 14:49:58');
INSERT INTO pr_operations VALUES (78, 5, 1, 1, 106, 1, '2018-10-17 14:49:58');
INSERT INTO pr_operations VALUES (79, 5, 1, 1, 107, 1, '2018-10-17 14:50:10');
INSERT INTO pr_operations VALUES (80, 5, 1, 1, 108, 1, '2018-10-17 14:50:10');
INSERT INTO pr_operations VALUES (81, 5, 1, 1, 109, 1, '2018-10-17 14:50:10');
INSERT INTO pr_operations VALUES (82, 5, 1, 1, 110, 1, '2018-10-17 14:52:58');
INSERT INTO pr_operations VALUES (83, 5, 1, 1, 111, 1, '2018-10-17 14:52:58');
INSERT INTO pr_operations VALUES (84, 5, 1, 1, 112, 1, '2018-10-17 14:52:58');
INSERT INTO pr_operations VALUES (85, 5, 1, 1, 113, 1, '2018-10-17 14:54:26');
INSERT INTO pr_operations VALUES (86, 5, 1, 1, 114, 1, '2018-10-17 14:54:26');
INSERT INTO pr_operations VALUES (87, 5, 1, 1, 115, 1, '2018-10-17 14:54:26');
INSERT INTO pr_operations VALUES (88, 5, 1, 1, 116, 1, '2018-10-17 14:54:48');
INSERT INTO pr_operations VALUES (89, 5, 1, 1, 117, 1, '2018-10-17 14:54:48');
INSERT INTO pr_operations VALUES (90, 5, 1, 1, 118, 1, '2018-10-17 14:54:48');
INSERT INTO pr_operations VALUES (91, 5, 1, 1, 119, 1, '2018-10-17 15:02:47');
INSERT INTO pr_operations VALUES (92, 5, 1, 1, 120, 1, '2018-10-17 15:02:48');
INSERT INTO pr_operations VALUES (93, 5, 1, 1, 121, 1, '2018-10-17 15:02:48');
INSERT INTO pr_operations VALUES (94, 5, 1, 1, 123, 1, '2018-10-17 16:03:26');
INSERT INTO pr_operations VALUES (95, 5, 1, 1, 124, 1, '2018-10-17 16:03:26');
INSERT INTO pr_operations VALUES (96, 5, 1, 1, 125, 1, '2018-10-17 16:03:26');
INSERT INTO pr_operations VALUES (97, 5, 1, 1, 127, 1, '2018-10-18 09:11:29');
INSERT INTO pr_operations VALUES (98, 5, 1, 1, 128, 1, '2018-10-18 09:11:30');
INSERT INTO pr_operations VALUES (99, 5, 1, 1, 130, 1, '2018-10-18 09:11:39');
INSERT INTO pr_operations VALUES (100, 5, 1, 1, 131, 1, '2018-10-18 09:11:39');
INSERT INTO pr_operations VALUES (101, 5, 1, 1, 132, 1, '2018-10-23 09:13:32');
INSERT INTO pr_operations VALUES (102, 5, 1, 1, 133, 1, '2018-10-23 09:13:33');
INSERT INTO pr_operations VALUES (103, 5, 1, 1, 134, 1, '2018-10-23 09:13:33');
INSERT INTO pr_operations VALUES (104, 5, 1, 1, 136, 1, '2018-10-23 09:16:08');
INSERT INTO pr_operations VALUES (105, 5, 1, 1, 137, 1, '2018-10-23 09:16:08');
INSERT INTO pr_operations VALUES (106, 5, 1, 1, 138, 1, '2018-10-23 09:16:08');
INSERT INTO pr_operations VALUES (107, 5, 1, 1, 140, 1, '2018-10-23 09:16:30');
INSERT INTO pr_operations VALUES (108, 5, 1, 1, 141, 1, '2018-10-23 09:16:30');
INSERT INTO pr_operations VALUES (109, 5, 1, 1, 142, 1, '2018-10-23 09:16:30');
INSERT INTO pr_operations VALUES (110, 5, 1, 1, 144, 1, '2018-10-23 09:17:08');
INSERT INTO pr_operations VALUES (111, 5, 1, 1, 145, 1, '2018-10-23 09:17:08');
INSERT INTO pr_operations VALUES (112, 5, 1, 1, 146, 1, '2018-10-23 09:17:08');
INSERT INTO pr_operations VALUES (113, 5, 1, 1, 148, 1, '2018-10-23 09:17:40');
INSERT INTO pr_operations VALUES (114, 5, 1, 1, 149, 1, '2018-10-23 09:17:40');
INSERT INTO pr_operations VALUES (115, 5, 1, 1, 150, 1, '2018-10-23 09:17:40');
INSERT INTO pr_operations VALUES (116, 5, 1, 1, 152, 1, '2018-10-23 09:21:14');
INSERT INTO pr_operations VALUES (117, 5, 1, 1, 153, 1, '2018-10-23 09:21:14');
INSERT INTO pr_operations VALUES (118, 5, 1, 1, 154, 1, '2018-10-23 09:21:14');
INSERT INTO pr_operations VALUES (119, 5, 1, 1, 156, 1, '2018-10-23 09:22:36');
INSERT INTO pr_operations VALUES (120, 5, 1, 1, 157, 1, '2018-10-23 09:22:36');
INSERT INTO pr_operations VALUES (121, 5, 1, 1, 158, 1, '2018-10-23 09:22:36');


--
-- Data for Name: pr_operators; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_operators VALUES (1, '!in_array', 'not_in');
INSERT INTO pr_operators VALUES (2, 'in_array', 'in');
INSERT INTO pr_operators VALUES (3, ' == 0 ', 'is_null');
INSERT INTO pr_operators VALUES (4, '!== 0 ', 'is_not_null');
INSERT INTO pr_operators VALUES (5, '!=', 'not_equal');
INSERT INTO pr_operators VALUES (6, '==', 'equal');
INSERT INTO pr_operators VALUES (7, '<=', 'less_or_equal');
INSERT INTO pr_operators VALUES (8, '<', 'less');
INSERT INTO pr_operators VALUES (9, 'between', 'between');
INSERT INTO pr_operators VALUES (10, '!between', 'not_between');
INSERT INTO pr_operators VALUES (11, '>', 'greater');
INSERT INTO pr_operators VALUES (12, '>=', 'greater_or_equal');


--
-- Data for Name: pr_origin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_origin VALUES (1, 'WEB');


--
-- Data for Name: pr_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_parameters VALUES (1, 'schedule', 'schedule', '{
                id: ''schedule'',
                label: ''Horario'',
                type: ''time'',
                operators: [''between'', ''less'',''less_or_equal'' ,''not_between'' ,''greater_or_equal'' ,''greater'']   ,
                validation: {
                    format: ''HH:ii''
                },
                plugin: ''timepicker'',
                plugin_config: {
                    showMeridian: false
                }
      
            }', true, 'time');
INSERT INTO pr_parameters VALUES (2, 'days', 'days', '{
            id: ''days'',
            label: ''Días'',
            type: ''integer'',
            input: ''checkbox'',
            values: {
                1: ''Lun'',
                2: ''Mar'',
                3: ''Mier'',
                4: ''Jue'',
                5: ''Vie'',
                6: ''Sáb'',
                7: ''Dom''
            },
            color: ''primary'',
            operators: [''in'', ''not_in'']
            }', true, 'days');
INSERT INTO pr_parameters VALUES (3, 'avg_play_time', 'GameInfo', '{
            id: ''avg_play_time'',
            label: ''Tiempo de juego promedio'',
            type: ''time'',
            placeholder: ''Hora:Minutos'',
            validation: {
                format: ''HH:mm:ss''
            },
            plugin: ''timepicker'',
            plugin_config: {
                showMeridian: false
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''not_between'' ,''greater_or_equal'' ,''greater''] 
            }', true, 'time');
INSERT INTO pr_parameters VALUES (4, 'avg_play_time_total', 'GameInfo', '{
            id: ''avg_play_time_total'',
            label: ''Tiempo de juego promedio total'',
            type: ''time'',
            validation: {
                format: ''HH:mm:ss''
            },
            validation: {
                min: 0,
                step: 0.01
              },
            plugin: ''timepicker'',
            plugin_config: {
                showMeridian: false
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''not_between'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'time');
INSERT INTO pr_parameters VALUES (5, 'play_time', 'GameInfo', '{
            id: ''play_time'',
            label: ''Tiempo de juego'',
            type: ''time'',
            validation: {
                format: ''HH:mm:ss''
            },
            plugin: ''timepicker'',
            plugin_config: {
                showMeridian: false
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'time');
INSERT INTO pr_parameters VALUES (6, 'play_time_total', 'GameInfo', '{
            id: ''play_time_total'',
            label: ''Tiempo de juego total'',
            type: ''time'',
            validation: {
                format: ''HH:mm:ss''
            },
            plugin: ''timepicker'',
            plugin_config: {
                showMeridian: false
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'time');
INSERT INTO pr_parameters VALUES (7, 'avg_bet', 'GameInfo', '{
            id: ''avg_bet'',
            label: ''Apuesta promedio'',
            type: ''double'',
            validation: {
                min: 0,
                step: 0.01
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'double');
INSERT INTO pr_parameters VALUES (8, 'avg_bet_total', 'GameInfo', '{
            id: ''avg_bet_total'',
            label: ''Apuesta promedio total'',
            type: ''integer'',
            validation: {
                min: 0,
                step: 0.01
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'double');
INSERT INTO pr_parameters VALUES (9, 'max_bet', 'GameInfo', '{
            id: ''max_bet'',
            label: ''Máximo apostado'',
            type: ''double'',
            validation: {
                min: 0,
                step: 0.01
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
          }', true, 'double');
INSERT INTO pr_parameters VALUES (10, 'max_bet_total', 'GameInfo', '{
            id: ''max_bet_total'',
            label: ''Máximo apostado total'',
            type: ''double'',
            validation: {
                min: 0,
                step: 0.01
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'float');
INSERT INTO pr_parameters VALUES (11, 'played_games', 'GameInfo', '{
            id: ''played_games'',
            label: ''Juegos Jugados'',
            type: ''integer'',
            validation: {
                min: 0,
                step: 1
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'integer');
INSERT INTO pr_parameters VALUES (12, 'played_games_total', 'GameInfo', '{
            id: ''played_games_total'',
            label: ''Juegos Jugados total'',
            type: ''integer'',
            validation: {
                min: 0,
                step: 1
            },
            operators: [''between'', ''less'',''less_or_equal'' ,''greater_or_equal'' ,''greater''] 
        }', true, 'integer');
INSERT INTO pr_parameters VALUES (13, 'presentism', 'presentism', '{
            id: ''presentism'',
            label: ''Presentismo'',
            type: ''integer'',
            input: ''select'',
            values: {
                0: ''Si''             
            },         
            operators: [''equal'']
            }', true, 'presentism');


--
-- Data for Name: pr_parameters_operators; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_parameters_operators VALUES (1, 7);
INSERT INTO pr_parameters_operators VALUES (1, 8);
INSERT INTO pr_parameters_operators VALUES (1, 11);
INSERT INTO pr_parameters_operators VALUES (1, 12);
INSERT INTO pr_parameters_operators VALUES (1, 9);
INSERT INTO pr_parameters_operators VALUES (1, 10);
INSERT INTO pr_parameters_operators VALUES (1, 6);
INSERT INTO pr_parameters_operators VALUES (1, 5);
INSERT INTO pr_parameters_operators VALUES (2, 1);
INSERT INTO pr_parameters_operators VALUES (2, 2);
INSERT INTO pr_parameters_operators VALUES (3, 7);
INSERT INTO pr_parameters_operators VALUES (3, 8);
INSERT INTO pr_parameters_operators VALUES (3, 11);
INSERT INTO pr_parameters_operators VALUES (3, 12);
INSERT INTO pr_parameters_operators VALUES (3, 9);
INSERT INTO pr_parameters_operators VALUES (3, 10);
INSERT INTO pr_parameters_operators VALUES (3, 6);
INSERT INTO pr_parameters_operators VALUES (3, 5);
INSERT INTO pr_parameters_operators VALUES (4, 7);
INSERT INTO pr_parameters_operators VALUES (4, 8);
INSERT INTO pr_parameters_operators VALUES (4, 11);
INSERT INTO pr_parameters_operators VALUES (4, 12);
INSERT INTO pr_parameters_operators VALUES (4, 9);
INSERT INTO pr_parameters_operators VALUES (4, 10);
INSERT INTO pr_parameters_operators VALUES (4, 6);
INSERT INTO pr_parameters_operators VALUES (4, 5);
INSERT INTO pr_parameters_operators VALUES (5, 7);
INSERT INTO pr_parameters_operators VALUES (5, 8);
INSERT INTO pr_parameters_operators VALUES (5, 11);
INSERT INTO pr_parameters_operators VALUES (5, 12);
INSERT INTO pr_parameters_operators VALUES (5, 9);
INSERT INTO pr_parameters_operators VALUES (5, 10);
INSERT INTO pr_parameters_operators VALUES (5, 6);
INSERT INTO pr_parameters_operators VALUES (5, 5);
INSERT INTO pr_parameters_operators VALUES (6, 7);
INSERT INTO pr_parameters_operators VALUES (6, 8);
INSERT INTO pr_parameters_operators VALUES (6, 11);
INSERT INTO pr_parameters_operators VALUES (6, 12);
INSERT INTO pr_parameters_operators VALUES (6, 9);
INSERT INTO pr_parameters_operators VALUES (6, 10);
INSERT INTO pr_parameters_operators VALUES (6, 6);
INSERT INTO pr_parameters_operators VALUES (6, 5);
INSERT INTO pr_parameters_operators VALUES (7, 7);
INSERT INTO pr_parameters_operators VALUES (7, 8);
INSERT INTO pr_parameters_operators VALUES (7, 11);
INSERT INTO pr_parameters_operators VALUES (7, 12);
INSERT INTO pr_parameters_operators VALUES (7, 9);
INSERT INTO pr_parameters_operators VALUES (8, 7);
INSERT INTO pr_parameters_operators VALUES (8, 8);
INSERT INTO pr_parameters_operators VALUES (8, 11);
INSERT INTO pr_parameters_operators VALUES (8, 12);
INSERT INTO pr_parameters_operators VALUES (8, 9);
INSERT INTO pr_parameters_operators VALUES (9, 7);
INSERT INTO pr_parameters_operators VALUES (9, 8);
INSERT INTO pr_parameters_operators VALUES (9, 11);
INSERT INTO pr_parameters_operators VALUES (9, 12);
INSERT INTO pr_parameters_operators VALUES (9, 9);
INSERT INTO pr_parameters_operators VALUES (10, 7);
INSERT INTO pr_parameters_operators VALUES (10, 8);
INSERT INTO pr_parameters_operators VALUES (10, 11);
INSERT INTO pr_parameters_operators VALUES (10, 12);
INSERT INTO pr_parameters_operators VALUES (10, 9);
INSERT INTO pr_parameters_operators VALUES (11, 7);
INSERT INTO pr_parameters_operators VALUES (11, 8);
INSERT INTO pr_parameters_operators VALUES (11, 11);
INSERT INTO pr_parameters_operators VALUES (11, 12);
INSERT INTO pr_parameters_operators VALUES (11, 9);
INSERT INTO pr_parameters_operators VALUES (12, 7);
INSERT INTO pr_parameters_operators VALUES (12, 8);
INSERT INTO pr_parameters_operators VALUES (12, 11);
INSERT INTO pr_parameters_operators VALUES (12, 12);
INSERT INTO pr_parameters_operators VALUES (12, 9);
INSERT INTO pr_parameters_operators VALUES (13, 6);


--
-- Data for Name: pr_printers_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_printers_type VALUES (1, 'TITO_PRINTER');
INSERT INTO pr_printers_type VALUES (2, 'THERMAL_PRINTER');


--
-- Data for Name: pr_promo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_promo VALUES (1, 1, 'Cafe con leche y Pizza', '2018-09-08 17:27:20', '2018-12-08 17:27:20', '2018-10-08 17:27:20', true);
INSERT INTO pr_promo VALUES (2, 1, 'Pabliyo Promo', '2018-10-09 10:52:00', '2020-11-18 10:50:00', '2018-10-09 10:52:10', true);
INSERT INTO pr_promo VALUES (3, 1, 'voucheterma', '2018-10-09 14:34:00', '2020-12-26 14:30:00', '2018-10-09 14:34:56', true);
INSERT INTO pr_promo VALUES (4, 1, 'TITOPRINT', '2018-10-11 15:55:00', '2019-12-12 15:55:00', '2018-10-11 15:56:49', true);
INSERT INTO pr_promo VALUES (5, 1, 'PUNTILLOS', '2018-10-11 15:58:00', '2019-12-27 15:55:00', '2018-10-11 16:00:01', true);
INSERT INTO pr_promo VALUES (6, 1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2018-10-12 15:00:00', '2019-12-05 15:00:00', '2018-10-12 15:00:48', false);
INSERT INTO pr_promo VALUES (10, 1, 'Ada', '2018-10-12 15:01:00', '2021-11-25 15:00:00', '2018-10-12 15:10:22', true);
INSERT INTO pr_promo VALUES (11, 1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2018-10-12 15:11:00', '2018-10-12 15:15:00', '2018-10-12 15:12:05', true);
INSERT INTO pr_promo VALUES (15, 1, '55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555552', '2018-10-12 16:27:00', '2018-10-30 16:25:00', '2018-10-12 16:27:31', true);


--
-- Data for Name: pr_promo_redeemed; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_promo_redeemed VALUES (1, 1, 1, '2018-10-08 17:27:20');
INSERT INTO pr_promo_redeemed VALUES (2, 1, 2, '2018-10-09 10:51:25');
INSERT INTO pr_promo_redeemed VALUES (3, 2, 2, '2018-10-09 10:53:09');
INSERT INTO pr_promo_redeemed VALUES (4, 2, 2, '2018-10-09 14:32:35');
INSERT INTO pr_promo_redeemed VALUES (5, 3, 2, '2018-10-09 14:34:59');
INSERT INTO pr_promo_redeemed VALUES (6, 2, 2, '2018-10-09 14:35:00');
INSERT INTO pr_promo_redeemed VALUES (7, 2, 2, '2018-10-09 14:35:31');
INSERT INTO pr_promo_redeemed VALUES (8, 2, 2, '2018-10-09 14:42:55');
INSERT INTO pr_promo_redeemed VALUES (9, 2, 2, '2018-10-09 14:53:04');
INSERT INTO pr_promo_redeemed VALUES (10, 3, 2, '2018-10-09 15:08:40');
INSERT INTO pr_promo_redeemed VALUES (11, 2, 2, '2018-10-09 15:08:40');
INSERT INTO pr_promo_redeemed VALUES (12, 3, 2, '2018-10-09 15:09:29');
INSERT INTO pr_promo_redeemed VALUES (13, 3, 2, '2018-10-09 15:11:50');
INSERT INTO pr_promo_redeemed VALUES (14, 2, 2, '2018-10-09 15:11:50');
INSERT INTO pr_promo_redeemed VALUES (15, 3, 1, '2018-10-11 15:54:41');
INSERT INTO pr_promo_redeemed VALUES (16, 2, 1, '2018-10-11 15:54:43');
INSERT INTO pr_promo_redeemed VALUES (17, 3, 1, '2018-10-11 15:55:48');
INSERT INTO pr_promo_redeemed VALUES (18, 2, 1, '2018-10-11 15:55:48');
INSERT INTO pr_promo_redeemed VALUES (19, 4, 1, '2018-10-11 15:56:51');
INSERT INTO pr_promo_redeemed VALUES (20, 3, 1, '2018-10-11 15:56:51');
INSERT INTO pr_promo_redeemed VALUES (21, 2, 1, '2018-10-11 15:56:52');
INSERT INTO pr_promo_redeemed VALUES (22, 4, 1, '2018-10-11 16:00:04');
INSERT INTO pr_promo_redeemed VALUES (23, 3, 1, '2018-10-11 16:00:05');
INSERT INTO pr_promo_redeemed VALUES (24, 2, 1, '2018-10-11 16:00:05');
INSERT INTO pr_promo_redeemed VALUES (25, 4, 1, '2018-10-11 16:00:39');
INSERT INTO pr_promo_redeemed VALUES (26, 3, 1, '2018-10-11 16:00:40');
INSERT INTO pr_promo_redeemed VALUES (27, 2, 1, '2018-10-11 16:00:40');
INSERT INTO pr_promo_redeemed VALUES (28, 4, 1, '2018-10-11 16:02:18');
INSERT INTO pr_promo_redeemed VALUES (29, 3, 1, '2018-10-11 16:02:18');
INSERT INTO pr_promo_redeemed VALUES (30, 2, 1, '2018-10-11 16:02:18');
INSERT INTO pr_promo_redeemed VALUES (31, 4, 1, '2018-10-11 16:03:00');
INSERT INTO pr_promo_redeemed VALUES (32, 3, 1, '2018-10-11 16:03:00');
INSERT INTO pr_promo_redeemed VALUES (33, 2, 1, '2018-10-11 16:03:01');
INSERT INTO pr_promo_redeemed VALUES (34, 4, 1, '2018-10-11 16:04:39');
INSERT INTO pr_promo_redeemed VALUES (35, 3, 1, '2018-10-11 16:04:39');
INSERT INTO pr_promo_redeemed VALUES (36, 2, 1, '2018-10-11 16:04:39');
INSERT INTO pr_promo_redeemed VALUES (37, 4, 1, '2018-10-11 16:05:06');
INSERT INTO pr_promo_redeemed VALUES (38, 3, 1, '2018-10-11 16:05:06');
INSERT INTO pr_promo_redeemed VALUES (39, 2, 1, '2018-10-11 16:05:07');
INSERT INTO pr_promo_redeemed VALUES (40, 4, 1, '2018-10-11 16:05:15');
INSERT INTO pr_promo_redeemed VALUES (41, 3, 1, '2018-10-11 16:05:15');
INSERT INTO pr_promo_redeemed VALUES (42, 2, 1, '2018-10-11 16:05:16');
INSERT INTO pr_promo_redeemed VALUES (43, 4, 1, '2018-10-11 16:05:55');
INSERT INTO pr_promo_redeemed VALUES (44, 3, 1, '2018-10-11 16:05:55');
INSERT INTO pr_promo_redeemed VALUES (45, 2, 1, '2018-10-11 16:05:55');
INSERT INTO pr_promo_redeemed VALUES (46, 4, 1, '2018-10-11 16:06:39');
INSERT INTO pr_promo_redeemed VALUES (47, 3, 1, '2018-10-11 16:06:39');
INSERT INTO pr_promo_redeemed VALUES (48, 2, 1, '2018-10-11 16:06:39');
INSERT INTO pr_promo_redeemed VALUES (49, 4, 1, '2018-10-11 16:07:45');
INSERT INTO pr_promo_redeemed VALUES (50, 3, 1, '2018-10-11 16:07:45');
INSERT INTO pr_promo_redeemed VALUES (51, 2, 1, '2018-10-11 16:07:45');
INSERT INTO pr_promo_redeemed VALUES (52, 4, 1, '2018-10-11 16:08:26');
INSERT INTO pr_promo_redeemed VALUES (53, 3, 1, '2018-10-11 16:08:27');
INSERT INTO pr_promo_redeemed VALUES (54, 2, 1, '2018-10-11 16:08:31');
INSERT INTO pr_promo_redeemed VALUES (55, 4, 1, '2018-10-11 16:08:57');
INSERT INTO pr_promo_redeemed VALUES (56, 3, 1, '2018-10-11 16:08:57');
INSERT INTO pr_promo_redeemed VALUES (57, 2, 1, '2018-10-11 16:08:57');
INSERT INTO pr_promo_redeemed VALUES (58, 4, 2, '2018-10-11 16:30:37');
INSERT INTO pr_promo_redeemed VALUES (59, 3, 2, '2018-10-11 16:30:37');
INSERT INTO pr_promo_redeemed VALUES (60, 2, 2, '2018-10-11 16:30:37');
INSERT INTO pr_promo_redeemed VALUES (61, 4, 2, '2018-10-12 14:54:58');
INSERT INTO pr_promo_redeemed VALUES (62, 3, 2, '2018-10-12 14:54:59');
INSERT INTO pr_promo_redeemed VALUES (63, 2, 2, '2018-10-12 14:55:00');
INSERT INTO pr_promo_redeemed VALUES (64, 5, 1, '2018-10-17 14:42:27');
INSERT INTO pr_promo_redeemed VALUES (65, 4, 1, '2018-10-17 14:42:28');
INSERT INTO pr_promo_redeemed VALUES (66, 3, 1, '2018-10-17 14:42:28');
INSERT INTO pr_promo_redeemed VALUES (67, 5, 1, '2018-10-17 14:43:36');
INSERT INTO pr_promo_redeemed VALUES (68, 4, 1, '2018-10-17 14:43:36');
INSERT INTO pr_promo_redeemed VALUES (69, 3, 1, '2018-10-17 14:43:36');
INSERT INTO pr_promo_redeemed VALUES (70, 5, 1, '2018-10-17 14:43:40');
INSERT INTO pr_promo_redeemed VALUES (71, 4, 1, '2018-10-17 14:43:40');
INSERT INTO pr_promo_redeemed VALUES (72, 3, 1, '2018-10-17 14:43:40');
INSERT INTO pr_promo_redeemed VALUES (73, 5, 1, '2018-10-17 14:43:57');
INSERT INTO pr_promo_redeemed VALUES (74, 4, 1, '2018-10-17 14:43:57');
INSERT INTO pr_promo_redeemed VALUES (75, 3, 1, '2018-10-17 14:43:57');
INSERT INTO pr_promo_redeemed VALUES (76, 5, 1, '2018-10-17 14:46:02');
INSERT INTO pr_promo_redeemed VALUES (77, 4, 1, '2018-10-17 14:46:02');
INSERT INTO pr_promo_redeemed VALUES (78, 3, 1, '2018-10-17 14:46:02');
INSERT INTO pr_promo_redeemed VALUES (79, 5, 1, '2018-10-17 14:47:47');
INSERT INTO pr_promo_redeemed VALUES (80, 4, 1, '2018-10-17 14:47:47');
INSERT INTO pr_promo_redeemed VALUES (81, 3, 1, '2018-10-17 14:47:47');
INSERT INTO pr_promo_redeemed VALUES (82, 5, 1, '2018-10-17 14:48:08');
INSERT INTO pr_promo_redeemed VALUES (83, 4, 1, '2018-10-17 14:48:08');
INSERT INTO pr_promo_redeemed VALUES (84, 3, 1, '2018-10-17 14:48:08');
INSERT INTO pr_promo_redeemed VALUES (85, 5, 1, '2018-10-17 14:48:20');
INSERT INTO pr_promo_redeemed VALUES (86, 4, 1, '2018-10-17 14:48:20');
INSERT INTO pr_promo_redeemed VALUES (87, 3, 1, '2018-10-17 14:48:20');
INSERT INTO pr_promo_redeemed VALUES (88, 5, 1, '2018-10-17 14:48:32');
INSERT INTO pr_promo_redeemed VALUES (89, 4, 1, '2018-10-17 14:48:32');
INSERT INTO pr_promo_redeemed VALUES (90, 3, 1, '2018-10-17 14:48:32');
INSERT INTO pr_promo_redeemed VALUES (91, 5, 1, '2018-10-17 14:49:58');
INSERT INTO pr_promo_redeemed VALUES (92, 4, 1, '2018-10-17 14:49:58');
INSERT INTO pr_promo_redeemed VALUES (93, 3, 1, '2018-10-17 14:49:58');
INSERT INTO pr_promo_redeemed VALUES (94, 5, 1, '2018-10-17 14:50:10');
INSERT INTO pr_promo_redeemed VALUES (95, 4, 1, '2018-10-17 14:50:10');
INSERT INTO pr_promo_redeemed VALUES (96, 3, 1, '2018-10-17 14:50:10');
INSERT INTO pr_promo_redeemed VALUES (97, 5, 1, '2018-10-17 14:52:58');
INSERT INTO pr_promo_redeemed VALUES (98, 4, 1, '2018-10-17 14:52:58');
INSERT INTO pr_promo_redeemed VALUES (99, 3, 1, '2018-10-17 14:52:58');
INSERT INTO pr_promo_redeemed VALUES (100, 5, 1, '2018-10-17 14:54:26');
INSERT INTO pr_promo_redeemed VALUES (101, 4, 1, '2018-10-17 14:54:26');
INSERT INTO pr_promo_redeemed VALUES (102, 3, 1, '2018-10-17 14:54:26');
INSERT INTO pr_promo_redeemed VALUES (103, 5, 1, '2018-10-17 14:54:48');
INSERT INTO pr_promo_redeemed VALUES (104, 4, 1, '2018-10-17 14:54:48');
INSERT INTO pr_promo_redeemed VALUES (105, 3, 1, '2018-10-17 14:54:48');
INSERT INTO pr_promo_redeemed VALUES (106, 5, 1, '2018-10-17 15:02:47');
INSERT INTO pr_promo_redeemed VALUES (107, 4, 1, '2018-10-17 15:02:48');
INSERT INTO pr_promo_redeemed VALUES (108, 3, 1, '2018-10-17 15:02:48');
INSERT INTO pr_promo_redeemed VALUES (109, 6, 1, '2018-10-17 16:03:26');
INSERT INTO pr_promo_redeemed VALUES (110, 5, 1, '2018-10-17 16:03:26');
INSERT INTO pr_promo_redeemed VALUES (111, 4, 1, '2018-10-17 16:03:26');
INSERT INTO pr_promo_redeemed VALUES (112, 3, 1, '2018-10-17 16:03:26');
INSERT INTO pr_promo_redeemed VALUES (113, 6, 1, '2018-10-18 09:11:29');
INSERT INTO pr_promo_redeemed VALUES (114, 4, 1, '2018-10-18 09:11:29');
INSERT INTO pr_promo_redeemed VALUES (115, 3, 1, '2018-10-18 09:11:30');
INSERT INTO pr_promo_redeemed VALUES (116, 6, 1, '2018-10-18 09:11:39');
INSERT INTO pr_promo_redeemed VALUES (117, 4, 1, '2018-10-18 09:11:39');
INSERT INTO pr_promo_redeemed VALUES (118, 3, 1, '2018-10-18 09:11:39');
INSERT INTO pr_promo_redeemed VALUES (119, 5, 1, '2018-10-23 09:13:32');
INSERT INTO pr_promo_redeemed VALUES (120, 4, 1, '2018-10-23 09:13:33');
INSERT INTO pr_promo_redeemed VALUES (121, 3, 1, '2018-10-23 09:13:33');
INSERT INTO pr_promo_redeemed VALUES (122, 2, 1, '2018-10-23 09:13:36');
INSERT INTO pr_promo_redeemed VALUES (123, 5, 1, '2018-10-23 09:16:08');
INSERT INTO pr_promo_redeemed VALUES (124, 4, 1, '2018-10-23 09:16:08');
INSERT INTO pr_promo_redeemed VALUES (125, 3, 1, '2018-10-23 09:16:08');
INSERT INTO pr_promo_redeemed VALUES (126, 2, 1, '2018-10-23 09:16:09');
INSERT INTO pr_promo_redeemed VALUES (127, 5, 1, '2018-10-23 09:16:30');
INSERT INTO pr_promo_redeemed VALUES (128, 4, 1, '2018-10-23 09:16:30');
INSERT INTO pr_promo_redeemed VALUES (129, 3, 1, '2018-10-23 09:16:30');
INSERT INTO pr_promo_redeemed VALUES (130, 2, 1, '2018-10-23 09:16:31');
INSERT INTO pr_promo_redeemed VALUES (131, 5, 1, '2018-10-23 09:17:08');
INSERT INTO pr_promo_redeemed VALUES (132, 4, 1, '2018-10-23 09:17:08');
INSERT INTO pr_promo_redeemed VALUES (133, 3, 1, '2018-10-23 09:17:08');
INSERT INTO pr_promo_redeemed VALUES (134, 2, 1, '2018-10-23 09:17:08');
INSERT INTO pr_promo_redeemed VALUES (135, 5, 1, '2018-10-23 09:17:40');
INSERT INTO pr_promo_redeemed VALUES (136, 4, 1, '2018-10-23 09:17:40');
INSERT INTO pr_promo_redeemed VALUES (137, 3, 1, '2018-10-23 09:17:40');
INSERT INTO pr_promo_redeemed VALUES (138, 2, 1, '2018-10-23 09:17:40');
INSERT INTO pr_promo_redeemed VALUES (139, 5, 1, '2018-10-23 09:21:14');
INSERT INTO pr_promo_redeemed VALUES (140, 4, 1, '2018-10-23 09:21:14');
INSERT INTO pr_promo_redeemed VALUES (141, 3, 1, '2018-10-23 09:21:14');
INSERT INTO pr_promo_redeemed VALUES (142, 2, 1, '2018-10-23 09:21:14');
INSERT INTO pr_promo_redeemed VALUES (143, 5, 1, '2018-10-23 09:22:36');
INSERT INTO pr_promo_redeemed VALUES (144, 4, 1, '2018-10-23 09:22:36');
INSERT INTO pr_promo_redeemed VALUES (145, 3, 1, '2018-10-23 09:22:36');
INSERT INTO pr_promo_redeemed VALUES (146, 2, 1, '2018-10-23 09:22:40');


--
-- Data for Name: pr_promo_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_promo_rules VALUES (2, 2, '#{3}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (3, 3, '#{4}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6,7]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (4, 4, '#{5}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (5, 5, '#{6}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (6, 6, '#{7}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (12, 10, '#{13}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (13, 11, '#{14}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (19, 15, '#{20}', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6]}],"valid":true}');
INSERT INTO pr_promo_rules VALUES (1, 1, '1 && 1 ', '{"condition":"AND","rules":[{"id":"days","field":"days","type":"integer","input":"checkbox","operator":"in","value":[1,2,3,4,5,6]}],"valid":true}');


--
-- Data for Name: pr_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_rules VALUES (1, 12, 8, 1, '09/05/2018');
INSERT INTO pr_rules VALUES (2, 2, 2, 1, '1-4-5');
INSERT INTO pr_rules VALUES (3, 2, 2, 2, '1-2-3-4-5-6');
INSERT INTO pr_rules VALUES (4, 2, 2, 3, '1-2-3-4-5-6-7');
INSERT INTO pr_rules VALUES (5, 2, 2, 4, '1-2-3-4-5-6');
INSERT INTO pr_rules VALUES (6, 2, 2, 5, '1-2-3');
INSERT INTO pr_rules VALUES (7, 2, 2, 6, '1-2-3-4-5');
INSERT INTO pr_rules VALUES (13, 2, 2, 12, '1-2-3-4-5-6');
INSERT INTO pr_rules VALUES (14, 2, 2, 13, '1-2');
INSERT INTO pr_rules VALUES (20, 2, 2, 19, '1-2-3-4-5-6');


--
-- Data for Name: pr_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_status VALUES (1, 'Promotions.Generated');
INSERT INTO pr_status VALUES (2, 'Promotions.Redeemed');
INSERT INTO pr_status VALUES (3, 'Promotions.Expired');
INSERT INTO pr_status VALUES (4, 'Promotions.Canceled');
INSERT INTO pr_status VALUES (5, 'Promotions.Printing');


--
-- Data for Name: pr_tito_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pr_tito_type VALUES (1, false, 'Ticket restrictivo por transferencia electr&oacute,nica', '03');
INSERT INTO pr_tito_type VALUES (2, false, 'Ticket de d&eacute,bito por transferencia electr&oacute,nica', '04');
INSERT INTO pr_tito_type VALUES (3, false, 'Ticket cobrable por transferencia electr&oacute,nica', '09');
INSERT INTO pr_tito_type VALUES (4, false, 'Ticket cobrable', '80');
INSERT INTO pr_tito_type VALUES (5, false, 'Ticket promocional restrictivo', '81');
INSERT INTO pr_tito_type VALUES (6, false, 'Ticket promocional no restrictivo', '82');
INSERT INTO pr_tito_type VALUES (7, false, 'Ticket cobrable', '00');
INSERT INTO pr_tito_type VALUES (8, true, 'Ticket promocional restrictivo', '01');
INSERT INTO pr_tito_type VALUES (9, false, 'Ticket promocional no restrictivo', '02');
INSERT INTO pr_tito_type VALUES (10, false, 'Pago en mano por cr&eacute,ditos cancelados (Ticket Impreso)', '10');
INSERT INTO pr_tito_type VALUES (11, false, 'Pago en mano por jackpot (Ticket Impreso)', '20');
INSERT INTO pr_tito_type VALUES (12, false, 'Pago en mano por cr&eacute,ditos cancelados (T. No Impreso)', '40');
INSERT INTO pr_tito_type VALUES (13, false, 'Pago en mano por jackpot (T. No Impreso)', '60');


--
-- Name: afip_batch_shipping_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_batch_shipping_batch_id_seq', 1, false);


--
-- Name: afip_batch_shipping_batch_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_batch_shipping_batch_log_id_seq', 1, false);


--
-- Name: afip_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_certificate_id_seq', 1, false);


--
-- Name: afip_cuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_cuits_id_seq', 3, true);


--
-- Name: afip_egm_blocked_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_egm_blocked_id_seq', 1, false);


--
-- Name: afip_egm_ship_counters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_egm_ship_counters_id_seq', 1, false);


--
-- Name: afip_egm_shipping_egm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_egm_shipping_egm_id_seq', 1, false);


--
-- Name: afip_errors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_errors_id_seq', 49, true);


--
-- Name: afip_explotation_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_explotation_points_id_seq', 3, true);


--
-- Name: afip_handler_shipping_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_handler_shipping_batch_id_seq', 1, false);


--
-- Name: afip_handler_shipping_egm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_handler_shipping_egm_id_seq', 1, false);


--
-- Name: afip_handler_shipping_table_bingo_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_handler_shipping_table_bingo_data_id_seq', 1, false);


--
-- Name: afip_handler_shipping_table_bingo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_handler_shipping_table_bingo_id_seq', 1, false);


--
-- Name: afip_handler_shipping_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_handler_shipping_table_id_seq', 1, false);


--
-- Name: afip_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_servers_id_seq', 4, true);


--
-- Name: afip_servers_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_servers_types_id_seq', 4, true);


--
-- Name: afip_shipping_errors_batch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_shipping_errors_batch_id_seq', 1, false);


--
-- Name: afip_shipping_errors_bingo_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_shipping_errors_bingo_data_id_seq', 1, false);


--
-- Name: afip_shipping_errors_egm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_shipping_errors_egm_id_seq', 1, false);


--
-- Name: afip_shipping_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_shipping_state_id_seq', 9, true);


--
-- Name: afip_shipping_state_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_shipping_state_types_id_seq', 1, true);


--
-- Name: afip_table_shipping_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_table_shipping_table_id_seq', 1, false);


--
-- Name: afip_ve_comms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_ve_comms_id_seq', 1, false);


--
-- Name: afip_ve_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('afip_ve_machine_id_seq', 1, false);


--
-- Name: cr_authentication_error_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_authentication_error_log_id_seq', 1, false);


--
-- Name: cr_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_floor_id_seq', 3, true);


--
-- Name: cr_global_parameter_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_global_parameter_category_id_seq', 2, true);


--
-- Name: cr_global_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_global_parameter_id_seq', 18, true);


--
-- Name: cr_global_parameter_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_global_parameter_value_id_seq', 20, true);


--
-- Name: cr_locked_user_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_locked_user_log_id_seq', 1, false);


--
-- Name: cr_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_owner_id_seq', 3, true);


--
-- Name: cr_password_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_password_log_id_seq', 1, false);


--
-- Name: cr_session_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_session_log_id_seq', 23, true);


--
-- Name: cr_user_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_user_access_id_seq', 6, true);


--
-- Name: cr_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_user_id_seq', 3, true);


--
-- Name: cr_user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_user_profile_id_seq', 3, true);


--
-- Name: cr_user_user_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cr_user_user_profile_id_seq', 3, true);


--
-- Name: pr_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_areas_id_seq', 1, true);


--
-- Name: pr_game_session_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_game_session_members_id_seq', 1, false);


--
-- Name: pr_item_generated_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_item_generated_id_seq', 159, true);


--
-- Name: pr_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_item_id_seq', 12, true);


--
-- Name: pr_last_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_last_update_id_seq', 1, false);


--
-- Name: pr_log_themler_change_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_log_themler_change_id_seq', 6, true);


--
-- Name: pr_member_points_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_member_points_id_seq', 1, false);


--
-- Name: pr_members_data_cvip_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_members_data_cvip_id_seq', 1, false);


--
-- Name: pr_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_members_id_seq', 3, true);


--
-- Name: pr_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_operations_id_seq', 121, true);


--
-- Name: pr_operators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_operators_id_seq', 12, true);


--
-- Name: pr_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_origin_id_seq', 1, true);


--
-- Name: pr_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_parameters_id_seq', 13, true);


--
-- Name: pr_printers_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_printers_type_id_seq', 2, true);


--
-- Name: pr_promo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_promo_id_seq', 15, true);


--
-- Name: pr_promo_redeemed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_promo_redeemed_id_seq', 146, true);


--
-- Name: pr_promo_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_promo_rules_id_seq', 19, true);


--
-- Name: pr_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_rules_id_seq', 20, true);


--
-- Name: pr_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_status_id_seq', 5, true);


--
-- Name: pr_tito_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pr_tito_type_id_seq', 13, true);


--
-- Name: afip_batch_shipping_batch_log afip_batch_shipping_batch_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_batch_shipping_batch_log
    ADD CONSTRAINT afip_batch_shipping_batch_log_pkey PRIMARY KEY (id);


--
-- Name: afip_batch_shipping_batch afip_batch_shipping_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_batch_shipping_batch
    ADD CONSTRAINT afip_batch_shipping_batch_pkey PRIMARY KEY (id);


--
-- Name: afip_certificate afip_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_certificate
    ADD CONSTRAINT afip_certificate_pkey PRIMARY KEY (id);


--
-- Name: afip_cuits afip_cuits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_cuits
    ADD CONSTRAINT afip_cuits_pkey PRIMARY KEY (id);


--
-- Name: afip_egm_blocked afip_egm_blocked_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_blocked
    ADD CONSTRAINT afip_egm_blocked_pkey PRIMARY KEY (id);


--
-- Name: afip_egm_ship_counters_log afip_egm_ship_counters_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_ship_counters_log
    ADD CONSTRAINT afip_egm_ship_counters_log_pkey PRIMARY KEY (id);


--
-- Name: afip_egm_ship_counters afip_egm_ship_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_ship_counters
    ADD CONSTRAINT afip_egm_ship_counters_pkey PRIMARY KEY (id);


--
-- Name: afip_egm_shipping_egm_log afip_egm_shipping_egm_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm_log
    ADD CONSTRAINT afip_egm_shipping_egm_log_pkey PRIMARY KEY (id);


--
-- Name: afip_egm_shipping_egm afip_egm_shipping_egm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm
    ADD CONSTRAINT afip_egm_shipping_egm_pkey PRIMARY KEY (id);


--
-- Name: afip_errors afip_errors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_errors
    ADD CONSTRAINT afip_errors_pkey PRIMARY KEY (id);


--
-- Name: afip_explotation_points afip_explotation_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_explotation_points
    ADD CONSTRAINT afip_explotation_points_pkey PRIMARY KEY (id);


--
-- Name: afip_explotation_points_servers afip_explotation_points_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_explotation_points_servers
    ADD CONSTRAINT afip_explotation_points_servers_pkey PRIMARY KEY (explotationpoint_id, server_id);


--
-- Name: afip_handler_shipping_batch afip_handler_shipping_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_batch
    ADD CONSTRAINT afip_handler_shipping_batch_pkey PRIMARY KEY (id);


--
-- Name: afip_handler_shipping_egm_log afip_handler_shipping_egm_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm_log
    ADD CONSTRAINT afip_handler_shipping_egm_log_pkey PRIMARY KEY (id);


--
-- Name: afip_handler_shipping_egm afip_handler_shipping_egm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm
    ADD CONSTRAINT afip_handler_shipping_egm_pkey PRIMARY KEY (id);


--
-- Name: afip_handler_shipping_table_bingo_data afip_handler_shipping_table_bingo_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table_bingo_data
    ADD CONSTRAINT afip_handler_shipping_table_bingo_data_pkey PRIMARY KEY (id);


--
-- Name: afip_handler_shipping_table_bingo afip_handler_shipping_table_bingo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table_bingo
    ADD CONSTRAINT afip_handler_shipping_table_bingo_pkey PRIMARY KEY (id);


--
-- Name: afip_handler_shipping_table afip_handler_shipping_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table
    ADD CONSTRAINT afip_handler_shipping_table_pkey PRIMARY KEY (id);


--
-- Name: afip_operations_types afip_operations_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_operations_types
    ADD CONSTRAINT afip_operations_types_pkey PRIMARY KEY (id);


--
-- Name: afip_servers afip_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_servers
    ADD CONSTRAINT afip_servers_pkey PRIMARY KEY (id);


--
-- Name: afip_servers_types afip_servers_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_servers_types
    ADD CONSTRAINT afip_servers_types_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_errors_batch afip_shipping_errors_batch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_batch
    ADD CONSTRAINT afip_shipping_errors_batch_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_errors_bingo_data afip_shipping_errors_bingo_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_bingo_data
    ADD CONSTRAINT afip_shipping_errors_bingo_data_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_errors_egm_log afip_shipping_errors_egm_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm_log
    ADD CONSTRAINT afip_shipping_errors_egm_log_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_errors_egm afip_shipping_errors_egm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm
    ADD CONSTRAINT afip_shipping_errors_egm_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_state afip_shipping_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_state
    ADD CONSTRAINT afip_shipping_state_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_state_types afip_shipping_state_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_state_types
    ADD CONSTRAINT afip_shipping_state_types_pkey PRIMARY KEY (id);


--
-- Name: afip_shipping_states_types afip_shipping_states_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_states_types
    ADD CONSTRAINT afip_shipping_states_types_pkey PRIMARY KEY (shippingstate_id, shippingstatetype_id);


--
-- Name: afip_table_shipping_table afip_table_shipping_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_table_shipping_table
    ADD CONSTRAINT afip_table_shipping_table_pkey PRIMARY KEY (id);


--
-- Name: afip_ve_comms afip_ve_comms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_comms
    ADD CONSTRAINT afip_ve_comms_pkey PRIMARY KEY (id);


--
-- Name: afip_ve_machine afip_ve_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_machine
    ADD CONSTRAINT afip_ve_machine_pkey PRIMARY KEY (id);


--
-- Name: cr_authentication_error_log cr_authentication_error_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_authentication_error_log
    ADD CONSTRAINT cr_authentication_error_log_pkey PRIMARY KEY (id);


--
-- Name: cr_floor cr_floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_floor
    ADD CONSTRAINT cr_floor_pkey PRIMARY KEY (id);


--
-- Name: cr_global_parameter_category cr_global_parameter_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_parameter_category
    ADD CONSTRAINT cr_global_parameter_category_pkey PRIMARY KEY (id);


--
-- Name: cr_global_parameter cr_global_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_parameter
    ADD CONSTRAINT cr_global_parameter_pkey PRIMARY KEY (id);


--
-- Name: cr_global_parameter_value cr_global_parameter_value_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_parameter_value
    ADD CONSTRAINT cr_global_parameter_value_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_boolean cr_global_paramval_boolean_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_boolean
    ADD CONSTRAINT cr_global_paramval_boolean_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_date cr_global_paramval_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_date
    ADD CONSTRAINT cr_global_paramval_date_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_datetime cr_global_paramval_datetime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_datetime
    ADD CONSTRAINT cr_global_paramval_datetime_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_decimal cr_global_paramval_decimal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_decimal
    ADD CONSTRAINT cr_global_paramval_decimal_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_integer cr_global_paramval_integer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_integer
    ADD CONSTRAINT cr_global_paramval_integer_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_options cr_global_paramval_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_options
    ADD CONSTRAINT cr_global_paramval_options_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_string cr_global_paramval_string_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_string
    ADD CONSTRAINT cr_global_paramval_string_pkey PRIMARY KEY (id);


--
-- Name: cr_global_paramval_time cr_global_paramval_time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_time
    ADD CONSTRAINT cr_global_paramval_time_pkey PRIMARY KEY (id);


--
-- Name: cr_locked_user_log cr_locked_user_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_locked_user_log
    ADD CONSTRAINT cr_locked_user_log_pkey PRIMARY KEY (id);


--
-- Name: cr_owner cr_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_owner
    ADD CONSTRAINT cr_owner_pkey PRIMARY KEY (id);


--
-- Name: cr_password_log cr_password_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_password_log
    ADD CONSTRAINT cr_password_log_pkey PRIMARY KEY (id);


--
-- Name: cr_session_log cr_session_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_session_log
    ADD CONSTRAINT cr_session_log_pkey PRIMARY KEY (id);


--
-- Name: cr_user_access cr_user_access_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_access
    ADD CONSTRAINT cr_user_access_pkey PRIMARY KEY (id);


--
-- Name: cr_user cr_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user
    ADD CONSTRAINT cr_user_pkey PRIMARY KEY (id);


--
-- Name: cr_user_profile cr_user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_profile
    ADD CONSTRAINT cr_user_profile_pkey PRIMARY KEY (id);


--
-- Name: cr_user_user_profile cr_user_user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_user_profile
    ADD CONSTRAINT cr_user_user_profile_pkey PRIMARY KEY (id);


--
-- Name: cr_users_floor cr_users_floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_users_floor
    ADD CONSTRAINT cr_users_floor_pkey PRIMARY KEY (user_id, floor_id);


--
-- Name: migrations_versions migrations_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY migrations_versions
    ADD CONSTRAINT migrations_versions_pkey PRIMARY KEY (version);


--
-- Name: pr_areas pr_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_areas
    ADD CONSTRAINT pr_areas_pkey PRIMARY KEY (id);


--
-- Name: pr_game_session_members pr_game_session_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_game_session_members
    ADD CONSTRAINT pr_game_session_members_pkey PRIMARY KEY (id);


--
-- Name: pr_item_generated pr_item_generated_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_generated
    ADD CONSTRAINT pr_item_generated_pkey PRIMARY KEY (id);


--
-- Name: pr_item pr_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item
    ADD CONSTRAINT pr_item_pkey PRIMARY KEY (id);


--
-- Name: pr_item_tito_generated pr_item_tito_generated_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito_generated
    ADD CONSTRAINT pr_item_tito_generated_pkey PRIMARY KEY (id);


--
-- Name: pr_item_tito pr_item_tito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito
    ADD CONSTRAINT pr_item_tito_pkey PRIMARY KEY (id);


--
-- Name: pr_item_voucher_generated pr_item_voucher_generated_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_voucher_generated
    ADD CONSTRAINT pr_item_voucher_generated_pkey PRIMARY KEY (id);


--
-- Name: pr_item_voucher pr_item_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_voucher
    ADD CONSTRAINT pr_item_voucher_pkey PRIMARY KEY (id);


--
-- Name: pr_items_assiganted_promo pr_items_assiganted_promo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_items_assiganted_promo
    ADD CONSTRAINT pr_items_assiganted_promo_pkey PRIMARY KEY (promo_id, items_id);


--
-- Name: pr_last_update pr_last_update_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_last_update
    ADD CONSTRAINT pr_last_update_pkey PRIMARY KEY (id);


--
-- Name: pr_log_themler_change pr_log_themler_change_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_log_themler_change
    ADD CONSTRAINT pr_log_themler_change_pkey PRIMARY KEY (id);


--
-- Name: pr_member_points pr_member_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_member_points
    ADD CONSTRAINT pr_member_points_pkey PRIMARY KEY (id);


--
-- Name: pr_members_data_cvip pr_members_data_cvip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_members_data_cvip
    ADD CONSTRAINT pr_members_data_cvip_pkey PRIMARY KEY (id);


--
-- Name: pr_members pr_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_members
    ADD CONSTRAINT pr_members_pkey PRIMARY KEY (id);


--
-- Name: pr_operations pr_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operations
    ADD CONSTRAINT pr_operations_pkey PRIMARY KEY (id);


--
-- Name: pr_operators pr_operators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operators
    ADD CONSTRAINT pr_operators_pkey PRIMARY KEY (id);


--
-- Name: pr_origin pr_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_origin
    ADD CONSTRAINT pr_origin_pkey PRIMARY KEY (id);


--
-- Name: pr_parameters_operators pr_parameters_operators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_parameters_operators
    ADD CONSTRAINT pr_parameters_operators_pkey PRIMARY KEY (parameters_id, operators_id);


--
-- Name: pr_parameters pr_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_parameters
    ADD CONSTRAINT pr_parameters_pkey PRIMARY KEY (id);


--
-- Name: pr_printers_type pr_printers_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_printers_type
    ADD CONSTRAINT pr_printers_type_pkey PRIMARY KEY (id);


--
-- Name: pr_promo pr_promo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo
    ADD CONSTRAINT pr_promo_pkey PRIMARY KEY (id);


--
-- Name: pr_promo_redeemed pr_promo_redeemed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo_redeemed
    ADD CONSTRAINT pr_promo_redeemed_pkey PRIMARY KEY (id);


--
-- Name: pr_promo_rules pr_promo_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo_rules
    ADD CONSTRAINT pr_promo_rules_pkey PRIMARY KEY (id);


--
-- Name: pr_rules pr_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_rules
    ADD CONSTRAINT pr_rules_pkey PRIMARY KEY (id);


--
-- Name: pr_status pr_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_status
    ADD CONSTRAINT pr_status_pkey PRIMARY KEY (id);


--
-- Name: pr_tito_type pr_tito_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_tito_type
    ADD CONSTRAINT pr_tito_type_pkey PRIMARY KEY (id);


--
-- Name: accountingdate_ship_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accountingdate_ship_idx ON afip_handler_shipping_egm_log USING btree (accountingdate);


--
-- Name: id_ship_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX id_ship_idx ON afip_handler_shipping_egm_log USING btree (id);


--
-- Name: idx_28a42ec188bd9c1f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_28a42ec188bd9c1f ON pr_parameters_operators USING btree (parameters_id);


--
-- Name: idx_28a42ec1a8f60aef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_28a42ec1a8f60aef ON pr_parameters_operators USING btree (operators_id);


--
-- Name: idx_2c219e94a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_2c219e94a76ed395 ON cr_session_log USING btree (user_id);


--
-- Name: idx_3678c787126f525e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_3678c787126f525e ON pr_item_generated USING btree (item_id);


--
-- Name: idx_3678c787a616bb52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_3678c787a616bb52 ON pr_item_generated USING btree (promo_redeemed_id);


--
-- Name: idx_396c583f52d161a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_396c583f52d161a3 ON pr_promo USING btree (user_promo);


--
-- Name: idx_47d49ae82d1c1724; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_47d49ae82d1c1724 ON afip_batch_shipping_batch USING btree (shipping);


--
-- Name: idx_47d49ae8e25462bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_47d49ae8e25462bb ON afip_batch_shipping_batch USING btree (oper_id);


--
-- Name: idx_48d654b1d2076440; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_48d654b1d2076440 ON cr_global_parameter USING btree (parametercategory_id);


--
-- Name: idx_4a59451870e4fa78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_4a59451870e4fa78 ON pr_members_data_cvip USING btree (member);


--
-- Name: idx_5d2937b1372b4381; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5d2937b1372b4381 ON pr_operations USING btree (user_operator);


--
-- Name: idx_5d2937b13f8d6e5b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5d2937b13f8d6e5b ON pr_operations USING btree (item_generated_id);


--
-- Name: idx_5d2937b17b00651c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5d2937b17b00651c ON pr_operations USING btree (status);


--
-- Name: idx_5d2937b1a371ef7c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_5d2937b1a371ef7c ON pr_operations USING btree (operation_origin);


--
-- Name: idx_62d57b222d1c1724; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_62d57b222d1c1724 ON afip_egm_shipping_egm USING btree (shipping);


--
-- Name: idx_62d57b22a393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_62d57b22a393d2fb ON afip_egm_shipping_egm USING btree (state);


--
-- Name: idx_658659997597d3fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_658659997597d3fe ON pr_game_session_members USING btree (member_id);


--
-- Name: idx_712a30376b9dd454; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_712a30376b9dd454 ON cr_user_user_profile USING btree (user_profile_id);


--
-- Name: idx_712a3037854679e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_712a3037854679e2 ON cr_user_user_profile USING btree (floor_id);


--
-- Name: idx_712a3037a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_712a3037a76ed395 ON cr_user_user_profile USING btree (user_id);


--
-- Name: idx_87f51c0c854679e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_87f51c0c854679e2 ON cr_users_floor USING btree (floor_id);


--
-- Name: idx_87f51c0ca76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_87f51c0ca76ed395 ON cr_users_floor USING btree (user_id);


--
-- Name: idx_8821c9fb4784727d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8821c9fb4784727d ON afip_shipping_errors_bingo_data USING btree (errorcodeafip_id);


--
-- Name: idx_8821c9fb82dbb714; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8821c9fb82dbb714 ON afip_shipping_errors_bingo_data USING btree (errorcodetable_id);


--
-- Name: idx_8bb6f97a72bea47f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8bb6f97a72bea47f ON pr_item_tito USING btree (tito_type);


--
-- Name: idx_8bb6f97ad604f75c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8bb6f97ad604f75c ON pr_item_tito USING btree (area_tito);


--
-- Name: idx_8d982bd91844e6b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8d982bd91844e6b7 ON afip_explotation_points_servers USING btree (server_id);


--
-- Name: idx_8d982bd98062cb5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8d982bd98062cb5c ON afip_explotation_points_servers USING btree (explotationpoint_id);


--
-- Name: idx_8dfc7c7597d8db78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8dfc7c7597d8db78 ON afip_shipping_states_types USING btree (shippingstate_id);


--
-- Name: idx_8dfc7c75e76d81e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_8dfc7c75e76d81e2 ON afip_shipping_states_types USING btree (shippingstatetype_id);


--
-- Name: idx_9690918738834d0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9690918738834d0a ON afip_handler_shipping_table_bingo_data USING btree (id_bingo);


--
-- Name: idx_9aa1e44a7914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9aa1e44a7914a90a ON afip_handler_shipping_egm_log USING btree (explotationpoint_id);


--
-- Name: idx_9aa1e44a931bfaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9aa1e44a931bfaa ON afip_handler_shipping_egm_log USING btree (handler_ship_egm_user);


--
-- Name: idx_9aa1e44aa393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9aa1e44aa393d2fb ON afip_handler_shipping_egm_log USING btree (state);


--
-- Name: idx_9af54f327914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9af54f327914a90a ON afip_handler_shipping_egm USING btree (explotationpoint_id);


--
-- Name: idx_9af54f32931bfaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9af54f32931bfaa ON afip_handler_shipping_egm USING btree (handler_ship_egm_user);


--
-- Name: idx_9af54f32a393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9af54f32a393d2fb ON afip_handler_shipping_egm USING btree (state);


--
-- Name: idx_9eceb90b4784727d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9eceb90b4784727d ON afip_shipping_errors_egm_log USING btree (errorcodeafip_id);


--
-- Name: idx_9eceb90bdf76146b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_9eceb90bdf76146b ON afip_shipping_errors_egm_log USING btree (errorcodeegm);


--
-- Name: idx_b325fbbbce1b7c2f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b325fbbbce1b7c2f ON afip_shipping_errors_batch USING btree (shipping_id);


--
-- Name: idx_b3f20187e1cd7692; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b3f20187e1cd7692 ON pr_item USING btree (printer_type_id);


--
-- Name: idx_b82428b27597d3fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b82428b27597d3fe ON pr_promo_redeemed USING btree (member_id);


--
-- Name: idx_b82428b2d0c07aff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b82428b2d0c07aff ON pr_promo_redeemed USING btree (promo_id);


--
-- Name: idx_b96d99d67914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_b96d99d67914a90a ON afip_egm_blocked USING btree (explotationpoint_id);


--
-- Name: idx_ba3cd1a552d161a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ba3cd1a552d161a3 ON pr_log_themler_change USING btree (user_promo);


--
-- Name: idx_bae181a74784727d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bae181a74784727d ON afip_shipping_errors_egm USING btree (errorcodeafip_id);


--
-- Name: idx_bae181a7df76146b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_bae181a7df76146b ON afip_shipping_errors_egm USING btree (errorcodeegm);


--
-- Name: idx_c1abe9937914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c1abe9937914a90a ON afip_ve_comms USING btree (explotationpoint_id);


--
-- Name: idx_c1abe993a393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c1abe993a393d2fb ON afip_ve_comms USING btree (state);


--
-- Name: idx_c1abe993eefd6482; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c1abe993eefd6482 ON afip_ve_comms USING btree (cuit_adresee_id);


--
-- Name: idx_c204e09b2d1c1724; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c204e09b2d1c1724 ON afip_table_shipping_table USING btree (shipping);


--
-- Name: idx_c34f6bac7b00651c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c34f6bac7b00651c ON pr_item_voucher_generated USING btree (status);


--
-- Name: idx_c3cf4a477914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c3cf4a477914a90a ON afip_handler_shipping_batch USING btree (explotationpoint_id);


--
-- Name: idx_c3cf4a47931bfaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c3cf4a47931bfaa ON afip_handler_shipping_batch USING btree (handler_ship_egm_user);


--
-- Name: idx_c50e22227e3c61f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c50e22227e3c61f9 ON cr_floor USING btree (owner_id);


--
-- Name: idx_c77bf1b5a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c77bf1b5a76ed395 ON cr_authentication_error_log USING btree (user_id);


--
-- Name: idx_c8bf860e7b00651c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_c8bf860e7b00651c ON pr_item_tito_generated USING btree (status);


--
-- Name: idx_cb6fbf636bb0ae84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cb6fbf636bb0ae84 ON pr_items_assiganted_promo USING btree (items_id);


--
-- Name: idx_cb6fbf63d0c07aff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cb6fbf63d0c07aff ON pr_items_assiganted_promo USING btree (promo_id);


--
-- Name: idx_cded97d5458fad4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cded97d5458fad4b ON afip_handler_shipping_table USING btree (handler_ship_table_user);


--
-- Name: idx_cded97d57914a90a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cded97d57914a90a ON afip_handler_shipping_table USING btree (explotationpoint_id);


--
-- Name: idx_cded97d5a393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cded97d5a393d2fb ON afip_handler_shipping_table USING btree (state);


--
-- Name: idx_cded97d5d6060c3a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cded97d5d6060c3a ON afip_handler_shipping_table USING btree (bingo);


--
-- Name: idx_cf38a0152d1c1724; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cf38a0152d1c1724 ON afip_egm_shipping_egm_log USING btree (shipping);


--
-- Name: idx_cf38a015a393d2fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cf38a015a393d2fb ON afip_egm_shipping_egm_log USING btree (state);


--
-- Name: idx_d208c7b7854679e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d208c7b7854679e2 ON cr_password_log USING btree (floor_id);


--
-- Name: idx_d208c7b7a76ed395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_d208c7b7a76ed395 ON cr_password_log USING btree (user_id);


--
-- Name: idx_e080a6827597d3fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e080a6827597d3fe ON pr_member_points USING btree (member_id);


--
-- Name: idx_e55bf82a979110; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e55bf82a979110 ON pr_rules USING btree (parameter);


--
-- Name: idx_e55bf84ebd42c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e55bf84ebd42c7 ON pr_rules USING btree (associated_formula_id);


--
-- Name: idx_e55bf8d7a6a781; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_e55bf8d7a6a781 ON pr_rules USING btree (operator);


--
-- Name: idx_f3f29dff8abe6b4a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f3f29dff8abe6b4a ON afip_servers USING btree (servertype_id);


--
-- Name: idx_f7aff177a80c03e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f7aff177a80c03e3 ON afip_ve_machine USING btree (comm);


--
-- Name: idx_f956f6a4854679e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_f956f6a4854679e2 ON afip_explotation_points USING btree (floor_id);


--
-- Name: idx_fe79442bc51e343a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fe79442bc51e343a ON cr_locked_user_log USING btree (unlocked_user_id);


--
-- Name: idx_fe79442bf26c3531; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fe79442bf26c3531 ON cr_locked_user_log USING btree (locked_user_id);


--
-- Name: senddate_ship_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX senddate_ship_idx ON afip_handler_shipping_egm_log USING btree (senddate);


--
-- Name: uniq_22ba41ace9acc930; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_22ba41ace9acc930 ON afip_errors USING btree (errorcode);


--
-- Name: uniq_3e4cbbb5e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_3e4cbbb5e237e06 ON cr_user_profile USING btree (name);


--
-- Name: uniq_48d654b15e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_48d654b15e237e06 ON cr_global_parameter USING btree (name);


--
-- Name: uniq_48d654b1be408409; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_48d654b1be408409 ON cr_global_parameter USING btree (parametervalue_id);


--
-- Name: uniq_62d57b224d7fc3b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_62d57b224d7fc3b0 ON afip_egm_shipping_egm USING btree (firstcounter_id);


--
-- Name: uniq_62d57b22a6bd8cf8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_62d57b22a6bd8cf8 ON afip_egm_shipping_egm USING btree (lastcounter_id);


--
-- Name: uniq_774c7483f85e0677; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_774c7483f85e0677 ON cr_user USING btree (username);


--
-- Name: uniq_87dd646495a22ba1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_87dd646495a22ba1 ON afip_certificate USING btree (cuit_id);


--
-- Name: uniq_8de7cb3d5e237e06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_8de7cb3d5e237e06 ON cr_global_parameter_category USING btree (name);


--
-- Name: uniq_9f5cea563508545a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_9f5cea563508545a ON pr_members USING btree (external_socio_id);


--
-- Name: uniq_a4a7d276d0c07aff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_a4a7d276d0c07aff ON pr_promo_rules USING btree (promo_id);


--
-- Name: uniq_bdfc5e026b9dd454; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_bdfc5e026b9dd454 ON cr_user_access USING btree (user_profile_id);


--
-- Name: uniq_c50e22226de44026; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_c50e22226de44026 ON cr_floor USING btree (description);


--
-- Name: uniq_c50e222277153098; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_c50e222277153098 ON cr_floor USING btree (code);


--
-- Name: uniq_cf38a0154d7fc3b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_cf38a0154d7fc3b0 ON afip_egm_shipping_egm_log USING btree (firstcounter_id);


--
-- Name: uniq_cf38a015a6bd8cf8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_cf38a015a6bd8cf8 ON afip_egm_shipping_egm_log USING btree (lastcounter_id);


--
-- Name: uniq_f7aff1774887f3f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uniq_f7aff1774887f3f8 ON afip_ve_machine USING btree (shipping_id);


--
-- Name: cr_global_paramval_date fk_120c0c0ebf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_date
    ADD CONSTRAINT fk_120c0c0ebf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: pr_parameters_operators fk_28a42ec188bd9c1f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_parameters_operators
    ADD CONSTRAINT fk_28a42ec188bd9c1f FOREIGN KEY (parameters_id) REFERENCES pr_parameters(id) ON DELETE CASCADE;


--
-- Name: pr_parameters_operators fk_28a42ec1a8f60aef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_parameters_operators
    ADD CONSTRAINT fk_28a42ec1a8f60aef FOREIGN KEY (operators_id) REFERENCES pr_operators(id) ON DELETE CASCADE;


--
-- Name: cr_global_paramval_integer fk_2b44766fbf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_integer
    ADD CONSTRAINT fk_2b44766fbf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: cr_global_paramval_decimal fk_2bb66ef7bf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_decimal
    ADD CONSTRAINT fk_2bb66ef7bf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: cr_session_log fk_2c219e94a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_session_log
    ADD CONSTRAINT fk_2c219e94a76ed395 FOREIGN KEY (user_id) REFERENCES cr_user(id);


--
-- Name: pr_item_generated fk_3678c787126f525e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_generated
    ADD CONSTRAINT fk_3678c787126f525e FOREIGN KEY (item_id) REFERENCES pr_item(id);


--
-- Name: pr_item_generated fk_3678c787a616bb52; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_generated
    ADD CONSTRAINT fk_3678c787a616bb52 FOREIGN KEY (promo_redeemed_id) REFERENCES pr_promo_redeemed(id);


--
-- Name: pr_promo fk_396c583f52d161a3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo
    ADD CONSTRAINT fk_396c583f52d161a3 FOREIGN KEY (user_promo) REFERENCES cr_user(id);


--
-- Name: afip_batch_shipping_batch fk_47d49ae82d1c1724; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_batch_shipping_batch
    ADD CONSTRAINT fk_47d49ae82d1c1724 FOREIGN KEY (shipping) REFERENCES afip_handler_shipping_batch(id);


--
-- Name: afip_batch_shipping_batch fk_47d49ae8e25462bb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_batch_shipping_batch
    ADD CONSTRAINT fk_47d49ae8e25462bb FOREIGN KEY (oper_id) REFERENCES afip_operations_types(id);


--
-- Name: cr_global_parameter fk_48d654b1be408409; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_parameter
    ADD CONSTRAINT fk_48d654b1be408409 FOREIGN KEY (parametervalue_id) REFERENCES cr_global_parameter_value(id);


--
-- Name: cr_global_parameter fk_48d654b1d2076440; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_parameter
    ADD CONSTRAINT fk_48d654b1d2076440 FOREIGN KEY (parametercategory_id) REFERENCES cr_global_parameter_category(id);


--
-- Name: pr_members_data_cvip fk_4a59451870e4fa78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_members_data_cvip
    ADD CONSTRAINT fk_4a59451870e4fa78 FOREIGN KEY (member) REFERENCES pr_members(id);


--
-- Name: pr_operations fk_5d2937b1372b4381; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operations
    ADD CONSTRAINT fk_5d2937b1372b4381 FOREIGN KEY (user_operator) REFERENCES cr_user(id);


--
-- Name: pr_operations fk_5d2937b13f8d6e5b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operations
    ADD CONSTRAINT fk_5d2937b13f8d6e5b FOREIGN KEY (item_generated_id) REFERENCES pr_item_generated(id);


--
-- Name: pr_operations fk_5d2937b17b00651c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operations
    ADD CONSTRAINT fk_5d2937b17b00651c FOREIGN KEY (status) REFERENCES pr_status(id);


--
-- Name: pr_operations fk_5d2937b1a371ef7c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_operations
    ADD CONSTRAINT fk_5d2937b1a371ef7c FOREIGN KEY (operation_origin) REFERENCES pr_origin(id);


--
-- Name: afip_egm_shipping_egm fk_62d57b222d1c1724; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm
    ADD CONSTRAINT fk_62d57b222d1c1724 FOREIGN KEY (shipping) REFERENCES afip_handler_shipping_egm(id) ON DELETE SET NULL;


--
-- Name: afip_egm_shipping_egm fk_62d57b224d7fc3b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm
    ADD CONSTRAINT fk_62d57b224d7fc3b0 FOREIGN KEY (firstcounter_id) REFERENCES afip_egm_ship_counters(id) ON DELETE SET NULL;


--
-- Name: afip_egm_shipping_egm fk_62d57b22a393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm
    ADD CONSTRAINT fk_62d57b22a393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_egm_shipping_egm fk_62d57b22a6bd8cf8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm
    ADD CONSTRAINT fk_62d57b22a6bd8cf8 FOREIGN KEY (lastcounter_id) REFERENCES afip_egm_ship_counters(id) ON DELETE SET NULL;


--
-- Name: cr_global_paramval_string fk_64e65fedbf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_string
    ADD CONSTRAINT fk_64e65fedbf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: pr_game_session_members fk_658659997597d3fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_game_session_members
    ADD CONSTRAINT fk_658659997597d3fe FOREIGN KEY (member_id) REFERENCES pr_members(id);


--
-- Name: cr_user_user_profile fk_712a30376b9dd454; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_user_profile
    ADD CONSTRAINT fk_712a30376b9dd454 FOREIGN KEY (user_profile_id) REFERENCES cr_user_profile(id);


--
-- Name: cr_user_user_profile fk_712a3037854679e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_user_profile
    ADD CONSTRAINT fk_712a3037854679e2 FOREIGN KEY (floor_id) REFERENCES cr_floor(id);


--
-- Name: cr_user_user_profile fk_712a3037a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_user_profile
    ADD CONSTRAINT fk_712a3037a76ed395 FOREIGN KEY (user_id) REFERENCES cr_user(id);


--
-- Name: afip_certificate fk_87dd646495a22ba1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_certificate
    ADD CONSTRAINT fk_87dd646495a22ba1 FOREIGN KEY (cuit_id) REFERENCES afip_cuits(id);


--
-- Name: cr_users_floor fk_87f51c0c854679e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_users_floor
    ADD CONSTRAINT fk_87f51c0c854679e2 FOREIGN KEY (floor_id) REFERENCES cr_floor(id) ON DELETE CASCADE;


--
-- Name: cr_users_floor fk_87f51c0ca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_users_floor
    ADD CONSTRAINT fk_87f51c0ca76ed395 FOREIGN KEY (user_id) REFERENCES cr_user(id) ON DELETE CASCADE;


--
-- Name: afip_shipping_errors_bingo_data fk_8821c9fb4784727d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_bingo_data
    ADD CONSTRAINT fk_8821c9fb4784727d FOREIGN KEY (errorcodeafip_id) REFERENCES afip_errors(id);


--
-- Name: afip_shipping_errors_bingo_data fk_8821c9fb82dbb714; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_bingo_data
    ADD CONSTRAINT fk_8821c9fb82dbb714 FOREIGN KEY (errorcodetable_id) REFERENCES afip_handler_shipping_table(id);


--
-- Name: pr_item_tito fk_8bb6f97a72bea47f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito
    ADD CONSTRAINT fk_8bb6f97a72bea47f FOREIGN KEY (tito_type) REFERENCES pr_tito_type(id);


--
-- Name: pr_item_tito fk_8bb6f97abf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito
    ADD CONSTRAINT fk_8bb6f97abf396750 FOREIGN KEY (id) REFERENCES pr_item(id) ON DELETE CASCADE;


--
-- Name: pr_item_tito fk_8bb6f97ad604f75c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito
    ADD CONSTRAINT fk_8bb6f97ad604f75c FOREIGN KEY (area_tito) REFERENCES pr_areas(id);


--
-- Name: afip_explotation_points_servers fk_8d982bd91844e6b7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_explotation_points_servers
    ADD CONSTRAINT fk_8d982bd91844e6b7 FOREIGN KEY (server_id) REFERENCES afip_servers(id) ON DELETE CASCADE;


--
-- Name: afip_explotation_points_servers fk_8d982bd98062cb5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_explotation_points_servers
    ADD CONSTRAINT fk_8d982bd98062cb5c FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id) ON DELETE CASCADE;


--
-- Name: afip_shipping_states_types fk_8dfc7c7597d8db78; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_states_types
    ADD CONSTRAINT fk_8dfc7c7597d8db78 FOREIGN KEY (shippingstate_id) REFERENCES afip_shipping_state(id) ON DELETE CASCADE;


--
-- Name: afip_shipping_states_types fk_8dfc7c75e76d81e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_states_types
    ADD CONSTRAINT fk_8dfc7c75e76d81e2 FOREIGN KEY (shippingstatetype_id) REFERENCES afip_shipping_state_types(id) ON DELETE CASCADE;


--
-- Name: afip_handler_shipping_table_bingo_data fk_9690918738834d0a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table_bingo_data
    ADD CONSTRAINT fk_9690918738834d0a FOREIGN KEY (id_bingo) REFERENCES afip_handler_shipping_table_bingo(id);


--
-- Name: pr_item_voucher fk_976e0904bf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_voucher
    ADD CONSTRAINT fk_976e0904bf396750 FOREIGN KEY (id) REFERENCES pr_item(id) ON DELETE CASCADE;


--
-- Name: afip_handler_shipping_egm_log fk_9aa1e44a7914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm_log
    ADD CONSTRAINT fk_9aa1e44a7914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: afip_handler_shipping_egm_log fk_9aa1e44a931bfaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm_log
    ADD CONSTRAINT fk_9aa1e44a931bfaa FOREIGN KEY (handler_ship_egm_user) REFERENCES cr_user(id);


--
-- Name: afip_handler_shipping_egm_log fk_9aa1e44aa393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm_log
    ADD CONSTRAINT fk_9aa1e44aa393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_handler_shipping_egm fk_9af54f327914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm
    ADD CONSTRAINT fk_9af54f327914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: afip_handler_shipping_egm fk_9af54f32931bfaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm
    ADD CONSTRAINT fk_9af54f32931bfaa FOREIGN KEY (handler_ship_egm_user) REFERENCES cr_user(id);


--
-- Name: afip_handler_shipping_egm fk_9af54f32a393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_egm
    ADD CONSTRAINT fk_9af54f32a393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_shipping_errors_egm_log fk_9eceb90b4784727d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm_log
    ADD CONSTRAINT fk_9eceb90b4784727d FOREIGN KEY (errorcodeafip_id) REFERENCES afip_errors(id);


--
-- Name: afip_shipping_errors_egm_log fk_9eceb90bdf76146b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm_log
    ADD CONSTRAINT fk_9eceb90bdf76146b FOREIGN KEY (errorcodeegm) REFERENCES afip_egm_shipping_egm_log(id) ON DELETE SET NULL;


--
-- Name: cr_global_paramval_options fk_a17e27e3bf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_options
    ADD CONSTRAINT fk_a17e27e3bf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: pr_promo_rules fk_a4a7d276d0c07aff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo_rules
    ADD CONSTRAINT fk_a4a7d276d0c07aff FOREIGN KEY (promo_id) REFERENCES pr_promo(id);


--
-- Name: afip_shipping_errors_batch fk_b325fbbbce1b7c2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_batch
    ADD CONSTRAINT fk_b325fbbbce1b7c2f FOREIGN KEY (shipping_id) REFERENCES afip_handler_shipping_batch(id);


--
-- Name: pr_item fk_b3f20187e1cd7692; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item
    ADD CONSTRAINT fk_b3f20187e1cd7692 FOREIGN KEY (printer_type_id) REFERENCES pr_printers_type(id);


--
-- Name: pr_promo_redeemed fk_b82428b27597d3fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo_redeemed
    ADD CONSTRAINT fk_b82428b27597d3fe FOREIGN KEY (member_id) REFERENCES pr_members(id);


--
-- Name: pr_promo_redeemed fk_b82428b2d0c07aff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_promo_redeemed
    ADD CONSTRAINT fk_b82428b2d0c07aff FOREIGN KEY (promo_id) REFERENCES pr_promo(id);


--
-- Name: afip_egm_blocked fk_b96d99d67914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_blocked
    ADD CONSTRAINT fk_b96d99d67914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: pr_log_themler_change fk_ba3cd1a552d161a3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_log_themler_change
    ADD CONSTRAINT fk_ba3cd1a552d161a3 FOREIGN KEY (user_promo) REFERENCES cr_user(id);


--
-- Name: afip_shipping_errors_egm fk_bae181a74784727d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm
    ADD CONSTRAINT fk_bae181a74784727d FOREIGN KEY (errorcodeafip_id) REFERENCES afip_errors(id);


--
-- Name: afip_shipping_errors_egm fk_bae181a7df76146b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_shipping_errors_egm
    ADD CONSTRAINT fk_bae181a7df76146b FOREIGN KEY (errorcodeegm) REFERENCES afip_egm_shipping_egm(id) ON DELETE SET NULL;


--
-- Name: cr_user_access fk_bdfc5e026b9dd454; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_user_access
    ADD CONSTRAINT fk_bdfc5e026b9dd454 FOREIGN KEY (user_profile_id) REFERENCES cr_user_profile(id);


--
-- Name: afip_ve_comms fk_c1abe9937914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_comms
    ADD CONSTRAINT fk_c1abe9937914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: afip_ve_comms fk_c1abe993a393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_comms
    ADD CONSTRAINT fk_c1abe993a393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_ve_comms fk_c1abe993eefd6482; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_comms
    ADD CONSTRAINT fk_c1abe993eefd6482 FOREIGN KEY (cuit_adresee_id) REFERENCES afip_cuits(id);


--
-- Name: afip_table_shipping_table fk_c204e09b2d1c1724; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_table_shipping_table
    ADD CONSTRAINT fk_c204e09b2d1c1724 FOREIGN KEY (shipping) REFERENCES afip_handler_shipping_table(id);


--
-- Name: pr_item_voucher_generated fk_c34f6bac7b00651c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_voucher_generated
    ADD CONSTRAINT fk_c34f6bac7b00651c FOREIGN KEY (status) REFERENCES pr_status(id);


--
-- Name: pr_item_voucher_generated fk_c34f6bacbf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_voucher_generated
    ADD CONSTRAINT fk_c34f6bacbf396750 FOREIGN KEY (id) REFERENCES pr_item_generated(id) ON DELETE CASCADE;


--
-- Name: afip_handler_shipping_batch fk_c3cf4a477914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_batch
    ADD CONSTRAINT fk_c3cf4a477914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: afip_handler_shipping_batch fk_c3cf4a47931bfaa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_batch
    ADD CONSTRAINT fk_c3cf4a47931bfaa FOREIGN KEY (handler_ship_egm_user) REFERENCES cr_user(id);


--
-- Name: cr_floor fk_c50e22227e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_floor
    ADD CONSTRAINT fk_c50e22227e3c61f9 FOREIGN KEY (owner_id) REFERENCES cr_owner(id);


--
-- Name: cr_authentication_error_log fk_c77bf1b5a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_authentication_error_log
    ADD CONSTRAINT fk_c77bf1b5a76ed395 FOREIGN KEY (user_id) REFERENCES cr_user(id);


--
-- Name: pr_item_tito_generated fk_c8bf860e7b00651c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito_generated
    ADD CONSTRAINT fk_c8bf860e7b00651c FOREIGN KEY (status) REFERENCES pr_status(id);


--
-- Name: pr_item_tito_generated fk_c8bf860ebf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_item_tito_generated
    ADD CONSTRAINT fk_c8bf860ebf396750 FOREIGN KEY (id) REFERENCES pr_item_generated(id) ON DELETE CASCADE;


--
-- Name: pr_items_assiganted_promo fk_cb6fbf636bb0ae84; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_items_assiganted_promo
    ADD CONSTRAINT fk_cb6fbf636bb0ae84 FOREIGN KEY (items_id) REFERENCES pr_item(id) ON DELETE CASCADE;


--
-- Name: pr_items_assiganted_promo fk_cb6fbf63d0c07aff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_items_assiganted_promo
    ADD CONSTRAINT fk_cb6fbf63d0c07aff FOREIGN KEY (promo_id) REFERENCES pr_promo(id) ON DELETE CASCADE;


--
-- Name: afip_handler_shipping_table fk_cded97d5458fad4b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table
    ADD CONSTRAINT fk_cded97d5458fad4b FOREIGN KEY (handler_ship_table_user) REFERENCES cr_user(id);


--
-- Name: afip_handler_shipping_table fk_cded97d57914a90a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table
    ADD CONSTRAINT fk_cded97d57914a90a FOREIGN KEY (explotationpoint_id) REFERENCES afip_explotation_points(id);


--
-- Name: afip_handler_shipping_table fk_cded97d5a393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table
    ADD CONSTRAINT fk_cded97d5a393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_handler_shipping_table fk_cded97d5d6060c3a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_handler_shipping_table
    ADD CONSTRAINT fk_cded97d5d6060c3a FOREIGN KEY (bingo) REFERENCES afip_handler_shipping_table_bingo(id);


--
-- Name: afip_egm_shipping_egm_log fk_cf38a0152d1c1724; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm_log
    ADD CONSTRAINT fk_cf38a0152d1c1724 FOREIGN KEY (shipping) REFERENCES afip_handler_shipping_egm_log(id) ON DELETE SET NULL;


--
-- Name: afip_egm_shipping_egm_log fk_cf38a0154d7fc3b0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm_log
    ADD CONSTRAINT fk_cf38a0154d7fc3b0 FOREIGN KEY (firstcounter_id) REFERENCES afip_egm_ship_counters_log(id) ON DELETE SET NULL;


--
-- Name: afip_egm_shipping_egm_log fk_cf38a015a393d2fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm_log
    ADD CONSTRAINT fk_cf38a015a393d2fb FOREIGN KEY (state) REFERENCES afip_shipping_state(id);


--
-- Name: afip_egm_shipping_egm_log fk_cf38a015a6bd8cf8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_egm_shipping_egm_log
    ADD CONSTRAINT fk_cf38a015a6bd8cf8 FOREIGN KEY (lastcounter_id) REFERENCES afip_egm_ship_counters_log(id) ON DELETE SET NULL;


--
-- Name: cr_password_log fk_d208c7b7854679e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_password_log
    ADD CONSTRAINT fk_d208c7b7854679e2 FOREIGN KEY (floor_id) REFERENCES cr_floor(id);


--
-- Name: cr_password_log fk_d208c7b7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_password_log
    ADD CONSTRAINT fk_d208c7b7a76ed395 FOREIGN KEY (user_id) REFERENCES cr_user(id) ON DELETE CASCADE;


--
-- Name: cr_global_paramval_time fk_d706a331bf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_time
    ADD CONSTRAINT fk_d706a331bf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: cr_global_paramval_datetime fk_d95d2856bf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_datetime
    ADD CONSTRAINT fk_d95d2856bf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: pr_member_points fk_e080a6827597d3fe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_member_points
    ADD CONSTRAINT fk_e080a6827597d3fe FOREIGN KEY (member_id) REFERENCES pr_members(id);


--
-- Name: pr_rules fk_e55bf82a979110; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_rules
    ADD CONSTRAINT fk_e55bf82a979110 FOREIGN KEY (parameter) REFERENCES pr_parameters(id);


--
-- Name: pr_rules fk_e55bf84ebd42c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_rules
    ADD CONSTRAINT fk_e55bf84ebd42c7 FOREIGN KEY (associated_formula_id) REFERENCES pr_promo_rules(id);


--
-- Name: pr_rules fk_e55bf8d7a6a781; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pr_rules
    ADD CONSTRAINT fk_e55bf8d7a6a781 FOREIGN KEY (operator) REFERENCES pr_operators(id);


--
-- Name: afip_servers fk_f3f29dff8abe6b4a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_servers
    ADD CONSTRAINT fk_f3f29dff8abe6b4a FOREIGN KEY (servertype_id) REFERENCES afip_servers_types(id);


--
-- Name: afip_ve_machine fk_f7aff1774887f3f8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_machine
    ADD CONSTRAINT fk_f7aff1774887f3f8 FOREIGN KEY (shipping_id) REFERENCES afip_handler_shipping_egm(id);


--
-- Name: afip_ve_machine fk_f7aff177a80c03e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_ve_machine
    ADD CONSTRAINT fk_f7aff177a80c03e3 FOREIGN KEY (comm) REFERENCES afip_ve_comms(id);


--
-- Name: afip_explotation_points fk_f956f6a4854679e2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY afip_explotation_points
    ADD CONSTRAINT fk_f956f6a4854679e2 FOREIGN KEY (floor_id) REFERENCES cr_floor(id);


--
-- Name: cr_global_paramval_boolean fk_fbce550cbf396750; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_global_paramval_boolean
    ADD CONSTRAINT fk_fbce550cbf396750 FOREIGN KEY (id) REFERENCES cr_global_parameter_value(id) ON DELETE CASCADE;


--
-- Name: cr_locked_user_log fk_fe79442bc51e343a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_locked_user_log
    ADD CONSTRAINT fk_fe79442bc51e343a FOREIGN KEY (unlocked_user_id) REFERENCES cr_user(id);


--
-- Name: cr_locked_user_log fk_fe79442bf26c3531; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cr_locked_user_log
    ADD CONSTRAINT fk_fe79442bf26c3531 FOREIGN KEY (locked_user_id) REFERENCES cr_user(id);


--
-- PostgreSQL database dump complete
--

