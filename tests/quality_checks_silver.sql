/*
===============================================================================
Quality Checks: Silver Layer
===============================================================================
Script Purpose:
    This script performs comprehensive data quality checks on the 'silver' schema tables.
    It checks for:
        - NULL or duplicate Primary Keys.
        - Unwanted spaces in string columns.
        - Data standardization and consistency in categorical columns.
        - Out-of-range dates or logical date conflicts.
        - Mathematical consistency in sales details.
===============================================================================
*/

-- ====================================================================
-- 1. Tabela: silver.crm_cust_info
-- ====================================================================

-- 1.1 Check for NULLs or Duplicates in Primary Key
SELECT cst_id, COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;
GO

-- 1.2 Check for Unwanted Spaces
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);
GO

-- 1.3 Data Standardization & Consistency
SELECT DISTINCT cst_material_status
FROM silver.crm_cust_info;

SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;
GO


-- ====================================================================
-- 2. Tabela: silver.crm_prd_info
-- ====================================================================

-- 2.1 Check for NULLs or Duplicates in Primary Key
SELECT prd_id, COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;
GO

-- 2.2 Check for Unwanted Spaces
SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);
GO

-- 2.3 Check for NULLs or Negative Values in Cost
SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;
GO

-- 2.4 Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;
GO

-- 2.5 Check for Logical Date Conflicts (End Date older than Start Date)
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;
GO


-- ====================================================================
-- 3. Tabela: silver.crm_sales_details
-- ====================================================================

-- 3.1 Check for Invalid Sales, Quantity, or Prices (Negative or Zero values)
SELECT *
FROM silver.crm_sales_details
WHERE sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0;
GO

-- 3.2 Check for Mathematical Inconsistency (Sales != Quantity * Price)
SELECT *
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * ABS(sls_price);
GO

-- 3.3 Check for Invalid Order Dates (Shipment happened before the Order)
SELECT *
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;
GO


-- ====================================================================
-- 4. Tabela: silver.erp_cust_az12
-- ====================================================================

-- 4.1 Check for NULLs or Duplicates in Primary Key (cid)
SELECT cid, COUNT(*)
FROM silver.erp_cust_az12
GROUP BY cid
HAVING COUNT(*) > 1 OR cid IS NULL;
GO

-- 4.2 Check for Out-of-Range Birthdates (People born in the future or way too old)
SELECT bdate
FROM silver.erp_cust_az12
WHERE bdate > GETDATE() OR bdate < '1900-01-01';
GO

-- 4.3 Data Standardization & Consistency
SELECT DISTINCT gen
FROM silver.erp_cust_az12;
GO


-- ====================================================================
-- 5. Tabela: silver.erp_loc_a101
-- ====================================================================

-- 5.1 Check for NULLs or Duplicates in Primary Key (cid)
SELECT cid, COUNT(*)
FROM silver.erp_loc_a101
GROUP BY cid
HAVING COUNT(*) > 1 OR cid IS NULL;
GO

-- 5.2 Data Standardization & Consistency (Standardized Country Names)
SELECT DISTINCT cntry
FROM silver.erp_loc_a101
ORDER BY cntry;
GO


-- ====================================================================
-- 6. Tabela: silver.erp_px_cat_g1v2
-- ====================================================================

-- 6.1 Check for NULLs or Duplicates in Primary Key (id)
SELECT id, COUNT(*)
FROM silver.erp_px_cat_g1v2
GROUP BY id
HAVING COUNT(*) > 1 OR id IS NULL;
GO

-- 6.2 Check for Unwanted Whitespaces
SELECT *
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat);
GO

-- 6.3 Data Standardization & Consistency
SELECT DISTINCT cat
FROM silver.erp_px_cat_g1v2;

SELECT DISTINCT subcat
FROM silver.erp_px_cat_g1v2;

SELECT DISTINCT maintenance
FROM silver.erp_px_cat_g1v2;
GO
