﻿SET IDENTITY_INSERT dbo.Tag ON
GO

MERGE dbo.Tag AS TARGET
USING (VALUES ( 1, '.NET'),
              ( 2, 'APIs'),
              ( 3, 'Architecture'),
              ( 4, 'Azure'),
              ( 5, 'Azure Functions'),
              ( 6, 'Best Practices'),
              ( 7, 'C#'),
              ( 8, 'Cloud'),
              ( 9, 'Cloud-Native'),
              (10, 'Software Design'),
              (11, 'Microservices'),
              (12, 'Microsoft'),
              (13, 'REST'),
              (14, 'Serverless'),
              (15, 'Agile'),
              (16, 'Business'),
              (17, 'Code Quality'),
              (18, 'Project Management'),
              (19, 'Software Craftsmanship'),
              (20, 'Tips and Tricks'),
              (21, 'Technical Debt'),
              (22, 'Soft Skills'),
              (23, 'Data'),
              (24, 'Database'),
              (25, 'Entity Framework'),
              (26, 'SQL'),
              (27, 'SQL Server'),
              (28, 'Cloud-Native Architecture'),
              (29, 'Cloud-Native Microservices'),
              (30, 'REST APIs'),
              (31, 'RESTful APIs'),
              (32, '.NET Core'),
              (33, 'AWS'),
              (34, 'Google Cloud Platform'),
              (35, 'Cosmos DB'),
              (36, 'Event-Driven Architecture'),
              (37, 'NoSQL'),
              (38, 'Integrations'))
AS SOURCE (TagId,
           TagName)
ON TARGET.TagId = SOURCE.TagId
WHEN MATCHED THEN UPDATE SET TARGET.TagName = SOURCE.TagName
WHEN NOT MATCHED THEN INSERT (TagId,
                              TagName)
                      VALUES (SOURCE.TagId,
                              SOURCE.TagName)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.Tag OFF
GO