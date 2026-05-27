/*
===============================================================================
Stored Procedure: Carga da Camada Bronze (Bronze Layer)
===============================================================================
Objetivo do Script:
    Esta stored procedure é responsável por popular as tabelas da camada bronze 
    do Data Warehouse. Ela realiza uma carga total (Full Load), truncando as 
    tabelas existentes e inserindo os dados brutos a partir de arquivos CSV 
    dos sistemas CRM e ERP usando o comando BULK INSERT.

Funcionalidades Adicionais:
    - Tratamento de Erros: Utiliza bloco TRY...CATCH para capturar e relatar 
      falhas durante a execução sem travar o servidor.
    - Monitoramento de Performance: Calcula e exibe o tempo de execução (em 
      segundos) para cada tabela individualmente e para o lote completo (Batch).
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME;
    DECLARE @batch_start_time DATETIME, @batch_end_time DATETIME; 
    
    BEGIN TRY 
        SET @batch_start_time = GETDATE(); 
        
        PRINT '=====================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=====================================';

        ---------------------------------------------------------
        -- CARGA DE DADOS: SISTEMA CRM
        ---------------------------------------------------------
        PRINT '-----------------------------';
        PRINT 'Loading CRM tables';
        PRINT '-----------------------------';
  
        -- 1. Clientes (CRM)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.crm_cust_info'
        TRUNCATE TABLE bronze.crm_cust_info;
       
        PRINT '>> inserting data into: bronze.crm_cust_info'
        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 

        -- 2. Produtos (CRM)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.crm_prd_info'
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> inserting data into: bronze.crm_prd_info'
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 

        -- 3. Vendas (CRM)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.crm_sales_details'
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> inserting data into: bronze.crm_sales_details'
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 

        ---------------------------------------------------------
        -- CARGA DE DADOS: SISTEMA ERP
        ---------------------------------------------------------
        PRINT '-----------------------------';
        PRINT 'Loading ERP tables';
        PRINT '-----------------------------';

        -- 4. Clientes (ERP)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.erp_cust_az12'
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> inserting data into: bronze.erp_cust_az12'
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 

        -- 5. Localidades (ERP)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.erp_loc_a101'
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> inserting data into: bronze.erp_loc_a101'
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 

        -- 6. Categorias (ERP)
        SET @start_time = GETDATE();
        PRINT '>> truncating table: bronze.erp_px_cat_g1v2'
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> inserting data into: bronze.erp_px_cat_g1v2'
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\davim\Downloads\sql-data-warehouse-project(1)\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_time = GETDATE();
        PRINT '>> load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) as NVARCHAR) + ' seconds' 
        PRINT '>> -------------' 
        
        SET @batch_end_time = GETDATE(); 

        PRINT '=====================================';
        PRINT 'Bronze Layer loaded successfully!';
        PRINT '>> Total Batch Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) as NVARCHAR) + ' seconds';
        PRINT '=====================================';
    END TRY
    BEGIN CATCH 
        PRINT '=====================================';
        PRINT 'ERROR OCCURRED DURING BRONZE LAYER LOAD';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT '=====================================';
    END CATCH 
END;
