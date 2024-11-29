-- Utilizar una subconsulta para identificar los tres géneros más populares (en función de la cantidad de series)
-- La tabla debe tener el título de la serie, año de lanzamiento y rating de IMDB promedio

SELECT series.titulo AS 'Titulo de la serie', 
Series.año_lanzamiento AS 'Año de lanzamiento', 
Series.genero AS 'Género',
AVG(Episodios.rating_imdb) As 'Rating Promedio IMDB'
FROM Series 
JOIN Episodios ON Episodios.serie_id=Series.serie_id
WHERE
series.genero IN 
(SELECT genero FROM (SELECT genero, COUNT(*) AS cantidad_de_series FROM series 
GROUP BY genero 
ORDER BY cantidad_de_series DESC 
LIMIT 3) AS top3)
GROUP BY Series.serie_id
ORDER BY 'Rating Promedio IMDB' DESC; 
