<<<<<<< HEAD
# 📊 Análise de Internações Hospitalares no Brasil (2019–2025)

![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)
![License](https://img.shields.io/github/license/SEU_USUARIO/NOME_REPOSITORIO)
![Last Commit](https://img.shields.io/github/last-commit/SEU_USUARIO/NOME_REPOSITORIO)
![Top Language](https://img.shields.io/github/languages/top/SEU_USUARIO/NOME_REPOSITORIO)
![Repo Size](https://img.shields.io/github/repo-size/SEU_USUARIO/NOME_REPOSITORIO)

## 📌 Visão Geral
Este projeto realiza o processamento e análise de dados públicos de saúde, integrando as bases do **DATASUS (SIH/SUS)** e do **IBGE**. O foco é transformar dados brutos em inteligência sobre o comportamento das internações hospitalares no Brasil entre 2019 e 2025.

**Objetivos Estratégicos:**
* **Engenharia de Dados:** Extração e normalização de dados governamentais.
* **Modelagem Analítica:** Estruturação de dados para facilitar consultas complexas.
* **Insights de Gestão:** Mapear custos, sazonalidade e eficiência hospitalar.

---

## 🏗️ Arquitetura e Modelagem

### 🔄 Pipeline ETL (Python)
Os dados originais do TabNet (formato `.csv` ou `.dbf`) apresentam estrutura *wide* (larga). O pipeline desenvolvido em **Python/Pandas** realiza:
1.  **Limpeza:** Remoção de ruídos, rodapés e tratamento de valores ausentes.
2.  **Transformação:** Conversão de formato *Wide* para *Long* (Melt) para análise temporal.
3.  **Normalização:** Padronização de datas e chaves geográficas (Código IBGE).
4.  **Carga:** Ingestão automatizada em banco de dados **SQLite/PostgreSQL**.

### 🧱 Modelo de Dados (Star Schema)
Utilizamos o padrão de modelagem dimensional para otimizar a performance das consultas SQL.

```mermaid
erDiagram
    dim_municipio ||--o{ fato_internacoes : "possui"
    dim_municipio {
        int cod_ibge PK
        string municipio
        string uf_sigla
        string nome_uf
    }
    fato_internacoes {
        int cod_municipio_ibge FK
        int ano
        int mes
        int internacoes
        float valor_total
        float valor_medio_internacao
        float media_permanencia
    }

🔍 Principais Insights
📈 Recuperação Pós-Pandemia
Após a queda em 2020 (foco em COVID-19 e suspensão de eletivas), o ano de 2024 registrou o maior pico de internações gerais da série histórica.

💰 Concentração de Custos
Capitais e polos regionais detêm o maior ticket médio de internação, refletindo a concentração de leitos de alta complexidade.

📆 Padrão Sazonal
Identificou-se uma redução sistemática de volume em fevereiro e dezembro, com alta estabilidade no segundo semestre.

🏥 Eficiência Hospitalar
Análise das UFs onde a permanência hospitalar prolongada impacta diretamente a elevação do custo médio por paciente.

🛠️ Tecnologias Utilizadas
Python (Pandas) – Engine de ETL e tratamento de dados.

SQL – Consultas analíticas, agregações e Window Functions.

SQLite / PostgreSQL – Armazenamento e gerenciamento de banco de dados.

Mermaid.js – Documentação visual da arquitetura de dados.

📎 Próximos Passos
[ ] Implementar dashboard interativo (Streamlit ou Power BI).

[ ] Adicionar segmentação por tipo de atendimento (Eletivo vs. Urgência).

[ ] Criar scripts de automação para atualização mensal dos dados.

👤 Autor
Waltuiro Antonio dos Santos Neto Analista de Dados | Ciência de Dados

Projeto desenvolvido para fins educacionais e demonstração de competências técnicas em Data Analytics.
=======
# analise-datasus-sql-python
Projeto de ETL e análise de dados hospitalares do DATASUS (2019-2025) utilizando Python e SQLite
>>>>>>> 426a575308d0e8298f0bd05a9a454bea498d5943
