CREATE TABLE dbo.ShindigPresentation
(
  ShindigPresentationId INT          NOT NULL IDENTITY(1,1),
  ShindigId             INT          NOT NULL,
  PresentationId        INT          NOT NULL,
  StartDateTime         DATETIME2        NULL,
  EndDateTime           DATETIME2        NULL,
  TimeZone              VARCHAR(10)      NULL,
  Room                  NVARCHAR(50)     NULL,
  CONSTRAINT pkcShindigPresentation PRIMARY KEY CLUSTERED (ShindigPresentationId),
  CONSTRAINT fkShindigPresentation_Shindig       FOREIGN KEY (ShindigId)      REFERENCES dbo.Shindig (ShindigId),
  CONSTRAINT fkShindigPresentation_Presentatiton FOREIGN KEY (PresentationId) REFERENCES dbo.Presentation (PresentationId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation',                                                     @value=N'Represents the speaker''s presentations.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'ShindigPresentationId',               @value=N'Identifier of the ShindigPresentation record.',                                                                     @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'ShindigId',                           @value=N'Identifier of the associated shindig.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'PresentationId',                      @value=N'Identifier of the associated presentation.',                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'StartDateTime',                       @value=N'The starting date and time for the presentation.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'EndDateTime',                         @value=N'The ending date and time for the presentation.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'Room',                                @value=N'The room where the presentation is being presented.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'pkcShindigPresentation',              @value=N'Defines the primary key for the ShindigPresentation table using the ShindigPresentationId column.',                 @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'fkShindigPresentation_Shindig',       @value=N'Defines the relationship between the ShindigPresentation and Shindig tables using the ShindigId column.',           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'ShindigPresentation', @level2name=N'fkShindigPresentation_Presentatiton', @value=N'Defines the relationship between the ShindigPresentation and Presentation tables using the PresentationId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO