CREATE TABLE dbo.ShindigPresentationDownload
(
  ShindigPresentationDownloadId INT           NOT NULL IDENTITY(1,1),
  ShindigPresentationId         INT           NOT NULL,
  DownloadName                  NVARCHAR(50)  NOT NULL,
  DownloadLink                  NVARCHAR(500)     NULL,
  CONSTRAINT pkcShindigPresentationDownload PRIMARY KEY CLUSTERED (ShindigPresentationDownloadId),
  CONSTRAINT fkShindigPresentationDownload_ShindigPresentation FOREIGN KEY (ShindigPresentationId) REFERENCES dbo.ShindigPresentation (ShindigPresentationId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload',                                                                   @value=N'Represents a download associated with a shindig presentation.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload', @level2name=N'ShindigPresentationDownloadId',                     @value=N'Identifier of the ShindigPresentationDownload record.',                                                                                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload', @level2name=N'ShindigPresentationId',                             @value=N'Identifier of the associated shindig presentation.',                                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload', @level2name=N'DownloadLink',                                      @value=N'The link to the download.',                                                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload', @level2name=N'pkcShindigPresentationDownload',                    @value=N'Defines the primary key for the ShindigPresentationDownload table using the ShindigPresentationDownloadId column.',                       @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentationDownload', @level2name=N'fkShindigPresentationDownload_ShindigPresentation', @value=N'Defines the relationship between the ShindigPresentationDownload and ShindigPresentation tables using the ShindigPresentationId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO