-- Adicionar coluna de sigla da UF (se ainda não tiver)
ALTER TABLE dim_municipio ADD COLUMN uf_sigla TEXT;

-- Popular siglas
UPDATE dim_municipio SET uf_sigla = 'AC' WHERE nome_uf = 'Acre';
UPDATE dim_municipio SET uf_sigla = 'AL' WHERE nome_uf = 'Alagoas';
UPDATE dim_municipio SET uf_sigla = 'AP' WHERE nome_uf = 'Amapá';
UPDATE dim_municipio SET uf_sigla = 'AM' WHERE nome_uf = 'Amazonas';
UPDATE dim_municipio SET uf_sigla = 'BA' WHERE nome_uf = 'Bahia';
UPDATE dim_municipio SET uf_sigla = 'CE' WHERE nome_uf = 'Ceará';
UPDATE dim_municipio SET uf_sigla = 'DF' WHERE nome_uf = 'Distrito Federal';
UPDATE dim_municipio SET uf_sigla = 'ES' WHERE nome_uf = 'Espírito Santo';
UPDATE dim_municipio SET uf_sigla = 'GO' WHERE nome_uf = 'Goiás';
UPDATE dim_municipio SET uf_sigla = 'MA' WHERE nome_uf = 'Maranhão';
UPDATE dim_municipio SET uf_sigla = 'MT' WHERE nome_uf = 'Mato Grosso';
UPDATE dim_municipio SET uf_sigla = 'MS' WHERE nome_uf = 'Mato Grosso do Sul';
UPDATE dim_municipio SET uf_sigla = 'MG' WHERE nome_uf = 'Minas Gerais';
UPDATE dim_municipio SET uf_sigla = 'PA' WHERE nome_uf = 'Pará';
UPDATE dim_municipio SET uf_sigla = 'PB' WHERE nome_uf = 'Paraíba';
UPDATE dim_municipio SET uf_sigla = 'PR' WHERE nome_uf = 'Paraná';
UPDATE dim_municipio SET uf_sigla = 'PE' WHERE nome_uf = 'Pernambuco';
UPDATE dim_municipio SET uf_sigla = 'PI' WHERE nome_uf = 'Piauí';
UPDATE dim_municipio SET uf_sigla = 'RJ' WHERE nome_uf = 'Rio de Janeiro';
UPDATE dim_municipio SET uf_sigla = 'RN' WHERE nome_uf = 'Rio Grande do Norte';
UPDATE dim_municipio SET uf_sigla = 'RS' WHERE nome_uf = 'Rio Grande do Sul';
UPDATE dim_municipio SET uf_sigla = 'RO' WHERE nome_uf = 'Rondônia';
UPDATE dim_municipio SET uf_sigla = 'RR' WHERE nome_uf = 'Roraima';
UPDATE dim_municipio SET uf_sigla = 'SC' WHERE nome_uf = 'Santa Catarina';
UPDATE dim_municipio SET uf_sigla = 'SP' WHERE nome_uf = 'São Paulo';
UPDATE dim_municipio SET uf_sigla = 'SE' WHERE nome_uf = 'Sergipe';
UPDATE dim_municipio SET uf_sigla = 'TO' WHERE nome_uf = 'Tocantins';

-- Verificar
SELECT nome_uf, uf_sigla, COUNT(*) as total
FROM dim_municipio
GROUP BY nome_uf, uf_sigla
ORDER BY nome_uf;