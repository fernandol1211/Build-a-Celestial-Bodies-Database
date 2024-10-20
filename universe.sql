-- Volcado de base de datos PostgreSQL
-- Volcado de la versión 12.17 de la base de datos (Ubuntu 12.17-1.pgdg22.04+1)
-- Volcado por pg_dump versión 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

Colocar declaración_tiempo de espera = 0;
ESTABLECER lock_timeout = 0;
ESTABLECER idle_in_transaction_session_timeout = 0;
Colocar codificación_cliente = 'UTF8';
ESTABLECER cadenas_conformes_estándar = activado;
SELECCIONAR pg_catalog.set_config('ruta_búsqueda', '', falso);
Colocar check_function_bodies = falso;
Colocar xmloption = contenido;
Colocar client_min_messages = advertencia;
ESTABLECER fila_seguridad = desactivado;

SOLTAR BASE DE DATOS SI EXISTE universo;

CREAR universo DE BASE DE DATOS CON PLANTILLA = plantilla0 CODIFICACIÓN = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

\universo c

Colocar declaración_tiempo de espera = 0;
ESTABLECER lock_timeout = 0;
ESTABLECER idle_in_transaction_session_timeout = 0;
Colocar codificación_cliente = 'UTF8';
ESTABLECER cadenas_conformes_estándar = activado;
SELECCIONAR pg_catalog.set_config('ruta_búsqueda', '', falso);
Colocar check_function_bodies = falso;
Colocar xmloption = contenido;
Colocar client_min_messages = advertencia;
SET row_security = off;

SET default_tablespace = '';
SET default_table_access_method = heap;

-- Create galaxy table
CREATE TABLE public.galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    number_of_stars BIGINT,
    has_black_hole BOOLEAN NOT NULL,
    distance_from_earth NUMERIC(20, 2)
);

-- Create star table
CREATE TABLE public.star (
    star_id SERIAL PRIMARY KEY,
    galaxy_id INT REFERENCES public.galaxy(galaxy_id),
    name VARCHAR(255) NOT NULL UNIQUE,
    mass NUMERIC(10, 2),
    is_visible BOOLEAN NOT NULL,
    age_in_millions_of_years INT
);

-- Create planet table
CREATE TABLE public.planet (
    planet_id SERIAL PRIMARY KEY,
    star_id INT REFERENCES public.star(star_id),
    name VARCHAR(255) NOT NULL UNIQUE,
    has_life BOOLEAN NOT NULL,
    number_of_moons INT,
    diameter NUMERIC(10, 2)
);

-- Create moon table
CREATE TABLE public.moon (
    moon_id SERIAL PRIMARY KEY,
    planet_id INT REFERENCES public.planet(planet_id),
    name VARCHAR(255) NOT NULL UNIQUE,
    diameter NUMERIC(10, 2),
    has_atmosphere BOOLEAN NOT NULL
);

-- Create extra table (to meet the five table requirement)
CREATE TABLE public.extra_table (
    extra_table_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    numeric_value NUMERIC(10, 2),
    boolean_value BOOLEAN NOT NULL
);

-- Insert data into galaxy table
INSERT INTO public.galaxy (name, description, number_of_stars, has_black_hole, distance_from_earth) VALUES
('Milky Way', 'Our home galaxy', 250000000000, TRUE, 0),
('Andromeda', 'Nearest spiral galaxy to Milky Way', 1000000000000, TRUE, 2537000),
('Triangulum', 'Third-largest galaxy in the Local Group', 40000000000, FALSE, 3000000),
('Centaurus A', 'Peculiar galaxy in the constellation Centaurus', 100000000000, TRUE, 13000000),
('Whirlpool', 'Classic spiral galaxy', 100000000000, TRUE, 23000000),
('Sombrero', 'Peculiar galaxy with a large bulge', 100000000000, TRUE, 29000000);

-- Insert data into star table
INSERT INTO public.star (galaxy_id, name, mass, is_visible, age_in_millions_of_years) VALUES
(1, 'Sun', 1.00, TRUE, 4600),
(1, 'Sirius', 2.02, TRUE, 230),
(1, 'Alpha Centauri A', 1.10, TRUE, 5300),
(1, 'Betelgeuse', 11.60, TRUE, 8),
(2, 'Alpheratz', 3.80, TRUE, 60),
(3, 'S Trianguli', 1.15, FALSE, 100);

-- Insert data into planet table
INSERT INTO public.planet (star_id, name, has_life, number_of_moons, diameter) VALUES
(1, 'Earth', TRUE, 1, 12742),
(1, 'Mars', FALSE, 2, 6779),
(1, 'Jupiter', FALSE, 79, 139820),
(1, 'Saturn', FALSE, 82, 116460),
(1, 'Venus', FALSE, 0, 12104),
(1, 'Mercury', FALSE, 0, 4879),
(1, 'Uranus', FALSE, 27, 50724),
(1, 'Neptune', FALSE, 14, 49244),
(2, 'Sirio B', FALSO, 0, 11600),
(3, 'Próxima Centauri b', FALSO, 0, 12000),
(4, 'Betelgeuse b', FALSO, 0, 200000),
(5, 'Alfatz b', FALSO, 0, 150000);

-- Insertar datos en la tabla lunar.
INSERTAR EN public.moon (planet_id, nombre, diámetro, has_atmosphere) VALORES
(1, 'Luna', 3474.8, FALSO),
(3, 'Io', 3643.2, VERDADERO),
(3, 'Europa', 3121.6, VERDADERO),
(3, 'Ganímedes', 5268.2, VERDADERO),
(3, 'Calisto', 4820.6, VERDADERO),
(4, 'Titán', 5149.5, VERDADERO),
(4, 'Encelado', 504.2, VERDADERO),
(4, 'Mimas', 396.4, FALSO),
(4, 'Dione', 1122.8, FALSO),
(4, 'Jápeto', 1468.6, FALSO),
(7, 'Miranda', 471.6, FALSO),
(7, 'Ariel', 1157.8, FALSO),
(7, 'Umbriel', 1169.4, FALSO),
(7, 'Titania', 1576.8, FALSO),
(7, 'Oberón', 1522.8, FALSO),
(8, 'Tritón', 2706.8, VERDADERO),
(8, 'Nereida', 340, FALSO),
(8, 'Náyade', 60.4, FALSO),
(8, 'Talassa', 81.4, FALSO),
(8, 'Despina', 150, FALSO);

-- Insertar datos en extra_table
INSERTAR EN public.extra_table (nombre, descripción, valor_numérico, valor_booleano) VALORES
('Extra 1', 'Descripción para Extra 1', 100.50, VERDADERO),
('Extra 2', 'Descripción para Extra 2', 200,75, FALSO),
('Extra 3', 'Descripción para Extra 3', 300.25, VERDADERO);
