MERGE dbo.TemplateType AS TARGET
USING (VALUES ( 1, 'Footer',                  'footer.html'),
              ( 2, 'SpeakingEngagementList',  'speaking-engagements.html'),
              ( 3, 'SpeakingEngagementDetail', NULL),
              ( 4, 'PresentationList',         'presentations.html'),
              ( 5, 'PresentationDetail',       NULL),
              ( 6, 'Preloader',                'preloader.html'),
              ( 7, 'JavaScriptIncludes',       'javascript-includes.html'),
              ( 8, 'Head',                     'head.html'),
              ( 9, 'Header',                   'header.html'),
              (10, 'Topbar',                   'topbar.html'))
AS SOURCE (TemplateTypeId,
           TemplateTypeName,
           Permalink)
ON TARGET.TemplateTypeId = SOURCE.TemplateTypeId
WHEN MATCHED THEN UPDATE SET TARGET.TemplateTypeName = SOURCE.TemplateTypeName,
                             TARGET.Permalink        = SOURCE.Permalink
WHEN NOT MATCHED THEN INSERT (TemplateTypeId,
                              TemplateTypeName,
                              Permalink)
                      VALUES (SOURCE.TemplateTypeId,
                              SOURCE.TemplateTypeName,
                              SOURCE.Permalink)
WHEN NOT MATCHED BY SOURCE THEN DELETE;
GO