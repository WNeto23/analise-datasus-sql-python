/*
Aqui calculamos o "Ticket Médio" das internações em cada estado para identificar onde a saúde é mais cara.
*/
SELECT
    m.uf_sigla,
    ROUND(SUM(f.valor_total) / SUM(f.internacoes), 2) AS custo_medio_por_internacao
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.internacoes > 0
GROUP BY m.cod_ibge, m.municipio, m.uf_sigla
ORDER BY custo_medio_por_internacao DESC;