CREATE TABLE dbo.ShindigStatus
(
  ShindigStatusId INT NOT NULL IDENTITY(1,1),
  ShindigStatusName NVARCHAR(100) NOT NULL,
  CONSTRAINT pkcShindigStatus PRIMARY KEY CLUSTERED (ShindigStatusId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigStatus',                                    @value=N'Represents a status of a shindig.',                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigStatus', @level2name=N'ShindigStatusId',    @value=N'The identifier of the shindig status record.',                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigStatus', @level2name=N'ShindigStatusName',  @value=N'The name of the shindig status.',                                                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigStatus', @level2name=N'pkcShindigStatus',   @value=N'Defines the primary key for the ShindigStatus table using the ShindigStatusId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO