MERGE dbo.CommitType AS TARGET
USING (VALUES ( 1, 'Create'),
              ( 2, 'Update'))
AS SOURCE (CommitTypeId,
           CommitTypeName)
ON TARGET.CommitTypeId = SOURCE.CommitTypeId
WHEN MATCHED THEN UPDATE SET TARGET.CommitTypeName = SOURCE.CommitTypeName
WHEN NOT MATCHED THEN INSERT (CommitTypeId,
                              CommitTypeName)
                      VALUES (SOURCE.CommitTypeId,
                              SOURCE.CommitTypeName)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO