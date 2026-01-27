-- Passo 1: Importar linha completa
DROP TABLE IF EXISTS temp_completa;
CREATE TABLE temp_completa (linha TEXT);

.mode csv
.import 'C:/Users/waltuiro.neto/OneDrive - Unimed Rio Verde/01 - Projeto SQL/data/raw/ibge_municipios.csv' temp_completa

-- Passo 2: Remover cabeçalho
DELETE FROM temp_completa WHERE linha LIKE '%cod_ibge%';

-- Passo 3: Separar usando uma função mais simples
DROP TABLE IF EXISTS temp_separada;
CREATE TABLE temp_separada AS
SELECT
    CAST(
        TRIM(SUBSTR(linha, 1, INSTR(linha, ';') - 1))
        AS INTEGER
    ) AS cod_ibge,
    TRIM(
        SUBSTR(
            linha,
            INSTR(linha, ';') + 1,
            INSTR(SUBSTR(linha, INSTR(linha, ';') + 1), ';') - 1
        )
    ) AS municipio,
    TRIM(
        SUBSTR(
            linha,
            INSTR(linha, ';') +
            INSTR(SUBSTR(linha, INSTR(linha, ';') + 1), ';') + 1
        )
    ) AS uf
FROM temp_completa
WHERE linha IS NOT NULL
  AND linha <> '';

-- Passo 4: Verificar
SELECT * FROM temp_separada LIMIT 5;

-- Passo 5: Inserir na tabela final
INSERT INTO dim_municipio (cod_ibge, municipio, nome_uf)
SELECT cod_ibge, municipio, uf FROM temp_separada;

-- Passo 6: Limpar e verificar
DROP TABLE temp_completa;
DROP TABLE temp_separada;
DROP TABLE temp_municipios;

SELECT '✅ ' || COUNT(*) || ' municípios importados' FROM dim_municipio;