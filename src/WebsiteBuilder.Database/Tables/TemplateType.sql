CREATE TABLE dbo.TemplateType
(
  TemplateTypeId   INT           NOT NULL,
  TemplateTypeName VARCHAR(100)  NOT NULL,
  Permalink        NVARCHAR(200)     NULL,
  CONSTRAINT pkcTemplateType PRIMARY KEY CLUSTERED (TemplateTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'TemplateType',                                  @value=N'Represents a type of a stage page template.',                                                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'TemplateType', @level2name=N'TemplateTypeId',   @value=N'The identifier of the template type record.',                                                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'TemplateType', @level2name=N'TemplateTypeName', @value=N'The of the template type.',                                                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'TemplateType', @level2name=N'Permalink',        @value=N'The permanent link for the file generated using the template. Not used for output files associated with speaking engagements or presentations.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'TemplateType', @level2name=N'pkcTemplateType',  @value=N'Defines the primary key for the TemplateType table using the TemplateTypeId column.',                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO