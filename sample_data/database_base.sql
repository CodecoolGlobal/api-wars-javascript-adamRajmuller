--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- ALTER TABLE IF EXISTS ONLY public.question DROP CONSTRAINT IF EXISTS pk_question_id CASCADE;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS pk_planet_id CASCADE;
ALTER TABLE IF EXISTS ONLY public.resident DROP CONSTRAINT IF EXISTS fk_planet_id CASCADE;
ALTER TABLE IF EXISTS ONLY public.resident DROP CONSTRAINT IF EXISTS pk_resident_id CASCADE;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS pk_users_id CASCADE;




DROP TABLE IF EXISTS public.planet;
DROP SEQUENCE IF EXISTS public.planet_id_seq;
CREATE TABLE planet (
    id serial NOT NULL,
    submission_time timestamp without time zone,
    name text,
    diameter integer,
    climate text,
    terrain text,
    surface_water float,
    population integer
);

DROP TABLE IF EXISTS public.resident;
DROP SEQUENCE IF EXISTS public.resident_id_seq;
CREATE TABLE resident (
    id serial NOT NULL,
    name text,
    height float,
    mass integer,
    skin text,
    hair text,
    eye text,
    birth text,
    gender text,
    planet_id integer
);


DROP TABLE IF EXISTS public.users;
DROP SEQUENCE IF EXISTS public.users_id_seq;
CREATE TABLE users (
    id serial NOT NULL,
    username text UNIQUE,
    password text,
    registration_date timestamp without time zone
);

DROP TABLE IF EXISTS public.user_vote;
CREATE TABLE user_vote (
    planet_id integer,
    resident_id integer,
    id integer NOT NULL
);

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users_id PRIMARY KEY (id);

ALTER TABLE ONLY planet
    ADD CONSTRAINT pk_planet_id PRIMARY KEY (id);

ALTER TABLE ONLY resident
    ADD CONSTRAINT pk_resident_id PRIMARY KEY (id);

ALTER TABLE ONLY resident
    ADD CONSTRAINT fk_resident_id FOREIGN KEY (planet_id) REFERENCES planet(id);

ALTER TABLE ONLY user_vote
    ADD CONSTRAINT fk_user_id FOREIGN KEY (id) REFERENCES users(id);

INSERT INTO users VALUES (1, 'rajfta', '$2b$12$UrU3qREW4IKEF.s593Z0H.2Z1Y3n3L4DQ43aKnhCMGVvHXNy.x/G2', '2019-01-01 05:49:00');
INSERT INTO users VALUES (2, 'asdasd', '$2b$12$ybhDen8u0Se6fH1K/70UsOrFOOCcwy6L3HXmo2K76jQDdnF9t8igu',  '2019-01-01 05:49:00');
INSERT INTO users VALUES (3, 'dsadsa', '$2b$12$Ry9Bxgz0Lxije7quhS0ntejCXJWkmn4h4T6Ux4bRuf8zNYMEi6yd2',  '2019-01-01 05:49:00');

SELECT pg_catalog.setval('users_id_seq', 1, true);

SELECT pg_catalog.setval('planet_id_seq', 2, true);

SELECT pg_catalog.setval('resident_id_seq', 2, true);
