CREATE TABLE dbo.Presentation
(
  PresentationId         INT            NOT NULL IDENTITY(1,1),
  PresentationTitle      NVARCHAR(300)  NOT NULL,
  PresentationShortTitle NVARCHAR(60)   NOT NULL,
  Abstract               NVARCHAR(2000) NOT NULL,
  ShortAbstract          NVARCHAR(500)  NOT NULL,
  Summary                NVARCHAR(140)  NOT NULL,
  PresentationTypeId     INT            NOT NULL,
  RepoLink               NVARCHAR(200)      NULL,
  Permalink              NVARCHAR(200)  NOT NULL,
  IsArchived             BIT            NOT NULL CONSTRAINT dfPresentation_IsArchived DEFAULT(0),
  CONSTRAINT pkcPresentation PRIMARY KEY CLUSTERED (PresentationId),
  CONSTRAINT fkPresentation_PresentationType FOREIGN KEY (PresentationTypeId) REFERENCES dbo.PresentationType (PresentationTypeId),
  CONSTRAINT unqPresentation_Permalink UNIQUE (Permalink)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation',                                                 @value=N'Represents the speaker''s presentations.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'PresentationId',                  @value=N'The identifier of the presentation record.',                                                                         @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'PresentationTitle',               @value=N'The full title of the presentation.',                                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'PresentationShortTitle',          @value=N'The short title of the presentation.',                                                                               @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'Abstract',                        @value=N'The full abstract for the presentation.',                                                                            @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'ShortAbstract',                   @value=N'The short abstract for the presentation.',                                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'Summary',                         @value=N'The summary for the presentation.',                                                                                  @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'PresentationTypeId',              @value=N'Identifier of the type of presentation is represented.',                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'IsArchived',                      @value=N'Flag indicating whether the presentation has been archived.',                                                        @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'pkcPresentation',                 @value=N'Defines the primary key for the Presentation table using the PresentationId column.',                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'fkPresentation_PresentationType', @value=N'Defines the relationship between the Presentation and PresentationType tables using the PresentationTypeId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'Presentation', @level2name=N'unqPresentation_Permalink',       @value=N'Defines a constraint for the Presentation table ensuring that the Permalink column is not duplicated.',              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO