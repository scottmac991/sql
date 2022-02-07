USE master
GO

IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = N'samplesdb'
)
 CREATE DATABASE [samplesdb];
GO

IF SERVERPROPERTY('ProductVersion') > '12'
 ALTER DATABASE [samplesdb] SET QUERY_STORE=ON;
GO