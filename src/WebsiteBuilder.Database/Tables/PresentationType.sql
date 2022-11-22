CREATE TABLE dbo.PresentationType
(
  PresentationTypeId   INT           NOT NULL IDENTITY(1,1),
  PresentationTypeName NVARCHAR(100) NOT NULL,
  CONSTRAINT pkcPresentationType PRIMARY KEY CLUSTERED (PresentationTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'PresentationType',                                      @value=N'Represents a type of a presentation.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'PresentationType', @level2name=N'PresentationTypeId',   @value=N'The identifier of the presentation type record.',                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'PresentationType', @level2name=N'PresentationTypeName', @value=N'The name of the presentation type.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'PresentationType', @level2name=N'pkcPresentationType',  @value=N'Defines the primary key for the PresentationType table using the PresentationTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO