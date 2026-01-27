import pandas as pd
import sqlite3
import re
import os

# CONFIGURAÇÃO DE CAMINHOS BASEADA NA SUA ESTRUTURA
# Para sair de 'sql/Tratamento_DATASUS' e chegar em 'data/raw':
pasta_raw = os.path.join('..', '..', 'data', 'raw')
# Para sair de 'sql/Tratamento_DATASUS' e chegar em 'data/processed/sus.db':
db_path = os.path.join('..', '..', 'data', 'processed', 'sus.db')

arquivos = {
    'internacoes.csv': 'internacoes',
    'dias_permanencia.csv': 'dias_permanencia',
    'media_permanencia.csv': 'media_permanencia',
    'valor_medio_intern.csv': 'valor_medio_internacao',
    'valor_total.csv': 'valor_total'
}

mapa_meses = {
    'Jan': '01', 'Fev': '02', 'Mar': '03', 'Abr': '04', 'Mai': '05', 'Jun': '06',
    'Jul': '07', 'Ago': '08', 'Set': '09', 'Out': '10', 'Nov': '11', 'Dez': '12'
}

def processar_datasus(nome_arquivo, nome_coluna):
    caminho_completo = os.path.abspath(os.path.join(pasta_raw, nome_arquivo))
    
    if not os.path.exists(caminho_completo):
        print(f"ERRO: Não encontrei o arquivo em: {caminho_completo}")
        return None

    # DATASUS usa encoding latin-1 e separador ;
    df = pd.read_csv(caminho_completo, sep=';', encoding='latin-1', skiprows=3, skipfooter=12, engine='python')
    
    # Extrai o código IBGE (pega os primeiros 6 dígitos)
    df['cod_municipio_ibge'] = df.iloc[:, 0].astype(str).str.extract(r'(\d{6})')
    df = df.dropna(subset=['cod_municipio_ibge'])
    
    colunas_data = [c for c in df.columns if '/' in c]
    
    # Unpivot (Melt)
    df_long = df.melt(id_vars=['cod_municipio_ibge'], value_vars=colunas_data, 
                      var_name='periodo', value_name=nome_coluna)
    
    # Tratamento de Data
    df_long[['ano', 'mes_txt']] = df_long['periodo'].str.split('/', expand=True)
    df_long['mes'] = df_long['mes_txt'].map(mapa_meses)
    
    # Limpeza Numérica (remove pontos de milhar e troca , por .)
    df_long[nome_coluna] = df_long[nome_coluna].astype(str).str.replace('.', '', regex=False).str.replace(',', '.', regex=False)
    df_long[nome_coluna] = pd.to_numeric(df_long[nome_coluna].replace('-', '0'), errors='coerce').fillna(0)
    
    return df_long[['cod_municipio_ibge', 'ano', 'mes', nome_coluna]]

# EXECUÇÃO
dfs_processados = []
for arq, metrica in arquivos.items():
    print(f"Lendo: {arq}...")
    res = processar_datasus(arq, metrica)
    if res is not None:
        dfs_processados.append(res)

if dfs_processados:
    print("Mesclando tabelas...")
    fato_final = dfs_processados[0]
    for prox in dfs_processados[1:]:
        fato_final = pd.merge(fato_final, prox, on=['cod_municipio_ibge', 'ano', 'mes'], how='outer')

    try:
        conn = sqlite3.connect(db_path)
        # O index=False evita criar a coluna 'index' no SQLite
        # if_exists='append' adiciona à sua tabela fato_internacoes já criada
        fato_final.to_sql('fato_internacoes', conn, if_exists='append', index=False)
        conn.close()
        print(f"\nCARGA CONCLUÍDA! {len(fato_final)} registros inseridos em 'sus.db'.")
    except Exception as e:
        print(f"ERRO AO SALVAR NO BANCO: {e}")