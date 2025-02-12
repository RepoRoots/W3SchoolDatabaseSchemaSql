USE [Dev-SaggiExam];  
GO

CREATE SCHEMA [SaggiImmigration-H1b] AUTHORIZATION [dbo];  
GO
SELECT name 
FROM sys.schemas;

SELECT * FROM sys.server_principals WHERE name = 'SaggiH1b';

-- Create the login for the user
CREATE LOGIN [SaggiH1b] WITH PASSWORD = 'Saggi@H1B';
GO

-- Create a database user linked to the login
USE [Dev-SaggiExam];
GO

CREATE USER [SaggiH1b] FOR LOGIN [SaggiH1b] WITH DEFAULT_SCHEMA = [SaggiImmigration-H1b];
GO

-- Grant only the necessary permissions to the schema
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];
GO


SELECT * FROM sys.server_principals WHERE name = 'SaggiH1b';

USE [Prod-SaggiExam];
GO

-- Grant permission to create tables and manage schema objects
GRANT ALTER ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];
GRANT CREATE TABLE TO [SaggiH1b];
GRANT CONTROL ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];

USE [Dev-SaggiExam];
GO

-- Grant permissions to create a schema
GRANT CREATE SCHEMA TO [SaggiH1b];
GRANT ALTER ON SCHEMA::[dbo] TO [SaggiH1b];
GRANT CONTROL ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];
