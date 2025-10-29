/*
================================
DDL Script: Create bronze tables
================================
Script purpouse:
  This script creates tables in the bronze schema,
  dropping the tables if they already exist.
  Run this script to re-define the DDL structure of bronze tables
*/
if OBJECT_ID('bronze.crm_cust_info','U') is not null
    drop table bronze.crm_cust_info
Create table bronze.crm_cust_info (
    cst_id int,
    cst_key NVARCHAR(50),
    cst_firstname nVarchar(50),
    cst_lastname nvarchar(50),
    cst_martial_status nvarchar(50),
    cst_gndr nvarchar(50),
    cst_create_date Date
);

if OBJECT_ID('bronze.crm_prd_info','U') is not null
    drop table bronze.crm_prd_info
Create table bronze.crm_prd_info (
    prd_id int,
    prd_key nvarchar(50),
    prd_nm nvarchar(50),
    prd_cost int,
    prd_line nvarchar(50),
    prd_start_dt date,
    prd_end_dt date
);

if OBJECT_ID('bronze.crm_sales_details','U') is not null
    drop table bronze.crm_sales_details
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num     nVARCHAR(50),
    sls_prd_key     nVARCHAR(50),            
    sls_cust_id     INT,               
    sls_order_dt    int,              
    sls_ship_dt     int,              
    sls_due_dt      int,             
    sls_sales       int,     
    sls_quantity    int,               
    sls_price       int     
);

if OBJECT_ID('bronze.erp_cust_az12','U') is not null
    drop table bronze.erp_cust_az12
CREATE TABLE bronze.erp_cust_az12 (
    CID     NVARCHAR(50),
    BDATE   DATE,
    GEN     NVARCHAR(10)
);

if OBJECT_ID('bronze.erp_loc_a101','U') is not null
    drop table bronze.erp_loc_a101
CREATE TABLE bronze.erp_loc_a101 (
    CID     NVARCHAR(50),
    CNTRY   NVARCHAR(50)
);

if OBJECT_ID('bronze.erp_px_cat_g1v2','U') is not null
    drop table bronze.erp_px_cat_g1v2
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID           VARCHAR(50),
    CAT          VARCHAR(50),
    SUBCAT       VARCHAR(50),
    MAINTENANCE  VARCHAR(5)
);

