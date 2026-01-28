import sqlite3
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Conexão com o banco
conn = sqlite3.connect('../data/processed/sus.db')

# --- GRÁFICO 1: Evolução das Internações (Linha) ---
query_linha = """
SELECT ano, SUM(internacoes) as total_internacoes 
FROM fato_internacoes 
GROUP BY ano 
ORDER BY ano
"""
df_linha = pd.read_sql_query(query_linha, conn)

plt.figure(figsize=(10, 5))
sns.lineplot(data=df_linha, x='ano', y='total_internacoes', marker='o', color='teal', linewidth=2.5)
plt.title('Evolução Nacional de Internações (2019-2025)', fontsize=14)
plt.grid(True, linestyle='--', alpha=0.7)
plt.ylabel('Qtd Internações')
plt.show()

# --- GRÁFICO 2: Custo Médio por UF em 2024 (Barras) ---
query_barras = """
SELECT m.uf_sigla, AVG(f.valor_medio_internacao) as custo_medio
FROM fato_internacoes f
JOIN dim_municipio m ON f.cod_municipio_ibge = m.cod_ibge
WHERE f.ano = '2024'
GROUP BY m.uf_sigla
ORDER BY custo_medio DESC
"""
df_barras = pd.read_sql_query(query_barras, conn)

plt.figure(figsize=(12, 6))
sns.barplot(data=df_barras, x='uf_sigla', y='custo_medio', palette='viridis')
plt.title('Custo Médio por Internação por UF (Ano Base: 2024)', fontsize=14)
plt.xticks(rotation=45)
plt.ylabel('Valor Médio (R$)')
plt.show()

conn.close()