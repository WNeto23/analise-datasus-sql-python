-- Criar índice para buscas por Município
CREATE INDEX idx_fato_municipio ON fato_internacoes (cod_municipio_ibge);

-- Criar índice para buscas por Período
CREATE INDEX idx_fato_periodo ON fato_internacoes (ano, mes);