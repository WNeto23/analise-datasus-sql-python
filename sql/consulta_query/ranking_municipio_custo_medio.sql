/*Esta query identifica onde as internações são individualmente mais caras.
 Filtramos municípios com poucas internações (ex: menos de 100) para evitar
 que casos isolados distorçam o ranking.*/
SELECT
    m.municipio,
    m.uf_sigla,
    ROUND(SUM(f.internacoes), 2) AS total_inter,
    ROUND(AVG(f.valor_medio_internacao), 2) AS ticket_medio
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
GROUP BY m.cod_ibge
HAVING total_inter > 100
ORDER BY ticket_medio DESC
LIMIT 20;