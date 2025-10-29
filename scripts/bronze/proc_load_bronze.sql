/*
======================================================
Stored Porcedure: Load Bronze Layer (Source -> Bronze)
======================================================
Script purpouse:
  Loading data from external sources into the bronze layer
Usage example:
  EXEC bronze.load_bronze
*/
Create or alter procedure bronze.load_bronze as 
Begin
	declare @start_time DATETIME, @end_time DATETIME
	declare @total_start DATETIME, @total_end DATETIME

	Begin try
		
		set @total_start = GETDATE();
		print '========================='
		print 'Starting to load all files...'
		print '========================='

		-- crm_cust_info
		set @start_time = GETDATE();
		print 'Truncating table bronze.crm_cust_info...'
		truncate table bronze.crm_cust_info;
		print 'Bulk inserting data into bronze.crm_cust_info...'
		bulk insert bronze.crm_cust_info 
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.crm_cust_info'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		-- crm_prd_info
		set @start_time = GETDATE();
		print 'Truncating table bronze.crm_prd_info...'
		truncate table bronze.crm_prd_info;
		print 'Bulk inserting data into bronze.crm_prd_info...'
		bulk insert bronze.crm_prd_info
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.crm_prd_info'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		-- crm_sales_details
		set @start_time = GETDATE();
		print 'Truncating table bronze.crm_sales_details...'
		truncate table bronze.crm_sales_details;
		print 'Bulk inserting data into bronze.crm_sales_details...'
		bulk insert bronze.crm_sales_details
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.crm_sales_details'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		-- erp_px_cat_g1v2
		set @start_time = GETDATE();
		print 'Truncating table bronze.erp_px_cat_g1v2...'
		truncate table bronze.erp_px_cat_g1v2;
		print 'Bulk inserting data into bronze.erp_px_cat_g1v2...'
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.erp_px_cat_g1v2'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		-- erp_cust_az12
		set @start_time = GETDATE();
		print 'Truncating table bronze.erp_cust_az12...'
		truncate table bronze.erp_cust_az12;
		print 'Bulk inserting data into bronze.erp_cust_az12...'
		bulk insert bronze.erp_cust_az12
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.erp_cust_az12'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		-- erp_loc_a101
		set @start_time = GETDATE();
		print 'Truncating table bronze.erp_loc_a101...'
		truncate table bronze.erp_loc_a101;
		print 'Bulk inserting data into bronze.erp_loc_a101...'
		bulk insert bronze.erp_loc_a101
		from 'C:\TEMP\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = GETDATE();
		print 'Finished loading bronze.erp_loc_a101'
		print 'Time taken (seconds): ' + cast(datediff(second, @start_time, @end_time) as varchar)

		set @total_end = GETDATE();
		print '========================='
		print 'All files loaded successfully!'
		print 'Total time for all files (seconds): ' + cast(datediff(second, @total_start, @total_end) as varchar)
		print '========================='

	end try
	begin catch
		print '========================='
		print 'Error message: ' + error_message();
		print '========================='
	end catch 
end
