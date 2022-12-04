CREATE TABLE dbo.CommitType
(
  CommitTypeId    INT          NOT NULL,
  CommitTypeName VARCHAR(100) NOT NULL,
  CONSTRAINT pkcCommitType PRIMARY KEY CLUSTERED (CommitTypeId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitType',                                @value=N'Represents a type of a file commit.',                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitType', @level2name=N'CommitTypeId',   @value=N'The identifier of the commit type record.',                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitType', @level2name=N'CommitTypeName', @value=N'The of the commit type.',                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitType', @level2name=N'pkcCommitType',  @value=N'Defines the primary key for the CommitType table using the CommitTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO