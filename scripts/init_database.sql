/*
Create Database and Schemas

Script purpouse:
	This script creates a new database named 'DataWarehouse' after checking if it already exists.
	If the database exists, it is dropped and recreated. Additionaly, the script sets up three schemas within the database: 
	'bronze', 'silver' and 'gold'.

WARNING: 
	Running this script will drop the entire 'DataWarehouse' database if it exists.
	All data in the database will be permanentely deleted. Proceed with caution.
*/

USE master;
go

IF Exists (Select 1 from sys.databases where name = 'DataWarehouse')
Begin
	Alter DATABASE DataWarehouse SET Single_User with rollback immediate;
	Drop Database DataWarehouse;
End;
go

Create Database DataWarehouse;
go

USE DataWarehouse;
go

Create Schema bronze;
go

Create Schema silver;
go

Create Schema gold;
go
