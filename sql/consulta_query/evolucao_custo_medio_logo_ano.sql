-- Ideal para entender a inflação médica hospitalar no período de 2019 a 2025.
SELECT
    ano,
    ROUND(AVG(valor_medio_internacao), 2) AS custo_medio_nacional
FROM fato_internacoes
GROUP BY ano
ORDER BY ano;