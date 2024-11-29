-- Identificar las series más exitosas en la base de datos NetflixDB (las series más existosas se definen
-- por la cantidad de episodios y rating promedio de IMDB)


WITH NumeroEpisodios AS(
SELECT serie_id,
COUNT(episodio_id) AS num_episodios
FROM episodios
GROUP BY serie_id
),
Calificaciones AS(
SELECT serie_id,
AVG(rating_imdb) AS rating_promedio
FROM episodios
GROUP BY serie_id
)
SELECT
Series.titulo,
NumeroEpisodios.num_episodios,
Calificaciones.rating_promedio
FROM Series
JOIN NumeroEpisodios ON NumeroEpisodios.serie_id=Series.serie_id
JOIN Calificaciones ON Calificaciones.serie_id=Series.serie_id
ORDER BY Calificaciones.rating_promedio DESC, NumeroEpisodios.num_episodios DESC;