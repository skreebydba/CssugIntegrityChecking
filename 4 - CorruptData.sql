USE PvNoneDb;

DECLARE @pagenum INT,
@writebyte INT;

SELECT @writebyte = 100;

/* Get the page ID of the first allocated data page in the CorruptData table. */
SELECT
@pagenum = MIN(allocated_page_page_id)
FROM sys.dm_db_database_page_allocations(DB_ID(), OBJECT_ID('dbo.CorruptData'), 1, NULL, 'DETAILED')
WHERE is_allocated = 1
AND page_type = 1;

SELECT @pagenum AS PageNum, @pagenum * 8192 AS Offset;

/* Set database to SINGLE_USER mode to allow DBCC WRITEPAGE to run. */
ALTER DATABASE PvNoneDb SET SINGLE_USER;

/* Overwrite a byte on the page using DBCC WRITEPAGE.  See disclaimer above. */
DBCC WRITEPAGE (N'PvNoneDb', 1, @pagenum, @writebyte, 1, 0x45, 1);
GO

/* Select from the CorruptData table */
SELECT TOP 5 'None' AS PageVerify, * FROM CorruptData;

USE PvTornPageDb;

DECLARE @pagenum INT,
@writebyte INT;

SELECT @writebyte = 100;

/* Get the page ID of the first allocated data page in the CorruptData table. */
SELECT
@pagenum = MIN(allocated_page_page_id)
FROM sys.dm_db_database_page_allocations(DB_ID(), OBJECT_ID('dbo.CorruptData'), 1, NULL, 'DETAILED')
WHERE is_allocated = 1
AND page_type = 1;

SELECT @pagenum AS PageNum, @pagenum * 8192 AS Offset;

/* Set database to SINGLE_USER mode to allow DBCC WRITEPAGE to run. */
ALTER DATABASE PvTornPageDb SET SINGLE_USER;

/* Overwrite a byte on the page using DBCC WRITEPAGE.  See disclaimer above. */
DBCC WRITEPAGE (N'PvTornPageDb', 1, @pagenum, @writebyte, 1, 0x45, 1);
GO

/* Select from the CorruptData table */
SELECT TOP 5 'TornPage' AS PageVerify, * FROM CorruptData;

USE PvCheckSumDb;

DECLARE @pagenum INT,
@writebyte INT;

SELECT @writebyte = 100;

/* Get the page ID of the first allocated data page in the CorruptData table. */
SELECT
@pagenum = MIN(allocated_page_page_id)
FROM sys.dm_db_database_page_allocations(DB_ID(), OBJECT_ID('dbo.CorruptData'), 1, NULL, 'DETAILED')
WHERE is_allocated = 1
AND page_type = 1;

SELECT @pagenum AS PageNum, @pagenum * 8192 AS Offset;

/* Set database to SINGLE_USER mode to allow DBCC WRITEPAGE to run. */
ALTER DATABASE PvCheckSumDb SET SINGLE_USER;

/* Overwrite a byte on the page using DBCC WRITEPAGE.  See disclaimer above. */
DBCC WRITEPAGE (N'PvCheckSumDb', 1, @pagenum, @writebyte, 1, 0x45, 1);
GO

/* Select from the CorruptData table */
SELECT TOP 5 'CheckSum' AS PageVerify, * FROM CorruptData;