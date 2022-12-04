CREATE TABLE dbo.CommitLog
(
  CommitId       NVARCHAR(100) NOT NULL,
  CommitTypeId   INT           NOT NULL,
  TemplateId     INT           NOT NULL,
  Permalink      NVARCHAR(200) NOT NULL,
  CommitDateTime DATETIME2     NOT NULL CONSTRAINT dfCommitLog_CommitDateTime DEFAULT (GETUTCDATE()),
  CONSTRAINT pkcCommitLog PRIMARY KEY CLUSTERED (CommitId),
  CONSTRAINT fkCommitLog_CommitType FOREIGN KEY (CommitTypeId) REFERENCES dbo.CommitType (CommitTypeId),
  CONSTRAINT fkCommitLog_Template   FOREIGN KEY (TemplateId)   REFERENCES dbo.Template (TemplateId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog',                                        @value=N'Record of a file upload to GitHub.',                                                                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'CommitId',               @value=N'The identifier of the commit.',                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'CommitTypeId',           @value=N'Identifier of the type of commit that was performed.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'TemplateId',             @value=N'Identifier of the template used to build the commited file.',                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'Permalink',              @value=N'The permalink of the commited file.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'CommitDateTime',         @value=N'The UTC date and time of the commit.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'pkcCommitLog',           @value=N'Defines the primary key for the CommitLog table using the CommitLogId column.',                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'fkCommitLog_CommitType', @value=N'Defines the relationship between the CommitLog and CommitType tables using the CommitLogId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'CommitLog', @level2name=N'fkCommitLog_Template',   @value=N'Defines the relationship between the CommitLog and Template tables using the TemplateId column.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO