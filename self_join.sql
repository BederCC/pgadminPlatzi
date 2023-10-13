-- Relacion alumno / tutor --
SELECT	a.nombre,
		a.apellido,
		t.nombre,
		t.apellido
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Operaciones de texto concat --
SELECT	CONCAT(a.nombre, ' ', a.apellido) AS alumno,
		CONCAT(t.nombre, ' ', t.apellido) AS tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Contando alumnos por tutor --
SELECT	CONCAT(t.nombre, ' ', t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM	platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 5;

/**
  * RETO:   Encontrar el promedio de alumnos por tutor
  */

SELECT AVG(alumnos_por_tutor) promedio_alumnos_por_tutor
FROM (
	SELECT	CONCAT(t.nombre, ' ', t.apellido) AS tutor,
			COUNT(*) AS alumnos_por_tutor
	FROM	platzi.alumnos AS a
		INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
	GROUP BY tutor
) alumnos_tutor;


/**
  * RETO:  Seleccionar los registros de ambas tablas
  * sin importar si tienen contraparte en la otra
  * Unión
  */

SELECT 	a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM	platzi.alumnos AS a
	FULL OUTER JOIN platzi.carreras AS c
	ON a.carrera_id = c.id
ORDER BY a.carrera_id DESC, c.id DESC;
