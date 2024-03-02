--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(70) NOT NULL,
    galaxy_type_id integer NOT NULL,
    size_kpc numeric(5,2) NOT NULL,
    size_stars_bills integer NOT NULL,
    constellation_name text,
    distance_to_earth_ly integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    rarity numeric(4,2) NOT NULL,
    groups character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(90) NOT NULL,
    planet_type_id integer NOT NULL,
    radius_km integer NOT NULL,
    mass_t double precision NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(90) NOT NULL,
    planet_type_id integer NOT NULL,
    radius_km integer NOT NULL,
    mass_t double precision NOT NULL,
    star_id integer,
    population_int_mill integer DEFAULT 0 NOT NULL,
    temperature_min_c integer DEFAULT '-257'::integer NOT NULL,
    temperature_max_c integer DEFAULT 1000 NOT NULL,
    extra_info text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_sphere boolean DEFAULT true NOT NULL,
    is_artificial boolean DEFAULT false NOT NULL,
    is_habitable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(70) NOT NULL,
    type character varying(10) NOT NULL,
    galaxy_id integer NOT NULL,
    radius_rsol numeric(12,5) NOT NULL,
    mass_msol numeric(12,5) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 26.80, 300, 'Sagittarius', 25881);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 46.56, 1000, 'Andromeda', 2498288);
INSERT INTO public.galaxy VALUES (3, 'Messier 49', 3, 47.81, 1100, 'Virgo', 55861738);
INSERT INTO public.galaxy VALUES (4, 'Hoag s Object', 6, 37.09, 8, 'Serpens Caput', 612380561);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 7, 51.91, 1050, 'Ursa Major', 20885694);
INSERT INTO public.galaxy VALUES (6, 'Antennae', 8, 149.50, 1900, 'Corvus', 54962354);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 3, 40.55, 2900, 'Virgo', 53463381);
INSERT INTO public.galaxy VALUES (8, 'Sculptor', 2, 27.59, 230, 'Sculptor', 11392197);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 13.80, 'S0');
INSERT INTO public.galaxy_type VALUES (1, 'Barred Spiral', 44.55, 'S0B-SB-SAB');
INSERT INTO public.galaxy_type VALUES (2, 'Spiral', 15.45, 'S0A-SA-SAB');
INSERT INTO public.galaxy_type VALUES (3, 'Elliptical', 10.39, 'E0-E7');
INSERT INTO public.galaxy_type VALUES (6, 'Ring', 0.96, 'R-RS');
INSERT INTO public.galaxy_type VALUES (7, 'Intermediate Spiral', 6.40, 'SAB');
INSERT INTO public.galaxy_type VALUES (8, 'Other', 4.20, '-');
INSERT INTO public.galaxy_type VALUES (5, 'Irregular', 4.25, 'Irr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1734, 7.348e+19, 1);
INSERT INTO public.moon VALUES (2, 'Mimas', 1, 198, 3.75094e+16, 7);
INSERT INTO public.moon VALUES (4, 'Rhea', 1, 756, 2.3e+18, 7);
INSERT INTO public.moon VALUES (3, 'Dione', 1, 560, 1.1e+18, 7);
INSERT INTO public.moon VALUES (5, 'Titan', 14, 2594, 1.35e+20, 7);
INSERT INTO public.moon VALUES (6, 'Iapetus', 1, 735, 1.8e+18, 7);
INSERT INTO public.moon VALUES (7, 'Ganymede', 1, 2635, 1.4819e+20, 6);
INSERT INTO public.moon VALUES (8, 'Callisto', 1, 2410, 1.0759e+20, 6);
INSERT INTO public.moon VALUES (9, 'Io', 1, 1825, 8.93e+19, 6);
INSERT INTO public.moon VALUES (10, 'Europa', 14, 1561, 4.79e+19, 6);
INSERT INTO public.moon VALUES (11, 'Amalthea', 1, 83, 2.08e+15, 6);
INSERT INTO public.moon VALUES (12, 'Himalia', 1, 68, 4.21e+15, 6);
INSERT INTO public.moon VALUES (13, 'Thebe', 1, 49, 430000000000000, 6);
INSERT INTO public.moon VALUES (14, 'Phobos', 1, 11, 10659000000000, 2);
INSERT INTO public.moon VALUES (15, 'Deimos', 1, 6, 1476200000000, 2);
INSERT INTO public.moon VALUES (16, 'Triton', 14, 1350, 2.1389e+19, 4);
INSERT INTO public.moon VALUES (17, 'Proteus', 1, 210, 3.9e+16, 4);
INSERT INTO public.moon VALUES (18, 'Nereid', 1, 176, 2.4e+16, 4);
INSERT INTO public.moon VALUES (19, 'Galatea', 1, 98, 3.8e+15, 4);
INSERT INTO public.moon VALUES (20, 'Titania', 14, 789, 19.341, 5);
INSERT INTO public.moon VALUES (21, 'Oberon', 14, 778, 19.308, 5);
INSERT INTO public.moon VALUES (22, 'Umbriel', 1, 586, 19.127, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 1, 3389, 6.39e+20, 4, 0, -110, 35, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 5, 6051, 4.867e+21, 4, 0, 400, 500, NULL);
INSERT INTO public.planet VALUES (4, 'Neptune', 2, 24622, 1.024e+23, 4, 0, -220, -150, NULL);
INSERT INTO public.planet VALUES (5, 'Uranus', 2, 25362, 8.681e+22, 4, 0, -210, -180, NULL);
INSERT INTO public.planet VALUES (6, 'Jupiter', 2, 69911, 1.899e+24, 4, 0, 110, 130, NULL);
INSERT INTO public.planet VALUES (7, 'Saturn', 2, 58232, 5.683e+23, 4, 0, -178, -130, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, 4880, 3.285e+20, 4, 0, -173, 427, NULL);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 1, 6790, 6.63e+20, 18, 0, -39, 0, NULL);
INSERT INTO public.planet VALUES (10, 'ISS', 19, 0, 450, 4, 0, 19, 27, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 4, 6371, 5.972e+21, 4, 8000, -90, 60, NULL);
INSERT INTO public.planet VALUES (11, 'Trappist-1e', 4, 6213, 5.009999999999999e+21, 19, 0, -23, 15, NULL);
INSERT INTO public.planet VALUES (12, 'Trappist-1b', 4, 6410, 4.953e+21, 19, 0, 0, 127, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Rocky', true, false, false);
INSERT INTO public.planet_type VALUES (2, 'Gas giant', true, false, false);
INSERT INTO public.planet_type VALUES (3, 'Gas planet', true, false, false);
INSERT INTO public.planet_type VALUES (5, 'Greenhouse', true, false, false);
INSERT INTO public.planet_type VALUES (6, 'Lava', true, false, false);
INSERT INTO public.planet_type VALUES (7, 'Ocean', true, false, false);
INSERT INTO public.planet_type VALUES (8, 'Volcanic', true, false, false);
INSERT INTO public.planet_type VALUES (9, 'Satellite', false, true, false);
INSERT INTO public.planet_type VALUES (11, 'Chthonian', true, false, false);
INSERT INTO public.planet_type VALUES (12, 'Carbon', true, false, false);
INSERT INTO public.planet_type VALUES (13, 'Protoplanet', true, false, false);
INSERT INTO public.planet_type VALUES (14, 'Ice', true, false, false);
INSERT INTO public.planet_type VALUES (15, 'Puffy', true, false, false);
INSERT INTO public.planet_type VALUES (16, 'Hycean', true, false, false);
INSERT INTO public.planet_type VALUES (18, 'Rogue', true, false, false);
INSERT INTO public.planet_type VALUES (21, 'Asteroid', false, false, false);
INSERT INTO public.planet_type VALUES (22, 'Comet', false, false, false);
INSERT INTO public.planet_type VALUES (4, 'Exoplanet', true, false, true);
INSERT INTO public.planet_type VALUES (10, 'ISS', false, true, true);
INSERT INTO public.planet_type VALUES (17, 'Space station', false, true, true);
INSERT INTO public.planet_type VALUES (19, 'Death Star', true, true, true);
INSERT INTO public.planet_type VALUES (20, 'Artificial planet', true, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '10 Lacertae', 'O9V', 1, 8.27000, 26.90000);
INSERT INTO public.star VALUES (2, 'Eta Aurigae', 'B3V', 1, 3.25000, 5.40000);
INSERT INTO public.star VALUES (3, 'Rigel A', 'B8la', 1, 78.90000, 21.10000);
INSERT INTO public.star VALUES (4, 'Eta Canis Majoris', 'B5la', 1, 54.20000, 18.19000);
INSERT INTO public.star VALUES (5, 'Vega', 'A0Va', 1, 2.36200, 2.13500);
INSERT INTO public.star VALUES (6, 'Sirius A', 'A0mA1Va', 1, 1.71000, 2.06000);
INSERT INTO public.star VALUES (7, 'Sirius B', 'DA2', 1, 0.00100, 1.02000);
INSERT INTO public.star VALUES (8, 'Deneb', 'A2la', 1, 203.17000, 19.40000);
INSERT INTO public.star VALUES (9, 'Sun', 'G2V', 1, 1.00000, 1.00000);
INSERT INTO public.star VALUES (10, 'Pollux', 'K0III', 1, 9.06000, 1.91090);
INSERT INTO public.star VALUES (12, 'VY Canis Majoris', 'M5eIa', 1, 1420.90000, 17.10000);
INSERT INTO public.star VALUES (13, 'Mirach', 'M0III', 1, 86.40000, 2.49000);
INSERT INTO public.star VALUES (14, '9 Pegasi', 'G5Ib', 1, 61.50000, 7.14900);
INSERT INTO public.star VALUES (15, 'HD 10647', 'F9V', 1, 1.10000, 1.11000);
INSERT INTO public.star VALUES (16, 'Alpha Centauri A', 'G2V', 1, 1.27090, 1.07880);
INSERT INTO public.star VALUES (17, 'Alpha Centauri B', 'K1V', 1, 0.85910, 0.90910);
INSERT INTO public.star VALUES (18, 'Proxima Centauri', 'M5.5Ve', 1, 0.15420, 0.12210);
INSERT INTO public.star VALUES (19, 'Trappist-1', 'M8V', 1, 0.11900, 0.08900);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 19, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: galaxy_type galaxy_type_typename_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_typename_key UNIQUE (name);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_type_typename_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_typename_key UNIQUE (name);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

