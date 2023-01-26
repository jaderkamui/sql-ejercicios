select * from bandas;
select * from bandas_discos;

--listar todos los discos de las bandas no alemanas

select * from bandas b
join bandas_discos bd
on b.nombre = bd.nombre_banda
WHERE b.pais<> 'Alemania' AND bd.anio_disco>=2000;

--2 listar el disco mas reciente de la banda

SELECT b.nombre, max(bd.anio_disco) FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE b.pais = 'UK' AND b.nombre ilike '%s'
GROUP BY b.nombre;

-- 3. listar todas las bandas alemanas con al menos una letra k en su nombre que tengan discos publicados en 1999 o superior.

SELECT b.nombre, b.pais, bd.nombre_disco, bd.anio_disco FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE b.pais = 'Alemania'AND b.nombre ilike '%k%' and bd.anio_disco >= 1999;

-- 4. listar todas las bandas y el número de discos registrados.

SELECT b.nombre, COUNT(bd.nombre_disco) FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
GROUP BY b.nombre;

--5 obtener las bandas

SELECT b.nombre, bd.anio_disco FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
order by bd.anio_disco;

-- 6 LISTAR TODAS LAS BANDAS QUE TIENEN UN DISCO CON NOMBRE EMPEZADO EN A

SELECT b.nombre, bd.nombre_disco FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE bd.nombre_disco ilike 'A%'


--7 mostrar bandas donde el album tenga un espacio en el nombre

SELECT b.nombre, bd.nombre_disco FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE bd.nombre_disco ilike '% %';


-- 8. Listar todas las bandas que tengan discos con más de una palabra.
-- listar el nombre de la banda y la cantidad de discos


SELECT b.nombre, COUNT(bd.nombre_disco) FROM bandas b
JOIN bandas_discos bd
ON b.nombre = bd.nombre_banda
WHERE bd.nombre_disco ilike '% %'
group by b.nombre;