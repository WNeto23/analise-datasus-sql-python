CREATE TABLE fato_internacoes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cod_municipio_ibge INTEGER NOT NULL,
    ano INTEGER NOT NULL,
    mes TEXT NOT NULL,  -- 'Jan', 'Fev', etc.
    internacoes INTEGER,
    valor_total REAL,
    valor_medio_internacao REAL,
    dias_permanencia INTEGER,
    media_permanencia REAL,
    data_processamento DATE DEFAULT CURRENT_DATE,
    
    FOREIGN KEY (cod_municipio_ibge) REFERENCES dim_municipio(cod_ibge),
    UNIQUE(cod_municipio_ibge, ano, mes)
);

-- Criar índices para performance
CREATE INDEX idx_fato_municipio ON fato_internacoes(cod_municipio_ibge);
CREATE INDEX idx_fato_ano_mes ON fato_internacoes(ano, mes);
CREATE INDEX idx_fato_data ON fato_internacoes(ano, mes, cod_municipio_ibge);