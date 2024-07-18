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

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);
ALTER TABLE public.moon OWNER TO freecodecamp;

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);
ALTER TABLE public.more_info OWNER TO freecodecamp;

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);
ALTER TABLE public.planet OWNER TO freecodecamp;

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    area integer,
    volume integer,
    age numeric,
    material text,
    has_life boolean,
    has_water boolean
);
ALTER TABLE public.star OWNER TO freecodecamp;

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);
ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);

INSERT INTO public.galaxy VALUES (1, 1, 'galaxy1', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.galaxy VALUES (2, 2, 'galaxy2', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.galaxy VALUES (3, 3, 'galaxy3', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.galaxy VALUES (4, 4, 'galaxy4', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.galaxy VALUES (5, 5, 'galaxy5', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.galaxy VALUES (6, 6, 'galaxy6', 500, 750, 1500.75, 'solid', true, true);

INSERT INTO public.moon VALUES (1, 1, 'moon1', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (2, 2, 'moon2', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (3, 3, 'moon3', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (4, 4, 'moon4', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (5, 5, 'moon5', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (6, 6, 'moon6', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (7, 7, 'moon7', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (8, 8, 'moon8', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (9, 9, 'moon9', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (10, 10, 'moon10', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (11, 11, 'moon11', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (12, 12, 'moon12', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (13, 11, 'moon13', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (14, 11, 'moon14', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (15, 11, 'moon15', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (16, 11, 'moon16', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (17, 11, 'moon17', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (18, 11, 'moon18', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (19, 11, 'moon19', 500, 750, 1500.75, 'true', true, NULL);
INSERT INTO public.moon VALUES (20, 11, 'moon20', 500, 750, 1500.75, 'true', true, NULL);

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem impsum');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'lorem impsum');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'lorem impsum');
INSERT INTO public.more_info VALUES (4, 4, 'info4', 'lorem impsum');
INSERT INTO public.more_info VALUES (5, 5, 'info5', 'lorem impsum');
INSERT INTO public.more_info VALUES (6, 6, 'info6', 'lorem impsum');
INSERT INTO public.more_info VALUES (7, 7, 'info7', 'lorem impsum');
INSERT INTO public.more_info VALUES (8, 8, 'info8', 'lorem impsum');
INSERT INTO public.more_info VALUES (9, 9, 'info9', 'lorem impsum');
INSERT INTO public.more_info VALUES (10, 10, 'info10', 'lorem impsum');
INSERT INTO public.more_info VALUES (11, 11, 'info11', 'lorem impsum');
INSERT INTO public.more_info VALUES (12, 12, 'info12', 'lorem impsum');
INSERT INTO public.more_info VALUES (13, 13, 'info13', 'lorem impsum');
INSERT INTO public.more_info VALUES (14, 14, 'info14', 'lorem impsum');
INSERT INTO public.more_info VALUES (15, 15, 'info15', 'lorem impsum');
INSERT INTO public.more_info VALUES (16, 16, 'info16', 'lorem impsum');
INSERT INTO public.more_info VALUES (17, 17, 'info17', 'lorem impsum');
INSERT INTO public.more_info VALUES (18, 18, 'info18', 'lorem impsum');
INSERT INTO public.more_info VALUES (19, 19, 'info19', 'lorem impsum');
INSERT INTO public.more_info VALUES (20, 20, 'info20', 'lorem impsum');

INSERT INTO public.planet VALUES (1, 1, 1, 'planet1', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.planet VALUES (2, 2, 2, 'planet2', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.planet VALUES (3, 3, 3, 'planet3', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.planet VALUES (4, 4, 4, 'planet4', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.planet VALUES (5, 5, 5, 'planet5', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.planet VALUES (6, 6, 6, 'planet6', 500, 750, 1500.75, 'solid', true, true);

INSERT INTO public.star VALUES (1, 1, 1, 'star1', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (2, 2, 2, 'star2', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (3, 3, 3, 'star3', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (4, 4, 4, 'star4', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (5, 5, 5, 'star5', 500, 750, 1500.75, 'solid', true, true);
INSERT INTO public.star VALUES (6, 6, 6, 'star6', 500, 750, 1500.75, 'solid', true, true);
