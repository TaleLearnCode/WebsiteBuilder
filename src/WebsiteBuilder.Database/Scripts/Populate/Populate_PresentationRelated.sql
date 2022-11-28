SET IDENTITY_INSERT dbo.PresentationRelated ON
GO

MERGE dbo.PresentationRelated AS TARGET
USING (VALUES 

              -- Building Event-Driven Microservices
              (  1, 1, 1,  8),
              (  2, 2, 1, 12)
             )
AS SOURCE (PresentationRelatedId,
           SortOrder,
           PrimaryPresentationId,
           RelatedPresentationId)
ON TARGET.PresentationRelatedId = SOURCE.PresentationRelatedId
WHEN MATCHED THEN UPDATE SET TARGET.PrimaryPresentationId = SOURCE.PrimaryPresentationId,
                             TARGET.RelatedPresentationId = SOURCE.RelatedPresentationId,
                             TARGET.SortOrder             = SOURCE.SortOrder
WHEN NOT MATCHED THEN INSERT (PresentationRelatedId,
                              PrimaryPresentationId,
                              RelatedPresentationId,
                              SortOrder)
                      VALUES (SOURCE.PresentationRelatedId,
                              SOURCE.PrimaryPresentationId,
                              SOURCE.RelatedPresentationId,
                              SOURCE.SortOrder)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.PresentationRelated OFF
GO