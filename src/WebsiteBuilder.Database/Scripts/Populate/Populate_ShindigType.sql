SET IDENTITY_INSERT dbo.ShindigType ON
GO

MERGE dbo.ShindigType AS TARGET
USING (VALUES ( 1, 'Conference'),
              ( 2, 'User Group'),
              ( 3, 'Code Camp'),
              ( 4, 'Interview'),
              ( 5, 'Workshop'),
              ( 6, 'Private Event'))
AS SOURCE (ShindigTypeId,
           ShindigTypeName)
ON TARGET.ShindigTypeId = SOURCE.ShindigTypeId
WHEN MATCHED THEN UPDATE SET TARGET.ShindigTypeName = SOURCE.ShindigTypeName
WHEN NOT MATCHED THEN INSERT (ShindigTypeId,
                              ShindigTypeName)
                      VALUES (SOURCE.ShindigTypeId,
                              SOURCE.ShindigTypeName)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.ShindigType OFF
GO