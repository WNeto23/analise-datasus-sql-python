/*
Aqui cruzamos o tempo que o paciente fica no hospital com o custo gerado.
Municípios com alta permanência e baixo custo podem indicar maior eficiência 
ou tratamentos menos complexos.
*/
SELECT
    m.municipio,
    ROUND(AVG(f.media_permanencia), 2) AS dias_medios,
    ROUND(AVG(f.valor_medio_internacao), 2) AS custo_medio
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
GROUP BY m.cod_ibge
ORDER BY dias_medios DESC;