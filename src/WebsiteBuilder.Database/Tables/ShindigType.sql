CREATE TABLE dbo.ShindigType
(
  ShindigTypeId INT NOT NULL IDENTITY(1,1),
  ShindigTypeName NVARCHAR(100) NOT NULL,
  CONSTRAINT pkcShindigType PRIMARY KEY CLUSTERED (ShindigTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigType',                                  @value=N'Represents a type of shindig.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigType', @level2name=N'ShindigTypeId',    @value=N'The identifier of the shindig type record.',                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigType', @level2name=N'ShindigTypeName',  @value=N'The name of the shindig type.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigType', @level2name=N'pkcShindigType',   @value=N'Defines the primary key for the ShindigType table using the ShindigTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO