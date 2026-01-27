/*
Quais cidades (exceto capitais, se quiser filtrar depois) geram mais custo para o SUS em um determinado ano?
*/
SELECT
    m.municipio,
    m.uf_sigla,
    SUM(f.valor_total) AS custo_total
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
GROUP BY m.cod_ibge
ORDER BY custo_total DESC
LIMIT 20;