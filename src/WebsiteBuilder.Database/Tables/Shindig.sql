CREATE TABLE dbo.Shindig
(
  ShindigId          INT            NOT NULL IDENTITY(1,1),
  ShindigTypeId      INT            NOT NULL,
  ShindigStatusId    INT            NOT NULL,
  ShindigName        NVARCHAR(200)  NOT NULL,
  OverviewLocation   NVARCHAR(300)  NOT NULL,
  ListingLocation    NVARCHAR(100)  NOT NULL,
  StartDate          DATE           NOT NULL,
  EndDate            DATE           NOT NULL,
  StartingCost       NVARCHAR(20)   NOT NULL,
  EndingCost         NVARCHAR(20)   NOT NULL,
  ShindigDescription NVARCHAR(2000) NOT NULL,
  ShindigSummary     NVARCHAR(140)  NOT NULL,
  ShindigLink        NVARCHAR(200)      NULL,
  Permalink          NVARCHAR(200)  NOT NULL,
  CONSTRAINT pkcShindig PRIMARY KEY CLUSTERED (ShindigId),
  CONSTRAINT fkShindig_ShindigType FOREIGN KEY (ShindigTypeId) REFERENCES dbo.ShindigType (ShindigTypeId),
  CONSTRAINT fkShindig_ShindigStatus FOREIGN KEY (ShindigStatusId) REFERENCES dbo.ShindigStatus (ShindigStatusId),
  CONSTRAINT unqShindig_Permalink UNIQUE (Permalink)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig',                                         @value=N'Represents an event that the speaker participates in.',                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigId',               @value=N'The identifier of the shindig record.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigTypeId',           @value=N'Identifier of the associated shindig type.',                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigStatusId',         @value=N'Identifier of the associated shindig status.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigName',             @value=N'The name of the shindig.',                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'OverviewLocation',        @value=N'The location of the event to show on the overview.',                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ListingLocation',         @value=N'The location of the event to show on the event listing.',                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'StartDate',               @value=N'The start date of the event.',                                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'EndDate',                 @value=N'The end date of the event.',                                                                          @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'StartingCost',            @value=N'The starting cost for the event.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'EndingCost',              @value=N'The ending cost for the event.',                                                                      @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigDescription',      @value=N'The full description of the event.',                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'ShindigSummary',          @value=N'The summary description of the event.',                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'pkcShindig',              @value=N'Defines the primary key for the Shindig table using the ShindigId column.',                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'fkShindig_ShindigType',   @value=N'Defines the relationship between the Shindig and ShindigType tables using the ShindigTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'fkShindig_ShindigStatus', @value=N'Defines the relationship between the Shindig and ShindigType tables using the ShindigTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Shindig', @level2name=N'unqShindig_Permalink',    @value=N'Defines a constraint for the Shindig table ensuring that the Permalink column is not duplicated.',    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO