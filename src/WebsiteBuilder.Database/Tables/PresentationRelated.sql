CREATE TABLE dbo.PresentationRelated
(
  PresentationRelatedId INT NOT NULL IDENTITY(1,1),
  PrimaryPresentationId INT NOT NULL,
  RelatedPresentationId INT NOT NULL,
  SortOrder             INT     NULL,
  CONSTRAINT pkcRelatedPresentation PRIMARY KEY CLUSTERED (PresentationRelatedId),
  CONSTRAINT fkRelatedPresentation_Presentation_Primary FOREIGN KEY (PrimaryPresentationId) REFERENCES dbo.Presentation (PresentationId),
  CONSTRAINT fkRelatedPresentation_Presentation_Related FOREIGN KEY (RelatedPresentationId) REFERENCES dbo.Presentation (PresentationId)
)
GO