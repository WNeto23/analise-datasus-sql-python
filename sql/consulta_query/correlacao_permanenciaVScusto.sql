
/*
Será que municípios onde os pacientes ficam mais tempo internados são necessariamente os que gastam mais?
*/
SELECT
    m.municipio,
    ROUND(AVG(f.media_permanencia), 2) AS media_dias_internado,
    ROUND(AVG(f.valor_medio_internacao), 2) AS ticket_medio_valor
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
GROUP BY m.cod_ibge
HAVING ticket_medio_valor > 0
ORDER BY media_dias_internado DESC
LIMIT 20;