# 📊 Data Warehouse and Analytics Project

Fala, pessoal! Bem-vindos ao repositório do meu projeto prático de Data Warehouse e Analytics.

Construí esse projeto do zero para aplicar na prática o que venho estudando sobre engenharia e análise de dados, simulando um cenário real do mercado. A ideia foi pegar dados bagunçados de dois sistemas diferentes (um ERP e um CRM) e transformar em informações estruturadas que ajudem a tomar decisões de negócio.

---

## 🚀 Project Overview (Visão Geral do Projeto)

Este projeto engloba todo o ciclo de vida dos dados, focando em:
1. **Data Architecture:** Desenho de um Data Warehouse moderno utilizando a **Medallion Architecture** (camadas Bronze, Silver e Gold).
2. **ETL Pipelines:** Extração, limpeza e carga de dados dos sistemas de origem utilizando SQL Server.
3. **Data Modeling:** Desenvolvimento de tabelas Fato e Dimensão otimizadas para consultas analíticas (Star Schema).
4. **Data Analytics:** Criação de consultas SQL (Data Quality checks e relatórios) para responder perguntas de negócio e extrair tendências.

---

## 🛠️ Important Links & Tools (Ferramentas Utilizadas)

* **SQL Server Express & SSMS:** Motor de banco de dados e interface para gerenciamento e criação de todos os scripts DDL e DML.
* **GitHub:** Versionamento de código e documentação estruturada (Docs as Code).
* **Notion:** Gerenciamento das etapas do projeto (Kanban) e organização de requisitos.
* **Mermaid JS:** Utilizado para desenhar a arquitetura de dados, fluxos de ETL e a modelagem Entidade-Relacionamento nativamente via código (Markdown), substituindo ferramentas estáticas de imagem.

---

## 🏗️ Data Architecture (Arquitetura de Dados)

A arquitetura segue o padrão Medallion em três camadas principais para garantir a governança e a qualidade da informação:

* **🥉 Bronze Layer:** Armazena os dados brutos (*raw data*) exatamente como vieram dos sistemas de origem.
* **🥈 Silver Layer:** Camada de limpeza, padronização e normalização. Integra os dados do ERP e CRM, resolvendo inconsistências.
* **🥇 Gold Layer:** Camada final de negócios, modelada em **Star Schema** (tabelas Fato e Dimensão), pronta para consumo ágil por ferramentas de BI e análises avançadas.

*(Para visualizar os diagramas completos de fluxo e modelagem, acesse os arquivos na pasta [docs/](./docs/))*

---

## 📁 Repository Structure (Estrutura do Repositório)

```text
sql-data-warehouse-project/
├── docs/                       # Documentação e diagramas do projeto (Mermaid)
│   ├── data_architecture.md    # Diagrama de ingestão de dados
│   ├── data_flow.md            # Fluxo completo de ponta a ponta
│   ├── data_integration.md     # Mapeamento de chaves (ERP + CRM)
│   ├── data_model.md           # Modelagem Star Schema (ERD)
│   ├── ETL.md                  # Fluxo de limpeza Bronze -> Silver
│   └── data_catalog.md         # Dicionário de dados da camada Gold
├── scripts/                    # Scripts SQL para criação de tabelas e views
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── tests/                      # Scripts de Quality Checks (testes de integridade)
│   ├── quality_checks_silver.sql
│   └── quality_checks_gold.sql
└── README.md                   # Visão geral do projeto

🌟 Sobre Mim

Eu sou o Davi Magliari, estudante de Tecnologia em Banco de Dados na Universidade Presbiteriana Mackenzie.

Desenvolvo projetos práticos com foco em Engenharia e Análise de Dados para consolidar conceitos de arquitetura de dados, modelagem dimensional e otimização de queries, preparando meu perfil para os desafios reais e técnicos do mercado de tecnologia.
