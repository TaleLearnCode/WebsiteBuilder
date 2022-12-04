﻿SET IDENTITY_INSERT dbo.Template ON
GO

MERGE dbo.Template AS TARGET
USING (VALUES ( 1, 1, 1, 'Speaking Engagement Listing', 'template_speaking-engagements.html'))
AS SOURCE (TemplateId,
           TemplateTypeId,
           IsActive,
           TemplateName,
           TemplateFileName)
ON TARGET.TemplateId = SOURCE.TemplateId
WHEN MATCHED THEN UPDATE SET TARGET.TemplateTypeId = SOURCE.TemplateTypeId
WHEN NOT MATCHED THEN INSERT (TemplateId,
                              TemplateTypeId,
                              TemplateName,
                              TemplateFileName,
                              IsActive)
                      VALUES (SOURCE.TemplateId,
                              SOURCE.TemplateTypeId,
                              SOURCE.TemplateName,
                              SOURCE.TemplateFileName,
                              SOURCE.IsActive)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO

SET IDENTITY_INSERT dbo.Template OFF
GO