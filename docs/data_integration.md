# Data Integration Mapping

This diagram details how the distinct tables from the CRM and ERP systems relate to each other using specific foreign keys (like `prd_key`, `cst_id`, etc.) to form a unified view of Customers, Products, and Sales.

```mermaid
graph LR
    classDef crm fill:#dae8fc,stroke:#6c8ebf,stroke-width:2px,color:#000;
    classDef erp fill:#fff2cc,stroke:#d6b656,stroke-width:2px,color:#000;

    Sales[Registros Transacionais Vendas<br/>crm_sales_details]:::crm
    Prd[Info Atuais e Históricas Produtos<br/>crm_prd_info]:::crm
    Cust[Informações Clientes<br/>crm_cust_info]:::crm
    
    Cat[Informações Extras Categoria<br/>erp_px_cat_g1v2]:::erp
    CustExt[Informações Extras Data Nasc<br/>erp_cust_az12]:::erp
    Loc[Localização de Clientes Pais<br/>erp_loc_a101]:::erp

    Sales -- Conecta via prd_key --> Prd
    Sales -- Conecta via cst_id --> Cust
    
    Prd -- Conecta via id --> Cat
    Cust -- Conecta via cid --> CustExt
    Cust -- Conecta via cid --> Loc
```
