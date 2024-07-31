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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(8,2),
    galaxy_type character varying(30),
    num_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    num_hab integer,
    age_in_millions_of_years numeric(8,2) NOT NULL,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_moon_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_moon_seq OWNER TO freecodecamp;

--
-- Name: moon_id_moon_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_moon_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    num_hab integer,
    age_in_millions_of_years numeric(8,2) NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_id_specie_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_id_specie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_specie_seq OWNER TO freecodecamp;

--
-- Name: species_id_specie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_id_specie_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years numeric(8,2) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_star_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_star_seq OWNER TO freecodecamp;

--
-- Name: star_id_star_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_star_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_moon_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_id_specie_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_star_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600.00, 'Spiral', 30000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000.00, 'Spiral', 25000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000.00, 'Spiral', 15000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 500.00, 'Spiral', 20000);
INSERT INTO public.galaxy VALUES (5, 'Messier 87', 13000.00, 'Elliptical', 28000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 8900.00, 'Spiral', 18000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 0, 4500.00, 'Earths natural satellite', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 0, 4500.00, 'Marss moon', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 0, 4500.00, 'Marss moon', 2);
INSERT INTO public.moon VALUES (4, 'Europa', false, 0, 4500.00, 'Jupiters moon, potential for life', 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', false, 0, 4500.00, 'Jupiters largest moon', 3);
INSERT INTO public.moon VALUES (6, 'Callisto', false, 0, 4500.00, 'Jupiters moon', 3);
INSERT INTO public.moon VALUES (7, 'Io', false, 0, 4500.00, 'Jupiters volcanic moon', 3);
INSERT INTO public.moon VALUES (8, 'Titan', false, 0, 4500.00, 'Saturns largest moon', 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 0, 4500.00, 'Saturns moon with ice geysers', 4);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 0, 4500.00, 'Saturns moon', 4);
INSERT INTO public.moon VALUES (11, 'Triton', false, 0, 4500.00, 'Neptunes largest moon', 5);
INSERT INTO public.moon VALUES (12, 'Charon', false, 0, 4500.00, 'Plutos largest moon', 6);
INSERT INTO public.moon VALUES (13, 'Oberon', false, 0, 4500.00, 'Uranuss moon', 7);
INSERT INTO public.moon VALUES (14, 'Titania', false, 0, 4500.00, 'Uranuss largest moon', 7);
INSERT INTO public.moon VALUES (15, 'Rhea', false, 0, 4500.00, 'Saturns moon', 4);
INSERT INTO public.moon VALUES (16, 'Dione', false, 0, 4500.00, 'Saturns moon', 4);
INSERT INTO public.moon VALUES (17, 'Iapetus', false, 0, 4500.00, 'Saturns moon', 4);
INSERT INTO public.moon VALUES (18, 'Ariel', false, 0, 4500.00, 'Uranuss moon', 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', false, 0, 4500.00, 'Uranuss moon', 7);
INSERT INTO public.moon VALUES (20, 'Miranda', false, 0, 4500.00, 'Uranuss moon', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 8, 4500.00, 'The only planet known to have life', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 0, 4500.00, 'Known as the Red Planet', 1);
INSERT INTO public.planet VALUES (3, 'Kepler-22b', false, 0, 4000.00, 'Potentially habitable exoplanet', 2);
INSERT INTO public.planet VALUES (4, 'Proxima b', false, 0, 5000.00, 'Orbiting Proxima Centauri', 4);
INSERT INTO public.planet VALUES (5, 'Gliese 581g', false, 0, 7000.00, 'Potentially habitable exoplanet', 3);
INSERT INTO public.planet VALUES (6, 'Kepler-452b', false, 0, 6000.00, 'Super-Earth exoplanet', 2);
INSERT INTO public.planet VALUES (7, 'HD 209458 b', false, 0, 7000.00, 'First exoplanet observed transiting its star', 2);
INSERT INTO public.planet VALUES (8, '55 Cancri e', false, 0, 8000.00, 'Hot super-Earth', 3);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', false, 0, 7000.00, 'One of the seven TRAPPIST-1 planets', 5);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', false, 0, 7000.00, 'One of the seven TRAPPIST-1 planets', 5);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1f', false, 0, 7000.00, 'One of the seven TRAPPIST-1 planets', 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1g', false, 0, 7000.00, 'One of the seven TRAPPIST-1 planets', 5);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Homo sapiens', 1);
INSERT INTO public.species VALUES (2, 'Martian', 2);
INSERT INTO public.species VALUES (3, 'Keplerian', 3);
INSERT INTO public.species VALUES (4, 'Proximan', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 1, 5778);
INSERT INTO public.star VALUES (2, 'Sirius', 300.00, 1, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8000.00, 2, 3500);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4500.00, 1, 3042);
INSERT INTO public.star VALUES (5, 'Vega', 455.00, 3, 9602);
INSERT INTO public.star VALUES (6, 'Rigel', 8000.00, 2, 11000);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


--
-- Name: moon_id_moon_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_moon_seq', 20, true);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 12, true);


--
-- Name: species_id_specie_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_id_specie_seq', 4, true);


--
-- Name: star_id_star_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_star_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_uk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_uk UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_uk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_uk UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_uk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_uk UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: species species_uk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_uk UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_uk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_uk UNIQUE (name);


--
-- Name: planet unique_ck; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_ck UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_id_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_id_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_id_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
