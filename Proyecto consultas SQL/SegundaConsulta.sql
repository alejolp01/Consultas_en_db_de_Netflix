-- 1. ¿Qué géneros de serie son más prevalentes en la tabla series?

SELECT genero AS 'Género predominante', COUNT(*) AS 'Cantidad' FROM Series
GROUP BY genero
ORDER BY COUNT(*) DESC;

-- 2. ¿Cuales son las tres series con mayor rating promedio de IMDB y cúantos episodios tiene cada una?

SELECT Series.titulo, COUNT(episodio_id) AS 'Número de episodios', AVG(Episodios.rating_imdb) AS promedio_imdb
FROM Series
INNER JOIN Episodios ON Series.serie_id=Episodios.serie_id
GROUP BY Series.serie_id
ORDER BY promedio_imdb DESC
LIMIT 3;

-- 3. ¿Cuál es la duración total de todos los episodios de la series 'Stranger Things'?

SELECT series.titulo AS 'Título de la Serie', SUM(episodios.duracion) AS 'Duración total'
FROM series
INNER JOIN episodios ON series.serie_id=episodios.serie_id
WHERE series.titulo='Stranger Things'

