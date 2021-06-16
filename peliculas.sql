CREATE DATABASE peliculas;
\c peliculas
DROP TABLE reparto;
DROP TABLE peliculas;

CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR(255),
    año_estreno  CHAR(4),
    director VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE reparto (
    id INT,
    actor VARCHAR(50),
    FOREIGN KEY (id) REFERENCES peliculas(id)
);
\copy peliculas FROM 'peliculas.csv' csv header; 

SELECT * FROM peliculas;

\copy reparto FROM 'reparto.csv' csv header;

SELECT * FROM reparto;

SELECT id FROM peliculas WHERE pelicula ='Titanic';

SELECT * FROM reparto WHERE id = 2;

SELECT * FROM reparto WHERE actor = 'Harrison Ford';

SELECT pelicula FROM peliculas WHERE año_estreno BETWEEN '1990' AND '1999' ORDER BY año_estreno ASC;

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

SELECT MAX(LENGTH(pelicula)) FROM peliculas;

SELECT actor , pelicula FROM reparto 

INNER JOIN peliculas ON reparto.id = peliculas.id WHERE peliculas.id = 2 LIMIT 1;


