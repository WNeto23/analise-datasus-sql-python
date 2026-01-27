/*
Esta query mostra se o volume de internações está crescendo ou diminuindo ao longo dos anos.
*/
SELECT
    ano,
    SUM(internacoes) AS total_internacoes
FROM fato_internacoes
GROUP BY ano
ORDER BY ano;