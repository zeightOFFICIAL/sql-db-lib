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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(25) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(75) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (125, 2018, 'Final', 567, 568, 4, 2);
INSERT INTO public.games VALUES (126, 2018, 'Third Place', 569, 570, 2, 0);
INSERT INTO public.games VALUES (127, 2018, 'Semi-Final', 568, 570, 2, 1);
INSERT INTO public.games VALUES (128, 2018, 'Semi-Final', 567, 569, 1, 0);
INSERT INTO public.games VALUES (129, 2018, 'Quarter-Final', 568, 571, 3, 2);
INSERT INTO public.games VALUES (130, 2018, 'Quarter-Final', 570, 572, 2, 0);
INSERT INTO public.games VALUES (131, 2018, 'Quarter-Final', 569, 573, 2, 1);
INSERT INTO public.games VALUES (132, 2018, 'Quarter-Final', 567, 574, 2, 0);
INSERT INTO public.games VALUES (133, 2018, 'Eighth-Final', 570, 575, 2, 1);
INSERT INTO public.games VALUES (134, 2018, 'Eighth-Final', 572, 576, 1, 0);
INSERT INTO public.games VALUES (135, 2018, 'Eighth-Final', 569, 577, 3, 2);
INSERT INTO public.games VALUES (136, 2018, 'Eighth-Final', 573, 578, 2, 0);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 568, 579, 2, 1);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 571, 580, 2, 1);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 574, 581, 2, 1);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 567, 582, 4, 3);
INSERT INTO public.games VALUES (141, 2014, 'Final', 583, 582, 1, 0);
INSERT INTO public.games VALUES (142, 2014, 'Third Place', 584, 573, 3, 0);
INSERT INTO public.games VALUES (143, 2014, 'Semi-Final', 582, 584, 1, 0);
INSERT INTO public.games VALUES (144, 2014, 'Semi-Final', 583, 573, 7, 1);
INSERT INTO public.games VALUES (145, 2014, 'Quarter-Final', 584, 585, 1, 0);
INSERT INTO public.games VALUES (146, 2014, 'Quarter-Final', 582, 569, 1, 0);
INSERT INTO public.games VALUES (147, 2014, 'Quarter-Final', 573, 575, 2, 1);
INSERT INTO public.games VALUES (148, 2014, 'Quarter-Final', 583, 567, 1, 0);
INSERT INTO public.games VALUES (149, 2014, 'Eighth-Final', 573, 586, 2, 1);
INSERT INTO public.games VALUES (150, 2014, 'Eighth-Final', 575, 574, 2, 0);
INSERT INTO public.games VALUES (151, 2014, 'Eighth-Final', 567, 587, 2, 0);
INSERT INTO public.games VALUES (152, 2014, 'Eighth-Final', 583, 588, 2, 1);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 584, 578, 2, 1);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 585, 589, 2, 1);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 582, 576, 1, 0);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 569, 590, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (567, 'France');
INSERT INTO public.teams VALUES (568, 'Croatia');
INSERT INTO public.teams VALUES (569, 'Belgium');
INSERT INTO public.teams VALUES (570, 'England');
INSERT INTO public.teams VALUES (571, 'Russia');
INSERT INTO public.teams VALUES (572, 'Sweden');
INSERT INTO public.teams VALUES (573, 'Brazil');
INSERT INTO public.teams VALUES (574, 'Uruguay');
INSERT INTO public.teams VALUES (575, 'Colombia');
INSERT INTO public.teams VALUES (576, 'Switzerland');
INSERT INTO public.teams VALUES (577, 'Japan');
INSERT INTO public.teams VALUES (578, 'Mexico');
INSERT INTO public.teams VALUES (579, 'Denmark');
INSERT INTO public.teams VALUES (580, 'Spain');
INSERT INTO public.teams VALUES (581, 'Portugal');
INSERT INTO public.teams VALUES (582, 'Argentina');
INSERT INTO public.teams VALUES (583, 'Germany');
INSERT INTO public.teams VALUES (584, 'Netherlands');
INSERT INTO public.teams VALUES (585, 'Costa Rica');
INSERT INTO public.teams VALUES (586, 'Chile');
INSERT INTO public.teams VALUES (587, 'Nigeria');
INSERT INTO public.teams VALUES (588, 'Algeria');
INSERT INTO public.teams VALUES (589, 'Greece');
INSERT INTO public.teams VALUES (590, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 156, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 590, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

