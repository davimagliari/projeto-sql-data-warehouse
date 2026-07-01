# ETL Process (Bronze to Silver)

This diagram represents the ETL (Extract, Transform, Load) mapping from the Bronze layer to the Silver layer. In this phase, data is cleansed and standardized, maintaining a 1:1 table relationship.

```mermaid
graph LR
    classDef bronze fill:#ffb347,stroke:#333,stroke-width:2px,color:white;
    classDef silver fill:#666666,stroke:#333,stroke-width:2px,color:white;
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

    ERP --> b_px & b_az & b_loc
    CRM --> b_prd & b_sales & b_cust

    b_px -- 1:1 --> s_px
    b_az -- 1:1 --> s_az
    b_loc -- 1:1 --> s_loc
    b_prd -- 1:1 --> s_prd
    b_sales -- 1:1 --> s_sales
    b_cust -- 1:1 --> s_cust
```
