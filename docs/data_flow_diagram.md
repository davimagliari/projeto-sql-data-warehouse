# Data Flow Diagram (Pipeline Architecture)

This document describes the data flow architecture of the SQL Data Warehouse project, mapping the lifecycle of data from transactional sources into the final analytical layers.

## 1. Data Ingestion (Sources to Bronze Layer)
The initial phase extracts raw data directly from local transactional systems (CRM and ERP) and loads it without modifications into the Bronze layer.

```mermaid
graph LR
    classDef source fill:#ffcc00,stroke:#333,stroke-width:2px,color:black;
    classDef bronze fill:#ffebd6,stroke:#f39c12,stroke-width:2px,color:black;

    subgraph Sources [Sources]
        CRM:::source
        ERP:::source
    end

    subgraph Bronze [Bronze Layer]
        b1[crm_sales_details]:::bronze
        b2[crm_cust_info]:::bronze
        b3[crm_prd_info]:::bronze
        b4[erp_cust_az12]:::bronze
        b5[erp_loc_a101]:::bronze
        b6[erp_px_cat_g1v2]:::bronze
    end

    CRM --> b1 & b2 & b3
    ERP --> b4 & b5 & b6
```

## 2. Complete End-to-End Architecture
Once loaded into the Bronze layer, the data is cleansed, standardized, and transformed through the Silver and Gold layers.

```mermaid
graph LR
    classDef bronze fill:#ffb347,stroke:#333,stroke-width:2px,color:white;
    classDef silver fill:#666666,stroke:#333,stroke-width:2px,color:white;
    classDef gold fill:#d4af37,stroke:#333,stroke-width:2px,color:white;
    classDef sources fill:#fdfd96,stroke:#333,stroke-width:2px,color:black;

    subgraph Sources [SOURCES]
        ERP[ERP Fontes Locais]:::sources
        CRM[CRM Fontes Locais]:::sources
    end

    subgraph Bronze [BRONZE LAYER]
        b_px[erp_px_cat_g1v2]:::bronze
        b_az[erp_cust_az12]:::bronze
        b_loc[erp_loc_a101]:::bronze
        b_prd[crm_prd_info]:::bronze
        b_sales[crm_sales_details]:::bronze
        b_cust[crm_cust_info]:::bronze
    end

    subgraph Silver [SILVER LAYER]
        s_px[erp_px_cat_g1v2]:::silver
        s_az[erp_cust_az12]:::silver
        s_loc[erp_loc_a101]:::silver
        s_prd[crm_prd_info]:::silver
        s_sales[crm_sales_details]:::silver
        s_cust[crm_cust_info]:::silver
    end

    subgraph Gold [GOLD LAYER]
        g_fact[fact_sales]:::gold
        g_dim_cust[dim_customers]:::gold
        g_dim_prd[dim_products]:::gold
    end

    ERP --> b_px & b_az & b_loc
    CRM --> b_prd & b_sales & b_cust

    b_px -- 1:1 --> s_px
    b_az -- 1:1 --> s_az
    b_loc -- 1:1 --> s_loc
    b_prd -- 1:1 --> s_prd
    b_sales -- 1:1 --> s_sales
    b_cust -- 1:1 --> s_cust

    s_sales & s_cust & s_prd & s_az & s_loc & s_px --> g_fact
    s_cust & s_az & s_loc --> g_dim_cust
    s_prd & s_px --> g_dim_prd
```
