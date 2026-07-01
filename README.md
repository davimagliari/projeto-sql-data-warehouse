# 📊 Data Warehouse and Analytics Project

Fala, pessoal! Bem-vindos ao repositório do meu projeto prático de Data Warehouse e Analytics.

Construí esse projeto do zero para aplicar na prática o que venho estudando sobre engenharia e análise de dados, simulando um cenário real do mercado. A ideia foi pegar dados bagunçados de dois sistemas diferentes (um ERP e um CRM) e transformar em informações estruturadas que ajudem a tomar decisões de negócio.

---

## 🚀 Project Overview (Visão Geral do Projeto)

O escopo do projeto abrange todo o pipeline de dados, estruturado nas seguintes etapas:
1. **Data Architecture:** Desenho e implementação de um Data Warehouse moderno utilizando a **Medallion Architecture** (camadas Bronze, Silver e Gold).
2. **ETL Pipelines:** Processos de extração, limpeza, padronização e carga de dados utilizando SQL Server.
3. **Data Modeling:** Desenvolvimento de tabelas Fato e Dimensão sob o modelo **Star Schema**, otimizado para alta performance em consultas analíticas.
4. **Data Analytics:** Implementação de validações de qualidade de dados (Quality Checks) e scripts para geração de relatórios de negócios.

---

## 🛠️ Important Links & Tools (Ferramentas Utilizadas)

* **SQL Server Express & SSMS:** Motor de banco de dados e interface para desenvolvimento de todos os scripts DDL e DML.
* **GitHub:** Versionamento de código e repositório central da documentação.
* **Notion:** Planejamento ágil, gerenciamento do backlog de tarefas e levantamento de requisitos.
* **Mermaid JS:** Ferramenta utilizada para a criação de diagramas de arquitetura, fluxos de ETL e modelagem de dados diretamente via código (Docs as Code), garantindo uma documentação técnica limpa e de fácil manutenção.

---

## 🏗️ Data Architecture (Arquitetura de Dados)

O fluxo de dados segue o padrão de arquitetura Medalhão, garantindo a governança, rastreabilidade e qualidade da informação em cada etapa:

* **🥉 Bronze Layer:** Armazenamento dos dados brutos (*raw data*) extraídos diretamente dos sistemas de origem, sem alterações.
* **🥈 Silver Layer:** Camada de consolidação e qualidade. Realiza a limpeza, padronização de tipos de dados, tratamento de nulos e integração das fontes ERP e CRM.
* **🥇 Gold Layer:** Camada de negócios modelada em **Star Schema** (tabelas Fato e Dimensão), estruturada e indexada para consumo por ferramentas de BI e relatórios gerenciais.

*(Os diagramas visuais detalhados de cada camada estão disponíveis na pasta [docs/](./docs/))*

---

## 📁 Repository Structure (Estrutura do Repositório)

```text
sql-data-warehouse-project/
├── docs/                       # Documentação técnica e diagramas (Mermaid)
│   ├── data_architecture.md    # Diagrama de ingestão de dados (Sources -> Bronze)
│   ├── data_flow.md            # Fluxo completo de ponta a ponta
│   ├── data_integration.md     # Mapeamento de chaves e relacionamentos (ERP + CRM)
│   ├── data_model.md           # Modelagem dimensional Star Schema (ERD)
│   ├── ETL.md                  # Mapeamento do fluxo Bronze -> Silver
│   └── data_catalog.md         # Dicionário de dados da camada Gold
├── scripts/                    # Scripts SQL organizados por camada
│   ├── bronze/
│   ├── silver/
│   └── gold/
├── tests/                      # Scripts de testes e integridade de dados
│   ├── quality_checks_silver.sql
│   └── quality_checks_gold.sql
└── README.md                   # Documentação principal do repositório
```

---

## 🌟 Sobre Mim

Eu sou o **Davi Magliari**, estudante de Tecnologia em Banco de Dados na **Universidade Presbiteriana Mackenzie**.

Desenvolvo projetos práticos com foco em Engenharia e Análise de Dados para consolidar conceitos de arquitetura de dados, modelagem dimensional e otimização de queries, preparando meu perfil para os desafios reais e técnicos do mercado de tecnologia.
