-----------------------------------------------------------------------------------
-- [PROD DATABASE]  (Prod-SaggiExam)
-- You must be connected to Prod-SaggiExam here
-----------------------------------------------------------------------------------

/* 1) Create the database user [SaggiH1b].
   This maps to the existing server-level login [SaggiH1b]. */
CREATE USER [SaggiH1b]
    FOR LOGIN [SaggiH1b]
    WITH DEFAULT_SCHEMA = [SaggiImmigration-H1b];
GO

/* 2) Create the custom schema SaggiImmigration-H1b (if it doesn't already exist).
   Make [SaggiH1b] the owner of the schema. */
CREATE SCHEMA [SaggiImmigration-H1b]
    AUTHORIZATION [SaggiH1b];
GO

/* 3) Grant relevant CREATE permissions at the DB level (table, procedure, etc.). */
GRANT CREATE TABLE TO [SaggiH1b];
GRANT CREATE PROCEDURE TO [SaggiH1b];
GRANT CREATE VIEW TO [SaggiH1b];
GRANT CREATE FUNCTION TO [SaggiH1b];
-- etc.

/* 4) Allow user to ALTER or CONTROL the schema 
   so they can create / modify objects inside it. */
GRANT ALTER ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];
GRANT CONTROL ON SCHEMA::[SaggiImmigration-H1b] TO [SaggiH1b];
GO


-----------------------------------------------------------------------------------
-- [DEV DATABASE]  (Dev-SaggiExam)
-- You must be connected to Dev-SaggiExam here
-----------------------------------------------------------------------------------

/* 1) Create the database user (if not already created).
   Link it to the existing server-level login [tst001dev].
   If it already exists, you can skip this CREATE USER step. */
CREATE USER [tst001devProd]
    FOR LOGIN [tst001devProd]
    WITH DEFAULT_SCHEMA = [dbo];
GO

/* 2) Grant permissions to create objects at the DB level. 
   For example, create tables and stored procedures. 
   Add more if you need CREATE VIEW, CREATE FUNCTION, etc. */
GRANT CREATE TABLE TO [tst001devProd];
GRANT CREATE PROCEDURE TO [tst001devProd];
GRANT CREATE VIEW TO [tst001devProd];
-- etc.

-- 3) Give them the ability to alter/control objects in the dbo schema
GRANT ALTER ON SCHEMA::[dbo] TO [tst001devProd];
GRANT CONTROL ON SCHEMA::[dbo] TO [tst001devProd];
GO
