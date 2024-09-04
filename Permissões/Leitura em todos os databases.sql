USE [master]
GO
CREATE LOGIN [lorena_vieira] WITH PASSWORD=N'e2Gh82@Q3!&s', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

DECLARE @usuario SYSNAME
        , @login SYSNAME;

SELECT @usuario = 'lorena_vieira',
       @login = 'lorena_vieira'

SELECT ' USE ' + QUOTENAME(NAME) + '; CREATE USER ' + QUOTENAME(@usuario) + ' FOR LOGIN ' + QUOTENAME(@login) + ' WITH DEFAULT_SCHEMA=[dbo];     EXEC sys.sp_addrolemember  ''db_datareader'',''' + @usuario+ ''';'
FROM   sys.databases
WHERE  database_id > 4
       AND state_desc = 'ONLINE'

--mudar senha
/*
ALTER LOGIN lorena_vieira WITH PASSWORD = 'e2Gh82@Q3!&s';  
GO 
*/

--exportar usuario para secundario
exec sp_help_revlogin

