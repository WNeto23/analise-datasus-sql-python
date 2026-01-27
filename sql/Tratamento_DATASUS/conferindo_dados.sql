SELECT 
    m.*,
    f.ano,
    f.mes,
    f.internacoes,
    f.valor_total
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
ORDER BY f.valor_total DESC
LIMIT 10;

SELECT 
    m.uf_sigla,
    SUM(f.internacoes) AS total_internacoes,
    SUM(f.valor_total) AS custo_total_sus
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
GROUP BY m.uf_sigla
ORDER BY custo_total_sus DESC;

CREATE VIEW v_fato_internacoes_completa AS
SELECT 
    f.ano,
    f.mes,
    m.uf_sigla,
    m.municipio,
    f.cod_municipio_ibge,
    f.internacoes,
    f.valor_total,
    f.valor_medio_internacao,
    f.dias_permanencia,
    f.media_permanencia
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge;