USE [Prod-SaggiExam];
GO

DECLARE @dropFKs NVARCHAR(MAX) = N'';

SELECT 
    @dropFKs += N'
    ALTER TABLE ' 
        + QUOTENAME(s.name) + N'.' + QUOTENAME(t.name)
        + N' DROP CONSTRAINT ' + QUOTENAME(fk.name) + N';'
FROM sys.foreign_keys AS fk
INNER JOIN sys.tables AS t ON fk.parent_object_id = t.object_id
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE t.is_ms_shipped = 0;  -- ignore system tables

PRINT @dropFKs;  -- (Optional) to see the generated commands
EXEC sp_executesql @dropFKs;

DECLARE @dropTables NVARCHAR(MAX) = N'';

SELECT 
    @dropTables += N'
    DROP TABLE ' 
        + QUOTENAME(s.name) + N'.' + QUOTENAME(t.name) + N';'
FROM sys.tables AS t
INNER JOIN sys.schemas AS s ON t.schema_id = s.schema_id
WHERE t.is_ms_shipped = 0;   -- ignore system tables

PRINT @dropTables;  -- (Optional) to review the script
EXEC sp_executesql @dropTables;
