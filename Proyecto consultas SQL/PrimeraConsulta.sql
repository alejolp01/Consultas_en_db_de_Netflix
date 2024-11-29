-- Pregunta 1
-- ¿Quén es el actor o actiz que ha participado en la mayor cantidad de series?
SELECT actor_id, COUNT(serie_id) AS numero_de_series FROM actuaciones GROUP BY actor_id ORDER BY numero_de_series DESC;

-- Pregunta 2
-- ¿Cual es la serie con mejor rating promedio según imbd?
SELECT serie_id, AVG(rating_imdb) AS rating_promedio 
FROM episodios
GROUP BY serie_id
ORDER BY rating_promedio DESC;

-- Pregunta 3
-- ¿Cual es el episodio con la duración más larga'
SELECT * FROM episodios
ORDER BY duracion DESC;
