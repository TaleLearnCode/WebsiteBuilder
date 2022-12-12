namespace WebsiteBuilder.Prototype.Services;

internal class PresentationServices : ServicesBase3
{

	internal PresentationServices(
		WebsiteBuilderContext websiteBuilderContext,
		Repository repository,
		string workingDirectoryPath,
		List<Shindig> upcomingSpeakingEngagements) : base(
			websiteBuilderContext,
			repository,
			workingDirectoryPath,
			upcomingSpeakingEngagements)
	{ }

	internal async Task<bool> BuildListingPageAsync(List<Presentation> presentations)
	{
		if (TryGetTemplateDetails(TemplateTypeIdValues.PresentationListing, out Template? templateDetails) && templateDetails is not null && templateDetails.TemplateType.Permalink is not null)
		{
			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
			StringBuilder pageHtml = new();
			foreach (string templateLine in template)
			{
				string lineHtml = await GlobalReplacements(templateLine);
				if (lineHtml.Contains("<template-presentationslist></template-presentationslist>"))
					lineHtml = lineHtml.Replace("<template-presentationslist></template-presentationslist>", AddPresentationListing(presentations));
				pageHtml.AppendLine(lineHtml);
			}

			string pathInWorkingDirectory = GetPathInWorkingDirectory(templateDetails.TemplateType.Permalink);
			string pathWithWorkingDirectory = GetPathWithWorkingDirectory(templateDetails.TemplateType.Permalink);
			if (File.Exists(pathWithWorkingDirectory))
			{
				string currentFile = await File.ReadAllTextAsync(pathWithWorkingDirectory);
				if (pageHtml.ToString() != currentFile)
				{
					await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
					AddFileToGetIndex(pathInWorkingDirectory);
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
				AddFileToGetIndex(pathInWorkingDirectory);
				return true;
			}

		}


		return false;
	}

	internal async Task<bool> BuildDetailsPagesAsync(
		List<Presentation> presentations,
		ProgressBar parentProgressBar)
	{
		bool response = false;
		using ChildProgressBar progessBar = parentProgressBar.Spawn(presentations.Count, null);
		foreach (Presentation presentation in presentations)
		{
			bool presentationResponse = await BuildDetailsPageAsync(presentation);
			if (presentationResponse && !response) response = true;
			progessBar.Tick();
		}
		return response;
	}

	private async Task<bool> BuildDetailsPageAsync(Presentation presentation)
	{
		if (TryGetTemplateDetails(TemplateTypeIdValues.PresentationDetail, out Template? templateDetails) && templateDetails is not null)
		{
			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
			StringBuilder pageHtml = new();
			foreach (string templateLine in template)
			{
				string lineHtml = await GlobalReplacements(templateLine);
				if (lineHtml.Contains("<template-presentation_shorttitle></template-presentation_shorttitle>"))
					lineHtml = lineHtml.Replace("<template-presentation_shorttitle></template-presentation_shorttitle>", presentation.PresentationShortTitle);
				if (lineHtml.Contains("<template-presentation_summarymeta></template-presentation_summarymeta>"))
					lineHtml = lineHtml.Replace("<template-presentation_summarymeta></template-presentation_summarymeta>", $"<meta content=\"{presentation.Summary}\" name=\"description\" />");
				lineHtml = lineHtml.Replace("<template-presentation_tagsmeta></template-presentation_tagsmeta>", $"<meta content=\"{GetCommaSeperatedListOfTags(presentation)}\" name=\"keywords\" />");
				if (lineHtml.Contains("<template-presentation_title></template-presentation_title>"))
					lineHtml = lineHtml.Replace("<template-presentation_title></template-presentation_title>", presentation.PresentationTitle);
				if (lineHtml.Contains("<template-presentation_presentationtype></template-presentation_presentationtype>"))
					lineHtml = lineHtml.Replace("<template-presentation_presentationtype></template-presentation_presentationtype>", presentation.PresentationType.PresentationTypeName);
				if (lineHtml.Contains("template-presentation_repolink"))
					lineHtml = lineHtml.Replace("template-presentation_repolink", presentation.RepoLink);
				if (lineHtml.Contains("template-presentation_permalink"))
					lineHtml = lineHtml.Replace("template-presentation_permalink", presentation.Permalink);
				if (lineHtml.Contains("<template-presentation_repolink></template-presentation_repolink>"))
					lineHtml = lineHtml.Replace("<template-presentation_repolink></template-presentation_repolink>", presentation.RepoLink);
				if (lineHtml.Contains("<template-presentation_shortabstract></template-presentation_shortabstract>"))
					lineHtml = lineHtml.Replace("<template-presentation_shortabstract></template-presentation_shortabstract>", presentation.ShortAbstract);
				if (lineHtml.Contains("<template-presentation_abstract></template-presentation_abstract>"))
					lineHtml = lineHtml.Replace("<template-presentation_abstract></template-presentation_abstract>", presentation.Abstract);
				if (lineHtml.Contains("<template_presentation_learningobjectives></template_presentation_learningobjectives>"))
					lineHtml = lineHtml.Replace("<template_presentation_learningobjectives></template_presentation_learningobjectives>", BuildLearningObjectives(presentation));
				if (lineHtml.Contains("<template-presentation_shindigs></template-presentation_shindigs>"))
					lineHtml = lineHtml.Replace("<template-presentation_shindigs></template-presentation_shindigs>", BuildPresenetationShindigs(presentation));
				if (lineHtml.Contains("<template-presentation_relatedpresentations></template-presentation_relatedpresentations>"))
					lineHtml = lineHtml.Replace("<template-presentation_relatedpresentations></template-presentation_relatedpresentations>", await BuildRelatedPresentationsAsync(presentation));
				if (lineHtml.Contains("<template-presentation_tags></template-presentation_tags>"))
					lineHtml = lineHtml.Replace("<template-presentation_tags></template-presentation_tags>", AddTags(presentation));
				pageHtml.AppendLine(lineHtml);
			}

			string permalink = $"{presentation.Permalink}.html";
			string pathInWorkingDirectory = GetPathInWorkingDirectory(permalink);
			string pathWithWorkingDirectory = GetPathWithWorkingDirectory(permalink);
			if (File.Exists(pathWithWorkingDirectory))
			{
				string currentFile = await File.ReadAllTextAsync(pathWithWorkingDirectory);
				if (pageHtml.ToString() != currentFile)
				{
					await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
					AddFileToGetIndex(pathInWorkingDirectory);
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
				AddFileToGetIndex(pathInWorkingDirectory);
				return true;
			}

		}
		return false;
	}

	private string AddPresentationListing(List<Presentation> presentations)
	{
		if (presentations is not null && presentations.Any())
		{
			StringBuilder response = new();
			response.AppendLine($"<div class=\"row no-gutters\">");
			foreach (Presentation presentation in presentations)
			{
				response.AppendLine($"            <div class=\"col-lg-4 col-md-6\">");
				response.AppendLine($"              <div class=\"mask s2\">");
				response.AppendLine($"                <div class=\"cover\">");
				response.AppendLine($"                  <div class=\"c-inner\">");
				response.AppendLine($"                    <h3><i class=\"fa fa-circle-thin\"></i><span>{presentation.PresentationTitle}</span></h3>");
				response.AppendLine($"                    <p>{presentation.Summary}</p>");
				response.AppendLine($"                    <div class=\"spacer20\"></div>");
				response.AppendLine($"                    <a href=\"{presentation.Permalink}.html\" class=\"btn-custom capsule\">Presentation Details</a>");
				response.AppendLine($"                  </div>");
				response.AppendLine($"                </div>");
				response.AppendLine($"                <img src=\"images/presentations/{presentation.Permalink}.jpg\" alt=\"{presentation.PresentationTitle}\" class=\"img-responsive\" />");
				response.AppendLine($"              </div>");
				response.AppendLine($"            </div>");
			}
			response.AppendLine($"          </div>");
			return response.ToString();
		}
		else
		{
			return "There are presentations";
		}
	}

	private string GetCommaSeperatedListOfTags(Presentation presentation)
	{
		List<string> tags = new();
		foreach (PresentationTag something in presentation.PresentationTags)
			tags.Add(something.Tag.TagName);
		return string.Join(", ", tags);
	}

	private string BuildLearningObjectives(Presentation presentation)
	{
		StringBuilder response = new();
		response.AppendLine("                        <ul class=\"ul-style-2\">");
		foreach (LearningObjective learningObjective in presentation.LearningObjectives)
			response.AppendLine($"                        <li>{learningObjective.LearningObjectiveText}</li>");
		response.AppendLine("                        </ul>");
		return response.ToString();
	}

	private string BuildPresenetationShindigs(Presentation presentation)
	{
		StringBuilder response = new("<ul class=\"products row\">");
		foreach (ShindigPresentation shindigPresentation in presentation.ShindigPresentations)
		{
			response.AppendLine($"                          <li class=\"col-xl-4 col-lg-4 col-md-6 product\">");
			response.AppendLine($"                            <div class=\"p-inner\">");
			response.AppendLine($"                              <div class=\"p-images\">");
			response.AppendLine($"                                <a href=\"{shindigPresentation.Shindig.Permalink}.html\">");
			response.AppendLine($"                                  <img src=\"images/conferences/{shindigPresentation.Shindig.Permalink}.png\" class=\"pi-1 img-responsive\" alt=\"{shindigPresentation.Shindig.ShindigName}\">");
			response.AppendLine($"                                </a>");
			response.AppendLine($"                              </div>");
			response.AppendLine($"                              <a href=\"{shindigPresentation.Shindig.Permalink}.html\">");
			response.AppendLine($"                                <h4 class=\"text-center\">{shindigPresentation.Shindig.ShindigName}</h4>");
			response.AppendLine($"                              </a>");
			response.AppendLine($"                              <div><i class=\"id-color fa fa-map-marker fa-lg\"></i> {shindigPresentation.Shindig.ListingLocation}</div>");
			response.AppendLine($"                              <div><i class=\"id-color fa fa-calendar fa-lg\"></i> {DateRangeToString(shindigPresentation.Shindig.StartDate, shindigPresentation.Shindig.EndDate)}</div>");
			if (shindigPresentation.ShindigPresentationDownloads.Any())
				foreach (ShindigPresentationDownload shindigPresentationDownload in shindigPresentation.ShindigPresentationDownloads)
					response.AppendLine($"                              <div><i class=\"id-color fa fa-file-pdf-o fa-lg\"></i> {GetShindigPresentationDownloadLink(shindigPresentationDownload)}</div>");
			response.AppendLine($"                            </div>");
			response.AppendLine($"                          </li>");
		}
		response.AppendLine("                        </ul>");
		return response.ToString();
	}

	private string GetShindigPresentationDownloadLink(ShindigPresentationDownload shindigPresentationDownload)
	{
		if (shindigPresentationDownload.DownloadLink is not null)
			return $"<a href=\"{shindigPresentationDownload.DownloadLink}\" target=\"_top\">{shindigPresentationDownload.DownloadName}</a>";
		else
			return
				shindigPresentationDownload.DownloadName;
	}

	private async Task<string> BuildRelatedPresentationsAsync(Presentation presentation)
	{
		using WebsiteBuilderContext websiteBuilderContext = new();
		List<Presentation> relatedPresentations = (await websiteBuilderContext.PresentationRelateds
			.Where(x => x.PrimaryPresentationId == presentation.PresentationId)
			.Include(x => x.RelatedPresentation)
			.ToListAsync())
			.Select(x => x.RelatedPresentation).ToList();
		if (relatedPresentations is not null && relatedPresentations.Any())
		{
			StringBuilder response = new("<ul>");
			foreach (Presentation relatedPresentation in relatedPresentations)
			{
				response.AppendLine($"                  <li>");
				response.AppendLine($"                    <a href=\"{relatedPresentation.Permalink}.html\">");
				response.AppendLine($"                      <img src=\"images/presentations/{relatedPresentation.Permalink}.jpg\" alt=\"{relatedPresentation.PresentationTitle}\">");
				response.AppendLine($"                      <div class=\"text\">{relatedPresentation.PresentationTitle}</div>");
				response.AppendLine($"                      <div class=\"spacer-single\"></div>");
				response.AppendLine($"                    </a>");
				response.AppendLine($"                  </li>");
			}
			response.AppendLine("                </ul>");
			return response.ToString();
		}
		return "No related presentations";
	}

	private string AddTags(Presentation presentation)
	{
		if (presentation.PresentationTags.Any())
		{
			StringBuilder response = new("<ul>");
			response.AppendLine("              </ul>");
			foreach (Chlib? tag in presentation.PresentationTags.Select(x => x.Tag))
				if (tag is not null)
					response.AppendLine($"                <li><a href=\"#\">{tag.TagName}</a></li>");
			return response.ToString();
		}
		else
		{
			return "No tags";
		}
	}

}