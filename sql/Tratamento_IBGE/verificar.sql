.headers on
.mode column
SELECT * FROM dim_municipio LIMIT 10;

-- 1. Verificar o total de municípios importados
SELECT COUNT(*) as total_municipios FROM dim_municipio;

-- 2. Verificar UFs distintas
SELECT nome_uf, COUNT(*) as quantidade 
FROM dim_municipio 
GROUP BY nome_uf 
ORDER BY nome_uf;

-- 3. Verificar municípios de um estado específico
SELECT * FROM dim_municipio 
WHERE nome_uf = 'São Paulo' 
LIMIT 5;

-- 4. Verificar se há códigos IBGE duplicados
SELECT cod_ibge, COUNT(*) as duplicatas
FROM dim_municipio
GROUP BY cod_ibge
HAVING COUNT(*) > 1;

-- 5. Verificar o nome completo de um município truncado
SELECT municipio, LENGTH(municipio) as tamanho
FROM dim_municipio 
WHERE cod_ibge = 110037;  -- Alto Alegre dos Parecis

-- 6. Verificar os primeiros e últimos códigos
SELECT MIN(cod_ibge) as menor_codigo, MAX(cod_ibge) as maior_codigo
FROM dim_municipio;