--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

-- Started on 2019-05-03 15:28:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 20516)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 20861)
-- Name: archivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archivos (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    cargado_por character varying(500) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.archivos OWNER TO postgres;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE archivos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.archivos IS 'Almacena los archivos subidos al sistema';


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN archivos.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.archivos.id IS 'Identificador y llave primaria del archivo';


--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN archivos.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.archivos.nombre IS 'Nombre del archivo';


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN archivos.cargado_por; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.archivos.cargado_por IS 'Usuario del sistema quien carga el archivo';


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN archivos.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.archivos.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 209
-- Name: COLUMN archivos.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.archivos.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 208 (class 1259 OID 20859)
-- Name: archivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.archivos_id_seq OWNER TO postgres;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 208
-- Name: archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archivos_id_seq OWNED BY public.archivos.id;


--
-- TOC entry 205 (class 1259 OID 20825)
-- Name: cohortes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cohortes (
    id integer NOT NULL,
    programa_id integer NOT NULL,
    codigo character varying(5) NOT NULL,
    nombre character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.cohortes OWNER TO postgres;

--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE cohortes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.cohortes IS 'Almacena los cohortes';


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.id IS 'Indentificador y llave primaria del cohorte';


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.programa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.programa_id IS 'Relación al programa académico';


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.codigo IS 'Código del cohorte';


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.nombre IS 'Nombre para mostrar del cohorte';


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3011 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 3012 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN cohortes.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cohortes.deleted_at IS 'Fecha y hora de eliminación (eliminación lógica)';


--
-- TOC entry 204 (class 1259 OID 20823)
-- Name: cohortes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cohortes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cohortes_id_seq OWNER TO postgres;

--
-- TOC entry 3013 (class 0 OID 0)
-- Dependencies: 204
-- Name: cohortes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cohortes_id_seq OWNED BY public.cohortes.id;


--
-- TOC entry 207 (class 1259 OID 20838)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id integer NOT NULL,
    programa_id integer NOT NULL,
    cohorte_id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    nombre character varying(500) NOT NULL,
    identificacion character varying(100) NOT NULL,
    email character varying(500),
    movil character varying(20),
    estado character varying(50) DEFAULT 'Matriculado'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE estudiantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.estudiantes IS 'Almacena los estudiantes';


--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.id IS 'Identificador y llave primaria del estudiante';


--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.programa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.programa_id IS 'Relación al programa académico';


--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.cohorte_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.cohorte_id IS 'Relación al cohorte';


--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.codigo IS 'Código del estudiante';


--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.nombre IS 'Nombre del estudiante';


--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.identificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.identificacion IS 'Identificación del estudiante';


--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.email IS 'Correo electrónico del estudiante';


--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.movil; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.movil IS 'Teléfono movil del estudiante';


--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.estado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.estado IS 'Estado del estudiante';


--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 207
-- Name: COLUMN estudiantes.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.estudiantes.deleted_at IS 'Fecha y hora de eliminación (eliminación lógica)';


--
-- TOC entry 206 (class 1259 OID 20836)
-- Name: estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estudiantes_id_seq OWNER TO postgres;

--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 206
-- Name: estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_seq OWNED BY public.estudiantes.id;


--
-- TOC entry 201 (class 1259 OID 20799)
-- Name: facultades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultades (
    id integer NOT NULL,
    codigo character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    esta_activa boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.facultades OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE facultades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.facultades IS 'Almacena las facultades';


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.id IS 'Identificador y llave primaria';


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.codigo IS 'Código de la facultad';


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.nombre IS 'Nombre de la facultad';


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.esta_activa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.esta_activa IS 'Bandera que indica si la facultad se encuentra activa o no';


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN facultades.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.facultades.deleted_at IS 'Fecha y hora de eliminación (eliminación lógica)';


--
-- TOC entry 200 (class 1259 OID 20797)
-- Name: facultades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facultades_id_seq OWNER TO postgres;

--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 200
-- Name: facultades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultades_id_seq OWNED BY public.facultades.id;


--
-- TOC entry 197 (class 1259 OID 20635)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email public.citext NOT NULL,
    token character varying(500),
    created_at timestamp without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20808)
-- Name: programas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programas (
    id integer NOT NULL,
    facultad_id integer NOT NULL,
    codigo character varying(100) NOT NULL,
    nombre character varying(500) NOT NULL,
    esta_activo boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.programas OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE programas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.programas IS 'Almacena los programas por facultad';


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.id IS 'Identificador y llave priaria del progragrama académico';


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.facultad_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.facultad_id IS 'Facultad a la que pertenece el programa académico';


--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.codigo IS 'Código del programa académico';


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.nombre IS 'Nombre del programa académico';


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.esta_activo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.esta_activo IS 'Bandera que indica si el programa si encuentra activo o no';


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN programas.deleted_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.programas.deleted_at IS 'Fecha y hora de eliminación (eliminación lógica)';


--
-- TOC entry 202 (class 1259 OID 20806)
-- Name: programas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programas_id_seq OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 202
-- Name: programas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programas_id_seq OWNED BY public.programas.id;


--
-- TOC entry 211 (class 1259 OID 20872)
-- Name: registros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registros (
    id integer NOT NULL,
    archivo_id integer NOT NULL,
    cohorte_id integer NOT NULL,
    programa_id integer NOT NULL,
    estudiante_id integer NOT NULL,
    codigo character varying(20) NOT NULL,
    identificacion character varying(100) NOT NULL,
    nombre character varying(500) NOT NULL,
    email character varying(500),
    movil character varying(100),
    altura_semestral integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.registros OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.registros IS 'Armacena los registros subidos al sistema';


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.id IS 'Identificador y llave primaria del registro';


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.archivo_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.archivo_id IS 'Id del archivo dónde fue cargado';


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.cohorte_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.cohorte_id IS 'Id del cohorte';


--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.programa_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.programa_id IS 'Id del programa académico';


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.estudiante_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.estudiante_id IS 'Id del estudiante';


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.codigo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.codigo IS 'Código del estudiante';


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.identificacion; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.identificacion IS 'Número de identificación del estudiante';


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.nombre; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.nombre IS 'Nombre del estudiante';


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.email IS 'Correo electrónico del estudiante';


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.movil; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.movil IS 'Teléfono movil del estudiante';


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.altura_semestral; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.altura_semestral IS 'El semestre en el cual se encuentra el estudiante';


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.created_at IS 'Fecha y hora de creación';


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 211
-- Name: COLUMN registros.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registros.updated_at IS 'Fecha y hora de la última actualización';


--
-- TOC entry 210 (class 1259 OID 20870)
-- Name: registros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registros_id_seq OWNER TO postgres;

--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 210
-- Name: registros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registros_id_seq OWNED BY public.registros.id;


--
-- TOC entry 198 (class 1259 OID 20641)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name public.citext NOT NULL,
    email public.citext NOT NULL,
    email_verified_at timestamp without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(500),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20647)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2829 (class 2604 OID 20864)
-- Name: archivos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos ALTER COLUMN id SET DEFAULT nextval('public.archivos_id_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 20828)
-- Name: cohortes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes ALTER COLUMN id SET DEFAULT nextval('public.cohortes_id_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 20841)
-- Name: estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id SET DEFAULT nextval('public.estudiantes_id_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 20802)
-- Name: facultades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultades ALTER COLUMN id SET DEFAULT nextval('public.facultades_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 20811)
-- Name: programas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas ALTER COLUMN id SET DEFAULT nextval('public.programas_id_seq'::regclass);


--
-- TOC entry 2830 (class 2604 OID 20875)
-- Name: registros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros ALTER COLUMN id SET DEFAULT nextval('public.registros_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 20651)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2989 (class 0 OID 20861)
-- Dependencies: 209
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2985 (class 0 OID 20825)
-- Dependencies: 205
-- Data for Name: cohortes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2987 (class 0 OID 20838)
-- Dependencies: 207
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2981 (class 0 OID 20799)
-- Dependencies: 201
-- Data for Name: facultades; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2977 (class 0 OID 20635)
-- Dependencies: 197
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2983 (class 0 OID 20808)
-- Dependencies: 203
-- Data for Name: programas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2991 (class 0 OID 20872)
-- Dependencies: 211
-- Data for Name: registros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2978 (class 0 OID 20641)
-- Dependencies: 198
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (2, 'Jhonny Montoya', 'jhonnyf-montoyat@unilibre.edu.co', NULL, '$2y$10$dLAFFeCwr.0tNbrZCL9VNuMiifI3sXwe/e/UN.YC96YfGCHwOfl8e', NULL, '2019-03-17 15:34:49', '2019-03-17 15:34:49', NULL);
INSERT INTO public.users VALUES (3, 'Fabian Blanco', 'fabian.blancog@unilibre.edu.co', NULL, '$2y$10$yS7dkay1ZepdVpnA1llN0Ogmg2KmC/KosK2ICv9jWb/.oLXdB42CW', NULL, '2019-03-18 16:59:50', '2019-03-18 16:59:50', NULL);
INSERT INTO public.users VALUES (4, 'Mauricio Alonso', 'mauricio.alonso@unilibre.edu.co', NULL, '$2y$10$UxX7krF7JYS9hDzml242wur93Q/0WK45x1rBjDPuW6xKaQi5sMVY6', NULL, '2019-03-18 17:00:43', '2019-03-18 17:00:43', NULL);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 208
-- Name: archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archivos_id_seq', 1, false);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 204
-- Name: cohortes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cohortes_id_seq', 1, false);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 206
-- Name: estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 200
-- Name: facultades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultades_id_seq', 1, false);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 202
-- Name: programas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programas_id_seq', 1, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 210
-- Name: registros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registros_id_seq', 1, false);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 199
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 2845 (class 2606 OID 20869)
-- Name: archivos pk_archivos_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT pk_archivos_id PRIMARY KEY (id);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 2845
-- Name: CONSTRAINT pk_archivos_id ON archivos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_archivos_id ON public.archivos IS 'Llave primaria';


--
-- TOC entry 2841 (class 2606 OID 20830)
-- Name: cohortes pk_cohortes_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT pk_cohortes_id PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 20805)
-- Name: facultades pk_facultades_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultades
    ADD CONSTRAINT pk_facultades_id PRIMARY KEY (id);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 2837
-- Name: CONSTRAINT pk_facultades_id ON facultades; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_facultades_id ON public.facultades IS 'Llave primaria';


--
-- TOC entry 2843 (class 2606 OID 20847)
-- Name: estudiantes pk_programa_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT pk_programa_id PRIMARY KEY (id);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 2843
-- Name: CONSTRAINT pk_programa_id ON estudiantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_programa_id ON public.estudiantes IS 'Llave primaria';


--
-- TOC entry 2839 (class 2606 OID 20817)
-- Name: programas pk_programas_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT pk_programas_id PRIMARY KEY (id);


--
-- TOC entry 3073 (class 0 OID 0)
-- Dependencies: 2839
-- Name: CONSTRAINT pk_programas_id ON programas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_programas_id ON public.programas IS 'Llave primaria del programa académico';


--
-- TOC entry 2847 (class 2606 OID 20880)
-- Name: registros pk_registros_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT pk_registros_id PRIMARY KEY (id);


--
-- TOC entry 3074 (class 0 OID 0)
-- Dependencies: 2847
-- Name: CONSTRAINT pk_registros_id ON registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT pk_registros_id ON public.registros IS 'Llave primaria';


--
-- TOC entry 2833 (class 2606 OID 20657)
-- Name: users pk_users_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_users_id PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 20659)
-- Name: users uq_users_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uq_users_email UNIQUE (email);


--
-- TOC entry 2831 (class 1259 OID 20660)
-- Name: idx_pr_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pr_email ON public.password_resets USING btree (email);


--
-- TOC entry 2855 (class 2606 OID 20901)
-- Name: registros fk_archivos_registros_archivoId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT "fk_archivos_registros_archivoId" FOREIGN KEY (archivo_id) REFERENCES public.archivos(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3075 (class 0 OID 0)
-- Dependencies: 2855
-- Name: CONSTRAINT "fk_archivos_registros_archivoId" ON registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_archivos_registros_archivoId" ON public.registros IS 'Relación a archivos';


--
-- TOC entry 2851 (class 2606 OID 20853)
-- Name: estudiantes fk_cohortes_estudiantes_cohorteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT "fk_cohortes_estudiantes_cohorteId" FOREIGN KEY (cohorte_id) REFERENCES public.cohortes(id) ON UPDATE CASCADE;


--
-- TOC entry 3076 (class 0 OID 0)
-- Dependencies: 2851
-- Name: CONSTRAINT "fk_cohortes_estudiantes_cohorteId" ON estudiantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_cohortes_estudiantes_cohorteId" ON public.estudiantes IS 'Relación a los cohortes';


--
-- TOC entry 2852 (class 2606 OID 20886)
-- Name: registros fk_cohortes_registros_cohorteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT "fk_cohortes_registros_cohorteId" FOREIGN KEY (cohorte_id) REFERENCES public.cohortes(id) ON UPDATE CASCADE;


--
-- TOC entry 3077 (class 0 OID 0)
-- Dependencies: 2852
-- Name: CONSTRAINT "fk_cohortes_registros_cohorteId" ON registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_cohortes_registros_cohorteId" ON public.registros IS 'Relación a cohortes';


--
-- TOC entry 2854 (class 2606 OID 20896)
-- Name: registros fk_estudiantes_registros_estudianteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT "fk_estudiantes_registros_estudianteId" FOREIGN KEY (estudiante_id) REFERENCES public.estudiantes(id) ON UPDATE CASCADE;


--
-- TOC entry 3078 (class 0 OID 0)
-- Dependencies: 2854
-- Name: CONSTRAINT "fk_estudiantes_registros_estudianteId" ON registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_estudiantes_registros_estudianteId" ON public.registros IS 'Relación a estudiantes';


--
-- TOC entry 2848 (class 2606 OID 20818)
-- Name: programas fk_facultades_programas_facultadId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programas
    ADD CONSTRAINT "fk_facultades_programas_facultadId" FOREIGN KEY (facultad_id) REFERENCES public.facultades(id) ON UPDATE CASCADE;


--
-- TOC entry 3079 (class 0 OID 0)
-- Dependencies: 2848
-- Name: CONSTRAINT "fk_facultades_programas_facultadId" ON programas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_facultades_programas_facultadId" ON public.programas IS 'Relación a la factultad';


--
-- TOC entry 2849 (class 2606 OID 20831)
-- Name: cohortes fk_programas_cohortes_programaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cohortes
    ADD CONSTRAINT "fk_programas_cohortes_programaId" FOREIGN KEY (programa_id) REFERENCES public.programas(id) ON UPDATE CASCADE;


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 2849
-- Name: CONSTRAINT "fk_programas_cohortes_programaId" ON cohortes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_programas_cohortes_programaId" ON public.cohortes IS 'Relación a programas';


--
-- TOC entry 2850 (class 2606 OID 20848)
-- Name: estudiantes fk_programas_estudiantes_programaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT "fk_programas_estudiantes_programaId" FOREIGN KEY (programa_id) REFERENCES public.programas(id) ON UPDATE CASCADE;


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 2850
-- Name: CONSTRAINT "fk_programas_estudiantes_programaId" ON estudiantes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_programas_estudiantes_programaId" ON public.estudiantes IS 'Relación al programa';


--
-- TOC entry 2853 (class 2606 OID 20891)
-- Name: registros fk_programas_registros_programaId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registros
    ADD CONSTRAINT "fk_programas_registros_programaId" FOREIGN KEY (programa_id) REFERENCES public.programas(id) ON UPDATE CASCADE;


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 2853
-- Name: CONSTRAINT "fk_programas_registros_programaId" ON registros; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "fk_programas_registros_programaId" ON public.registros IS 'Relación a programas académicos';


-- Completed on 2019-05-03 15:28:48

--
-- PostgreSQL database dump complete
--

