/* ============================================================
   DDL Script: Create Silver Tables

   Script Purpose:
     This script drops and recreates the tables in the 'silver' schema.
     Run this script to reset the SILVER layer structure before loading data.
   ============================================================ */
if OBJECT_ID('silver.crm_cust_info','U') is not null
    drop table silver.crm_cust_info;
Go
Create table silver.crm_cust_info (
    cst_id int,
    cst_key NVARCHAR(50),
    cst_firstname nVarchar(50),
    cst_lastname nvarchar(50),
    cst_martial_status nvarchar(50),
    cst_gndr nvarchar(50),
    cst_create_date Date,
    dwh_create_date Datetime2 Default GetDate()  
);
Go

if OBJECT_ID('silver.crm_prd_info','U') is not null
    drop table silver.crm_prd_info;
Go
Create table silver.crm_prd_info (
    prd_id int,
    cat_id nvarchar(50),
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost int,
    prd_line nvarchar(50),
    prd_start_dt date,
    prd_end_dt date,
    dwh_create_date Datetime2 Default GetDate()
);
Go
  
if OBJECT_ID('silver.crm_sales_details','U') is not null
    drop table silver.crm_sales_details;
Go
CREATE TABLE silver.crm_sales_details (
    sls_ord_num     nVARCHAR(50),
    sls_prd_key     nVARCHAR(50),            
    sls_cust_id     INT,               
    sls_order_dt    DATE,              
    sls_ship_dt     DATE,              
    sls_due_dt      DATE,             
    sls_sales       int,     
    sls_quantity    int,               
    sls_price       int,
    dwh_create_date Datetime2 Default GetDate()
);
Go
if OBJECT_ID('silver.erp_cust_az12','U') is not null
    drop table silver.erp_cust_az12;
Go
CREATE TABLE silver.erp_cust_az12 (
    CID     NVARCHAR(50),
    BDATE   DATE,
    GEN     NVARCHAR(10),
    dwh_create_date Datetime2 Default GetDate()
);
Go
if OBJECT_ID('silver.erp_loc_a101','U') is not null
    drop table silver.erp_loc_a101;
Go
CREATE TABLE silver.erp_loc_a101 (
    CID     NVARCHAR(50),
    CNTRY   NVARCHAR(50),
    dwh_create_date Datetime2 Default GetDate()
);
Go
if OBJECT_ID('silver.erp_px_cat_g1v2','U') is not null
    drop table silver.erp_px_cat_g1v2;
Go
CREATE TABLE silver.erp_px_cat_g1v2 (
    ID           VARCHAR(50),
    CAT          VARCHAR(50),
    SUBCAT       VARCHAR(50),
    MAINTENANCE  VARCHAR(5),
    dwh_create_date Datetime2 Default GetDate()
);
Go
