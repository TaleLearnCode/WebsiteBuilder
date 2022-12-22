SET IDENTITY_INSERT dbo.Template ON
GO

MERGE dbo.Template AS TARGET
USING (VALUES ( 1,  1, 1, 'Footer',                      'template_footer.html'),
              ( 2,  2, 1, 'Speaking Engagement Listing', 'template_speaking-engagements.html'),
              ( 3,  3, 1, 'Speaking Engagement Details', 'template_speaking-engagement.html'),
              ( 4,  4, 1, 'Presentation Listing',        'template_presentations.html'),
              ( 5,  5, 1, 'Presentation Details',        'template_presentation.html'),
              ( 6,  6, 1, 'Preloader',                   'template_preloader.html'),
              ( 7,  7, 1, 'Javascript Includes',         'template_javascript-includes.html'),
              ( 8,  8, 1, 'Head',                        'template_head.html'),
              ( 9,  9, 1, 'Header',                      'template_header.html'),
              (10, 10, 1, 'Topbar',                      'template_topbar.html'))
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