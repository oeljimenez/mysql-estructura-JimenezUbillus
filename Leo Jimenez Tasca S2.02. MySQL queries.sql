/*TABLA TIENDA QUERIES DE LA 1 A LA 17*/
SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio AS precio_euros, ROUND(precio*1.11,2) AS dolars  FROM tienda.producto; 
SELECT nombre as 'nom de producto', precio AS euros, ROUND(precio*1.11,2) AS dolars  FROM tienda.producto;
SELECT UPPER(nombre), precio FROM tienda.producto;
SELECT LOWER(nombre), precio FROM tienda.producto;
SELECT f.nombre, UPPER(SUBSTRING(f.nombre, 1, 2)) as Fabricante FROM tienda.producto p INNER JOIN tienda.fabricante f ON p.codigo_fabricante=f.codigo;
SELECT nombre, ROUND(precio) FROM tienda.producto;
SELECT nombre, TRUNCATE(precio, 0) FROM tienda.producto;
SELECT f.codigo FROM tienda.producto p INNER JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo;
SELECT DISTINCT f.codigo FROM tienda.producto p INNER JOIN tienda.fabricante f ON p.codigo_fabricante = f.codigo;
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre, precio  FROM tienda.producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 3,2;
/*TABLA UNIVERSIDAD LAS PRIMERAS QUERIES DESDE LA 1 A LA 9*/
SELECT p.apellido1, p.apellido2, p.nombre FROM universidad.persona p  WHERE p.tipo='alumno' ORDER BY p.apellido1, p.apellido2, p.nombre ASC;
SELECT p.apellido1, p.apellido2, p.nombre FROM universidad.persona p  WHERE p.tipo='alumno' AND p.telefono IS NULL;
SELECT * FROM universidad.persona p  WHERE p.tipo='alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM universidad.persona p  WHERE p.tipo='profesor' AND p.telefono IS NULL AND p.nif  like '%K';
SELECT * FROM universidad.asignatura a  WHERE a.cuatrimestre=1 AND a.id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM universidad.persona p INNER JOIN universidad.profesor prof ON p.id = prof.id_profesor INNER JOIN universidad.departamento d ON prof.id_departamento = d.id WHERE p.tipo='profesor' ORDER BY p.apellido1, p.apellido2, p.nombre ASC;
SELECT a.nombre, curs.anyo_inicio, curs.anyo_fin FROM universidad.persona p INNER JOIN universidad.alumno_se_matricula_asignatura alum ON p.id = alum.id_alumno INNER JOIN universidad.asignatura a ON alum.id_asignatura = a.id INNER JOIN universidad.curso_escolar curs ON a.curso= curs.id  WHERE p.tipo='alumno' AND p.nif = '26902806M';
SELECT d.nombre FROM universidad.persona p INNER JOIN universidad.profesor prof ON p.id = prof.id_profesor INNER JOIN universidad.departamento d ON prof.id_departamento = d.id INNER JOIN universidad.asignatura a ON prof.id_profesor = a.id_profesor INNER JOIN universidad.grado g ON a.id_grado= g.id WHERE p.tipo='profesor' AND a.id_grado = 4;
SELECT * FROM universidad.persona p INNER JOIN universidad.alumno_se_matricula_asignatura alum ON p.id = alum.id_alumno INNER JOIN universidad.asignatura a ON alum.id_asignatura = a.id INNER JOIN universidad.curso_escolar curs ON a.curso= curs.id WHERE p.tipo='alumno' AND curs.anyo_inicio BETWEEN '2018-01-01' AND '2018-12-31' AND curs.anyo_fin BETWEEN '2019-01-01' AND '2019-12-31';
/*Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN, de la 1 a la 5*/
SELECT  d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM universidad.persona p LEFT JOIN universidad.profesor prof ON p.id = prof.id_profesor LEFT JOIN universidad.departamento d ON prof.id_departamento = d.id WHERE p.tipo='profesor' ORDER BY  d.nombre, p.apellido1, p.apellido2, p.nombre ASC;
SELECT  * FROM universidad.persona p LEFT JOIN universidad.profesor prof ON p.id = prof.id_profesor LEFT JOIN universidad.departamento d ON prof.id_departamento = d.id WHERE p.tipo='profesor' AND d.nombre IS NULL;
SELECT  * FROM universidad.departamento d LEFT JOIN universidad.profesor prof ON d.id = prof.id_departamento WHERE id_profesor IS NULL;
SELECT  * FROM universidad.persona p RIGHT JOIN universidad.profesor prof ON p.id = prof.id_profesor LEFT JOIN universidad.asignatura a ON prof.id_profesor=a.id_profesor AND a.id IS NULL;
SELECT  * FROM universidad.asignatura a LEFT JOIN universidad.profesor prof ON a.id_profesor = prof.id_profesor Where a.id_profesor IS NULL;
/*Consultes resum de la 1 a la 6*/
SELECT COUNT(*) FROM universidad.persona p WHERE p.tipo='alumno';
SELECT COUNT(*) FROM universidad.persona p  WHERE p.tipo='alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT d.nombre, count(id_departamento) FROM universidad.profesor prof INNER JOIN universidad.departamento d ON prof.id_departamento = d.id GROUP BY id_departamento ORDER BY COUNT(*) ASC;
SELECT d.nombre as nombre_departament,  COUNT(id_departamento) as nombre_professors  FROM universidad.profesor prof RIGHT join universidad.departamento d ON prof.id_departamento = d.id GROUP BY d.nombre ORDER BY COUNT(id_departamento) DESC;
SELECT g.nombre as nombre_grau,  COUNT(id_grado) as nombre_grados  FROM universidad.asignatura a RIGHT join universidad.grado g ON a.id_grado = g.id GROUP BY g.nombre ORDER BY COUNT(id_grado) DESC;
SELECT g.nombre as nombre_grau,  COUNT(id_grado) as nombre_grados  FROM universidad.asignatura a RIGHT join universidad.grado g ON a.id_grado = g.id HAVING COUNT(id_grado) > 40 ;
/*Retorna totes les dades de l'alumne/a més jove.*/
SELECT * FROM universidad.persona p WHERE p.tipo='alumno' ORDER BY fecha_nacimiento LIMIT 1;