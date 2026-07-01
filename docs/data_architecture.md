# Data Architecture (Data Ingestion)

This document illustrates the initial phase of the data pipeline, showing how raw data is extracted from the local transactional systems (CRM and ERP) and loaded into the Bronze Layer.

```mermaid
graph LR
    %% Definições de Estilo
    classDef source fill:#ffcc00,stroke:#333,stroke-width:2px,color:black;
    classDef bronze fill:#ffebd6,stroke:#f39c12,stroke-width:2px,color:black;

    %% Fontes de Dados
    subgraph Sources [Sources]
        CRM:::source
        ERP:::source
    end

    %% Camada Bronze
    subgraph Bronze [Bronze Layer]
        b1[crm_sales_details]:::bronze
        b2[crm_cust_info]:::bronze
        b3[crm_prd_info]:::bronze
        b4[erp_cust_az12]:::bronze
        b5[erp_loc_a101]:::bronze
        b6[erp_px_cat_g1v2]:::bronze
    end

    %% Conexões de Extração
    CRM --> b1 & b2 & b3
    ERP --> b4 & b5 & b6
```
