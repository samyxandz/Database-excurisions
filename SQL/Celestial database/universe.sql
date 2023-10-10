--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,9),
    is_spherical boolean
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
-- Name: linker; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.linker (
    name character varying(25) NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    linker_id integer NOT NULL
);


ALTER TABLE public.linker OWNER TO freecodecamp;

--
-- Name: linker_linker_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.linker_linker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linker_linker_id_seq OWNER TO freecodecamp;

--
-- Name: linker_linker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.linker_linker_id_seq OWNED BY public.linker.linker_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,9),
    is_spherical boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,9),
    is_spherical boolean,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,9),
    is_spherical boolean,
    galaxy_id integer
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
-- Name: linker linker_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker ALTER COLUMN linker_id SET DEFAULT nextval('public.linker_linker_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy_1', 'this is first galaxy ', 100, 10.000000000, false);
INSERT INTO public.galaxy VALUES (2, 'galaxy_2', 'this is second galaxy', 150, 12.000000000, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy_3', 'this is third galaxy ', 200, 14.000000000, true);
INSERT INTO public.galaxy VALUES (4, 'galaxy_4', '4', 220, 16.150000000, true);
INSERT INTO public.galaxy VALUES (5, 'galaxy_5', '5', 240, 18.150000000, true);
INSERT INTO public.galaxy VALUES (6, 'galaxy_6', '6', 240, 18.150000000, false);


--
-- Data for Name: linker; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.linker VALUES ('0001', 1, 1, 1, 1, 1);
INSERT INTO public.linker VALUES ('0002', 1, 2, 3, 4, 2);
INSERT INTO public.linker VALUES ('0003', 1, 6, 4, 5, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon_1_1', 'first moon of first planet', 200, 234.765000000, true, 1);
INSERT INTO public.moon VALUES (2, 'moon_1_2', '1_2', 210, 234.765000000, true, 1);
INSERT INTO public.moon VALUES (3, 'moon_2_1', '2_1', 210, 234.765000000, true, 2);
INSERT INTO public.moon VALUES (4, 'moon_3_1', '3_1', 211, 234.765000000, false, 3);
INSERT INTO public.moon VALUES (5, 'moon_4_1', '4_1', 211, 234.765000000, false, 4);
INSERT INTO public.moon VALUES (6, 'moon_4_2', '4_2', 211, 234.765000000, false, 4);
INSERT INTO public.moon VALUES (7, 'moon_5_1', '5_1', 211, 234.765000000, false, 5);
INSERT INTO public.moon VALUES (8, 'moon_5_2', '5_2', 211, 234.765000000, false, 5);
INSERT INTO public.moon VALUES (9, 'moon_5_3', '5_3', 211, 234.765000000, false, 5);
INSERT INTO public.moon VALUES (10, 'moon_6_1', '6_1', 211, 234.765000000, false, 6);
INSERT INTO public.moon VALUES (11, 'moon_7_1', '7_1', 211, 234.765000000, false, 7);
INSERT INTO public.moon VALUES (12, 'moon_7_2', '7_2', 211, 234.765000000, false, 7);
INSERT INTO public.moon VALUES (13, 'moon_8_1', '8_1', 211, 234.765000000, false, 8);
INSERT INTO public.moon VALUES (14, 'moon_8_2', '8_2', 211, 234.765000000, false, 8);
INSERT INTO public.moon VALUES (15, 'moon_9_1', '9_1', 211, 234.765000000, false, 9);
INSERT INTO public.moon VALUES (16, 'moon_10_1', '10_1', 211, 234.765000000, false, 10);
INSERT INTO public.moon VALUES (17, 'moon_10_2', '10_2', 211, 234.765000000, false, 10);
INSERT INTO public.moon VALUES (18, 'moon_11_1', '11_1', 211, 234.765000000, false, 11);
INSERT INTO public.moon VALUES (19, 'moon_11_2', '11_2', 211, 234.765000000, false, 11);
INSERT INTO public.moon VALUES (20, 'moon_12_1', '12_1', 211, 234.765000000, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet_1', 'This is the first planet', 195, 85.500000000, true, 1);
INSERT INTO public.planet VALUES (2, 'planet_2', '2', 200, 86.500000000, true, 1);
INSERT INTO public.planet VALUES (3, 'planet_3', '3', 205, 87.500000000, true, 2);
INSERT INTO public.planet VALUES (4, 'planet_4', '4', 210, 88.500000000, false, 3);
INSERT INTO public.planet VALUES (5, 'planet_5', '5', 215, 89.500000000, true, 3);
INSERT INTO public.planet VALUES (6, 'planet_6', '6', 220, 90.500000000, true, 3);
INSERT INTO public.planet VALUES (7, 'planet_7', '', NULL, NULL, true, 4);
INSERT INTO public.planet VALUES (8, 'planet_8', '', NULL, NULL, true, 4);
INSERT INTO public.planet VALUES (9, 'planet_9', '', NULL, NULL, true, 5);
INSERT INTO public.planet VALUES (10, 'planet_10', '', NULL, NULL, true, 4);
INSERT INTO public.planet VALUES (11, 'planet_11', '', NULL, NULL, true, 6);
INSERT INTO public.planet VALUES (12, 'planet_12', '', NULL, NULL, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star_1', 'thist is the first star', 95, 9.560000000, true, 1);
INSERT INTO public.star VALUES (2, 'star_2', '2', 100, 10.560000000, true, 2);
INSERT INTO public.star VALUES (3, 'star_3', '3', 110, 11.560000000, true, 2);
INSERT INTO public.star VALUES (4, 'star_4', '4', 120, 12.560000000, true, 2);
INSERT INTO public.star VALUES (5, 'star_5', '5', 130, 13.560000000, true, 2);
INSERT INTO public.star VALUES (6, 'star_6', '6', 140, 14.560000000, true, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: linker_linker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.linker_linker_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: linker linker_columnmoont_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_columnmoont_id_key UNIQUE (moon_id);


--
-- Name: linker linker_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_name_key UNIQUE (name);


--
-- Name: linker linker_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_pkey PRIMARY KEY (linker_id);


--
-- Name: linker linker_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_planet_id_key UNIQUE (planet_id);


--
-- Name: linker linker_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_star_id_key UNIQUE (star_id);


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
-- Name: linker linker_columnmoont_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_columnmoont_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: linker linker_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: linker linker_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: linker linker_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.linker
    ADD CONSTRAINT linker_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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