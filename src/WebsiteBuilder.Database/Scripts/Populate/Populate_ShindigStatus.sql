SET IDENTITY_INSERT dbo.ShindigStatus ON
GO

MERGE dbo.ShindigStatus AS TARGET
USING (VALUES ( 1, 'Scheduled'),
              ( 2, 'Completed'),
              ( 3, 'Canceled'))
AS SOURCE (ShindigStatusId,
           ShindigStatusName)
ON TARGET.ShindigStatusId = SOURCE.ShindigStatusId
WHEN MATCHED THEN UPDATE SET TARGET.ShindigStatusName = SOURCE.ShindigStatusName
WHEN NOT MATCHED THEN INSERT (ShindigStatusId,
                              ShindigStatusName)
                      VALUES (SOURCE.ShindigStatusId,
                              SOURCE.ShindigStatusName)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.ShindigStatus OFF
GO