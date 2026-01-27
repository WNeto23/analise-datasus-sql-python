/*
Esta análise ajuda a identificar picos em meses específicos (como aumento de problemas respiratórios no inverno).
*/
SELECT
    mes,
    ROUND(AVG(internacoes),2 )AS media_internacoes_mensal
FROM fato_internacoes
GROUP BY mes
ORDER BY mes;