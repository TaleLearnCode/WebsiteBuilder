using ShellProgressBar;
using System.Text;
using WebsiteBuilder.Prototype.Models;

namespace WebsiteBuilder.Prototype.Services;

internal class PresentationServices
{

	private readonly string _pageTemplatePath;
	private readonly List<Shindig> _upcomingShindigs;
	private readonly string _outputPath;

	internal PresentationServices(
		string pageTemplatePath,
		List<Shindig> upcomingShindigs,
		string outputPath)
	{
		_pageTemplatePath = pageTemplatePath;
		_upcomingShindigs = upcomingShindigs;
		_outputPath = outputPath;
	}

	internal async Task BuildPresentationPage(
		Presentation presentation,
		ProgressBar parentProgressBar)
	{
		List<string> template = await ReadTemplate();
		using ChildProgressBar progressBar = parentProgressBar.Spawn(template.Count, $"Building page for '{presentation.PresentationShortTitle}'");
		StringBuilder presentationPage = new();
		foreach (string templateLine in template)
		{
			string builtLine = templateLine;
			if (builtLine.Contains("<template-presentation_shorttitle></template-presentation_shorttitle>"))
				builtLine = builtLine.Replace("<template-presentation_shorttitle></template-presentation_shorttitle>", presentation.PresentationShortTitle);
			if (builtLine.Contains("<template-presentation_summarymeta></template-presentation_summarymeta>"))
				builtLine = builtLine.Replace("<template-presentation_summarymeta></template-presentation_summarymeta>", $"<meta content=\"{presentation.Summary}\" name=\"description\" />");
			builtLine = builtLine.Replace("<template-presentation_tagsmeta></template-presentation_tagsmeta>", $"<meta content=\"{GetCommaSeperatedListOfTags(presentation)}\" name=\"keywords\" />");
			if (builtLine.Contains("<template-presentation_title></template-presentation_title>"))
				builtLine = builtLine.Replace("<template-presentation_title></template-presentation_title>", presentation.PresentationTitle);
			if (builtLine.Contains("<template-presentation_presentationtype></template-presentation_presentationtype>"))
				builtLine = builtLine.Replace("<template-presentation_presentationtype></template-presentation_presentationtype>", presentation.PresentationType.PresentationTypeName);

			if (builtLine.Contains("template-presentation_repolink"))
				builtLine = builtLine.Replace("template-presentation_repolink", presentation.RepoLink);
			if (builtLine.Contains("template-presentation_permalink"))
				builtLine = builtLine.Replace("template-presentation_permalink", presentation.Permalink);

			if (builtLine.Contains("<template-presentation_repolink></template-presentation_repolink>"))
				builtLine = builtLine.Replace("<template-presentation_repolink></template-presentation_repolink>", presentation.RepoLink);
			if (builtLine.Contains("<template-presentation_shortabstract></template-presentation_shortabstract>"))
				builtLine = builtLine.Replace("<template-presentation_shortabstract></template-presentation_shortabstract>", presentation.ShortAbstract);
			if (builtLine.Contains("<template-presentation_abstract></template-presentation_abstract>"))
				builtLine = builtLine.Replace("<template-presentation_abstract></template-presentation_abstract>", presentation.Abstract);
			if (builtLine.Contains("<template_presentation_learningobjectives></template_presentation_learningobjectives>"))
				builtLine = builtLine.Replace("<template_presentation_learningobjectives></template_presentation_learningobjectives>", BuildLearningObjectives(presentation));
			if (builtLine.Contains("<template-presentation_shindigs></template-presentation_shindigs>"))
				builtLine = builtLine.Replace("<template-presentation_shindigs></template-presentation_shindigs>", BuildPresenetationShindigs(presentation));
			if (builtLine.Contains("<template-presentation_relatedpresentations></template-presentation_relatedpresentations>"))
				builtLine = builtLine.Replace("<template-presentation_relatedpresentations></template-presentation_relatedpresentations>", BuildRelatedPresentations(presentation));
			if (builtLine.Contains("<template-presentation_tags></template-presentation_tags>"))
				builtLine = builtLine.Replace("<template-presentation_tags></template-presentation_tags>", AddTags(presentation));
			if (builtLine.Contains("<template_upcomingeventscarousel></template_upcomingeventscarousel>"))
				builtLine = builtLine.Replace("<template_upcomingeventscarousel></template_upcomingeventscarousel>", AddUpcomingShindigCarousel());
			if (builtLine.Contains("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>"))
				builtLine = builtLine.Replace("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>", AddUpcomingShindigListing());
			if (builtLine.Contains("<template_upcomingmeetups></template_upcomingmeetups>"))
				builtLine = builtLine.Replace("<template_upcomingmeetups></template_upcomingmeetups>", AddUpcomingMeetupsListing());

			presentationPage.AppendLine(builtLine);
			progressBar.Tick($"Building page for '{presentation.PresentationShortTitle}'");
		}
		await File.WriteAllTextAsync($"{_outputPath}{presentation.Permalink}.html", presentationPage.ToString());
	}

	private async Task<List<string>> ReadTemplate()
	{
		List<string> response = new();
		foreach (string templateLine in await File.ReadAllLinesAsync(_pageTemplatePath))
		{
			response.Add(templateLine);
		}
		return response;
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

	private string DateRangeToString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.ToString("MMMM d, yyyy");
		else if (startDate.Month == endDate.Month)
			return $"{startDate.ToString("MMMM d")} - {endDate.ToString("d, yyyy")}";
		else
			return $"{startDate.ToString("MMMM d")} - {endDate.ToString("MMMM d, yyyy")}";
	}

	private string GetShindigPresentationDownloadLink(ShindigPresentationDownload shindigPresentationDownload)
	{
		if (shindigPresentationDownload.DownloadLink is not null)
			return $"<a href=\"{shindigPresentationDownload.DownloadLink}\" target=\"_top\">{shindigPresentationDownload.DownloadName}</a>";
		else
			return
				shindigPresentationDownload.DownloadName;
	}

	private string BuildRelatedPresentations(Presentation presentation)
	{
		if (presentation.PresentationRelatedRelatedPresentations.Any())
		{
			StringBuilder response = new("<ul>");
			foreach (Presentation relatedPresentation in presentation.PresentationRelatedRelatedPresentations.Select(x => x.RelatedPresentation))
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
			foreach (Tag? tag in presentation.PresentationTags.Select(x => x.Tag))
				if (tag is not null)
					response.AppendLine($"                <li><a href=\"#\">{tag.TagName}</a></li>");
			return response.ToString();
		}
		else
		{
			return "No tags";
		}
	}

	private string AddUpcomingShindigCarousel()
	{
		if (_upcomingShindigs is not null && _upcomingShindigs.Any())
		{
			StringBuilder response = new();
			response.AppendLine("<section id=\"section-events\" aria-label=\"section\" class=\"no-padding bg-color\">");
			response.AppendLine($"        <div class=\"container-fluid\">");
			response.AppendLine($"          <div class=\"row no-gutters align-items-center\">");
			response.AppendLine($"            <div class=\"col-lg-3 text-center text-light\">");
			response.AppendLine($"              <h3 class=\"padding40 no-margin\">Upcoming Events</h3>");
			response.AppendLine($"            </div>");
			response.AppendLine($"            <div class=\"col-lg-9\">");
			response.AppendLine($"              <div id=\"training-carousel\" class=\"owl-carousel owl-theme\">");
			foreach (Shindig upcomingShindig in _upcomingShindigs)
			{
				response.AppendLine($"                <div class=\"item\">");
				response.AppendLine($"                  <div class=\"mask s2\">");
				response.AppendLine($"                    <div class=\"m-date\">{DateRangeToDayString(upcomingShindig.StartDate, upcomingShindig.EndDate)} <span>{upcomingShindig.StartDate.ToString("MMM")}</span></div>");
				response.AppendLine($"                    <div class=\"cover\">");
				response.AppendLine($"                      <div class=\"c-inner\">");
				response.AppendLine($"                        <h3><i class=\"fa fa-circle-thin\"></i><span>{upcomingShindig.ShindigName}</span></h3>");
				response.AppendLine($"                        <p>{upcomingShindig.ShindigSummary}</p>");
				response.AppendLine($"                        <div class=\"spacer20\"></div>");
				response.AppendLine($"                        <a href=\"{upcomingShindig.Permalink}.html\" class=\"btn-custom capsule\">Event Details</a>");
				response.AppendLine($"                      </div>");
				response.AppendLine($"                    </div>");
				response.AppendLine($"                    <img src=\"images/conferences/{upcomingShindig.Permalink}.png\" alt=\"\" class=\"img-responsive\" />");
				response.AppendLine($"                  </div>");
				response.AppendLine($"                </div>");
			}
			response.AppendLine($"              </div>");
			response.AppendLine($"            </div>");
			response.AppendLine($"          </div>");
			response.AppendLine($"        </div>");
			response.AppendLine($"      </section>");
			return response.ToString();
		}
		else
		{
			return string.Empty;
		}
	}

	private string AddUpcomingShindigListing()
	{
		StringBuilder response = new("<h5 class=\"id-color mb20\">Upcoming Speaking Engagements</h5>");
		if (_upcomingShindigs is not null && _upcomingShindigs.Any())
		{
			response.AppendLine($"            <ul class=\"ul-style-2\">");
			foreach (Shindig upcomingShindig in _upcomingShindigs)
			{
				response.AppendLine($"              <li><a href=\"{upcomingShindig.Permalink}.html\">{upcomingShindig.ShindigName}</a></li>");
			}
			response.AppendLine($"            </ul>");
		}
		else
		{
			response.AppendLine("<p>No upcoming speaking engagements</p>");
		}
		return response.ToString();
	}

	private string AddUpcomingMeetupsListing()
	{
		StringBuilder response = new("<h5 class=\"id-color mb20\">Upcoming Meetups</h5>");
		//if (_upcomingShindigs is not null && _upcomingShindigs.Any())
		//{
		//	response.AppendLine($"            <ul class=\"ul-style-2\">");
		//	foreach (Shindig upcomingShindig in _upcomingShindigs)
		//	{
		//		response.AppendLine($"              <li><a href=\"{upcomingShindig.Permalink}.html\">{upcomingShindig.ShindigName}</a></li>");
		//	}
		//	response.AppendLine($"            </ul>");
		//}
		//else
		//{
		response.AppendLine("<p>No upcoming meetups</p>");
		//}
		return response.ToString();
	}

	private string DateRangeToDayString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.Day.ToString();
		else
			return $"{startDate.Day}-{endDate.Day}";
	}

}