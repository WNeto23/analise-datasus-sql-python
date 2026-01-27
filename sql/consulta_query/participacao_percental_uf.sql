/*
Esta é uma query mais avançada que usa uma Subquery para calcular quanto cada estado representa do bolo total do SUS em 2024.
*/
SELECT
    m.uf_sigla,
    ROUND(SUM(f.valor_total) ,2) AS custo_uf,
    ROUND((SUM(f.valor_total) * 100.0 / (SELECT SUM(valor_total) FROM fato_internacoes WHERE ano = '2024')), 2) AS percentual_participacao
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
GROUP BY m.uf_sigla
ORDER BY percentual_participacao DESC;