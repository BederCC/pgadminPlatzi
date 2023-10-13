SELECT * 
FROM platzi.alumnos
WHERE tutor_id IN (1,2,3,4);

SELECT * 
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

SELECT int4range(1, 20) @> 3;

SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

SELECT UPPER(int8range(15,25));
SELECT LOWER(int8range(15,25));

SELECT int4range(10,20) * int4range(15,25);

SELECT ISEMPTY(numrange(1,5));

SELECT * 
FROM platzi.alumnos
WHERE int4range(10,20) @> tutor_id;


/**
  * RETO:   Encontrar los números en común entre
  *         los id de tutor y carrera;
  */

SELECT numrange(
	(SELECT min(tutor_id) FROM platzi.alumnos),
	(SELECT max(tutor_id) FROM platzi.alumnos)
) * numrange(
	(SELECT min(carrera_id) FROM platzi.alumnos),
	(SELECT max(carrera_id) FROM platzi.alumnos)
);
