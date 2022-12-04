CREATE TABLE dbo.Template
(
  TemplateId       INT           NOT NULL IDENTITY(1,1),
  TemplateTypeId   INT           NOT NULL,
  TemplateName     NVARCHAR(100) NOT NULL,
  TemplateFileName NVARCHAR(100) NOT NULL,
  IsActive         BIT           NOT NULL,
  CONSTRAINT pkcTemplate PRIMARY KEY CLUSTERED (TemplateId),
  CONSTRAINT fkTemplate_TemplateType FOREIGN KEY (TemplateTypeId) REFERENCES dbo.TemplateType (TemplateTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template',                                         @value=N'Represents a template used to generate a static web page.',                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'TemplateId',              @value=N'The identifier of the template record.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'TemplateTypeId',          @value=N'Identifier of the type of template being represented.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'TemplateName',            @value=N'The of the template.',                                                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'TemplateFileName',        @value=N'The file name of the template.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'IsActive',                @value=N'Flag indicating whether the template is active.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'pkcTemplate',             @value=N'Defines the primary key for the Template table using the TemplateId column.',                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Template', @level2name=N'fkTemplate_TemplateType', @value=N'Defines the relationship between the Template and TemplateType tables using the TemplateTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO