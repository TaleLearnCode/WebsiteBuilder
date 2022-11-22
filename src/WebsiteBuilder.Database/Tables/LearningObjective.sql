CREATE TABLE dbo.LearningObjective
(
  LearningObjectiveId INT NOT NULL IDENTITY(1,1),
  PresentationId      INT NOT NULL,
  LearningObjectiveText NVARCHAR(300) NOT NULL,
  SortOrder             INT           NOT NULL,
  CONSTRAINT pkcLearningObjective PRIMARY KEY CLUSTERED (LearningObjectiveId),
  CONSTRAINT fkLearningObjective_Presentation FOREIGN KEY (PresentationId) REFERENCES dbo.Presentation (PresentationId)
)
GO

EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective',                                                  @value=N'Represents a learning objective of a presentation.',                                                              @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'LearningObjectiveId',              @value=N'The identifier of the learning objective record.',                                                                @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'PresentationId',                   @value=N'The identifier of the associated presentation record.',                                                           @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'LearningObjectiveText',            @value=N'The text of the learning objective.',                                                                             @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'SortOrder',                        @value=N'The sorting order of the learning objective.',                                                                    @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'COLUMN';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'pkcLearningObjective',             @value=N'Defines the primary key for the LearningObjective table using the LearningObjectiveId column.',                   @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO
EXEC sp_addextendedproperty @level0name=N'dbo', @level1name=N'LearningObjective', @level2name=N'fkLearningObjective_Presentation', @value=N'Defines the relationship between the LearningObjective and Presentation tables using the PresentationId column.', @name=N'MS_Description', @level0type=N'SCHEMA', @level1type=N'TABLE', @level2type=N'CONSTRAINT';
GO