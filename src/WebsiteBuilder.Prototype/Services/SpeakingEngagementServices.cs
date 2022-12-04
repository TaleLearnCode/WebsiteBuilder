using System.Text;

namespace WebsiteBuilder.Prototype.Services;

internal class SpeakingEngagementServices
{

	private readonly List<Shindig> _upcomingShindigs;
	private readonly string _outputPath;

	internal SpeakingEngagementServices(
		List<Shindig> upcomingShindigs,
		string outputPath)
	{
		_upcomingShindigs = upcomingShindigs;
		_outputPath = outputPath;
	}

	internal async Task BuildShindigListingPageAsync(
		List<Shindig> shindigs,
		string pageTemplatePath)
	{
		List<string> template = await ReadTemplate(pageTemplatePath);
		StringBuilder presentationPage = new();
		foreach (string templateLine in template)
		{
			string builtLine = templateLine;
			if (builtLine.Contains("<template-engagements_listing></template-engagements_listing>"))
				builtLine = builtLine.Replace("<template-engagements_listing></template-engagements_listing>", AddEngagementListing(shindigs));
			if (builtLine.Contains("<template_upcomingeventscarousel></template_upcomingeventscarousel>"))
				builtLine = builtLine.Replace("<template_upcomingeventscarousel></template_upcomingeventscarousel>", AddUpcomingShindigCarousel());
			if (builtLine.Contains("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>"))
				builtLine = builtLine.Replace("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>", AddUpcomingShindigListing());
			if (builtLine.Contains("<template_upcomingmeetups></template_upcomingmeetups>"))
				builtLine = builtLine.Replace("<template_upcomingmeetups></template_upcomingmeetups>", AddUpcomingMeetupsListing());

			presentationPage.AppendLine(builtLine);
		}

		GitHubClient gitHubClient = new GitHubClient(new ProductHeaderValue("Corina"));
		gitHubClient.Credentials = new("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");
		(string owner, string repoName, string filePath, string branch) = ("TaleLearnCode", "ChadGreen.com", "src/speaking-engagements2.html", "main");
		//await gitHubClient.Repository.Content.CreateFile(owner, repoName, filePath, new CreateFileRequest($"First commit for {filePath}", presentationPage.ToString(), branch));

		IReadOnlyList<RepositoryContent> fileDetails = await gitHubClient.Repository.Content.GetAllContentsByRef(owner, repoName, filePath, branch);
		if (presentationPage.ToString() != fileDetails.First().Content)
		{
			RepositoryContentChangeSet updateResult = await gitHubClient.Repository.Content.UpdateFile(owner, repoName, filePath,
				new UpdateFileRequest("My updated file", presentationPage.ToString(), fileDetails.First().Sha));



		}


		//var apiInfo = gitHubClient.GetLastApiInfo();

		//// If the ApiInfo isn't null, there will be a property called RateLimit
		//var rateLimit = apiInfo?.RateLimit;

		//var howManyRequestsCanIMakePerHour = rateLimit?.Limit;
		//var howManyRequestsDoIHaveLeft = rateLimit?.Remaining;
		//var whenDoesTheLimitReset = rateLimit?.Reset; // UTC time




		await File.WriteAllTextAsync($"{_outputPath}speaking-engagements.html", presentationPage.ToString());
	}

	internal async Task BuildShiningDetailPageAsync(
		Shindig shindig,
		string pageTemplatePath)
	{
		List<string> template = await ReadTemplate(pageTemplatePath);
		StringBuilder engagementPage = new();
		foreach (string templateLine in template)
		{
			string builtLine = templateLine;
			if (builtLine.Contains("<template-engagement_name></template-engagement_name>"))
				builtLine = builtLine.Replace("<template-engagement_name></template-engagement_name>", shindig.ShindigName);
			if (builtLine.Contains("<template-engagement_summarymeta></template-engagement_summarymeta>"))
				builtLine = builtLine.Replace("<template-engagement_summarymeta></template-engagement_summarymeta>", shindig.ShindigSummary);
			if (builtLine.Contains("<template-engagement_dates></template-engagement_dates>"))
				builtLine = builtLine.Replace("<template-engagement_dates></template-engagement_dates>", DateRangeToString(shindig.StartDate, shindig.EndDate));
			if (builtLine.Contains("<template-engagment_description></template-engagment_description>"))
				builtLine = builtLine.Replace("<template-engagment_description></template-engagment_description>", shindig.ShindigDescription);
			if (builtLine.Contains("<template-engagement_overviewlocation></template-engagement_overviewlocation>"))
				builtLine = builtLine.Replace("<template-engagement_overviewlocation></template-engagement_overviewlocation>", shindig.OverviewLocation);
			if (builtLine.Contains("<template-engagement_costs></template-engagement_costs>"))
				builtLine = builtLine.Replace("<template-engagement_costs></template-engagement_costs>", AddEngagementCosts(shindig));
			if (builtLine.Contains("<template-engagement_presentations></template-engagement_presentations>"))
				builtLine = builtLine.Replace("<template-engagement_presentations></template-engagement_presentations>", AddPresentations(shindig.ShindigPresentations.ToList()));
			if (builtLine.Contains("template-engagement_link"))
				builtLine = builtLine.Replace("template-engagement_link", shindig.ShindigLink);
			if (builtLine.Contains("template-presentation_permalink"))
				builtLine = builtLine.Replace("template-presentation_permalink", shindig.Permalink);
			engagementPage.AppendLine(builtLine);
		}




		await File.WriteAllTextAsync($"{_outputPath}{shindig.Permalink}.html", engagementPage.ToString());
	}

	private async Task<List<string>> ReadTemplate(string pageTemplatePath)
	{
		List<string> response = new();
		foreach (string templateLine in await File.ReadAllLinesAsync(pageTemplatePath))
		{
			response.Add(templateLine);
		}
		return response;
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

	private string AddUpcomingEngagementListing(List<Shindig> upcomingShindigs)
	{
		if (upcomingShindigs is not null && upcomingShindigs.Any())
		{
			StringBuilder response = new();
			response.AppendLine($"<div class=\"container\">");
			response.AppendLine($"                    <div class=\"row\">");
			response.AppendLine($"                        <div class=\"col-md-12 text-center\">");
			response.AppendLine($"                          <h2>Upcoming Events</h2>");
			response.AppendLine($"                        </div>");
			response.AppendLine($"                        <div class=\"small-border\"></div>");
			response.AppendLine($"                    </div>");
			response.AppendLine($"                    <div class=\"row no-gutters\">");
			foreach (Shindig upcomingShindig in upcomingShindigs)
			{
				response.AppendLine($"                        <div class=\"col-lg-4 col-md-6\">");
				response.AppendLine($"                            <div class=\"mask s2\">");
				response.AppendLine($"                                <div class=\"m-date\">{DateRangeToDayString(upcomingShindig.StartDate, upcomingShindig.EndDate)} <span>{upcomingShindig.StartDate.ToString("MMM")}</span></div>");
				response.AppendLine($"                                <div class=\"cover\">");
				response.AppendLine($"                                    <div class=\"c-inner\">");
				response.AppendLine($"                                        <h3><i class=\"fa fa-circle-thin\"></i><span>{upcomingShindig.ShindigName}</span></h3>");
				response.AppendLine($"                                        <p>{upcomingShindig.ShindigSummary}</p>");
				response.AppendLine($"                                        <div class=\"spacer20\"></div>");
				response.AppendLine($"                                        <a href=\"{upcomingShindig.Permalink}.html\" class=\"btn-custom capsule\">Event Details</a>");
				response.AppendLine($"                                    </div>");
				response.AppendLine($"                                </div>");
				response.AppendLine($"                                <img src=\"images/conferences/{upcomingShindig.Permalink}.png\" alt=\"{upcomingShindig.ShindigName}\" class=\"img-responsive\" />");
				response.AppendLine($"                            </div>");
				response.AppendLine($"                        </div>");
			}
			response.AppendLine($"                    </div>");
			response.AppendLine($"                </div>");
			return response.ToString();
		}
		return string.Empty;
	}

	private string AddEngagementsForYear(List<Shindig> shindigs, int year)
	{
		if (shindigs is not null && shindigs.Any())
		{
			List<Shindig> shindigsInYear = shindigs.Where(x => x.StartDate.Year == year).ToList();
			if (shindigsInYear is not null && shindigsInYear.Any())
			{
				StringBuilder response = new();
				response.AppendLine($"<div class=\"container\">");
				response.AppendLine($"                  <div class=\"row\">");
				response.AppendLine($"                    <div class=\"col-md-12 text-center\">");
				response.AppendLine($"                      <h2>{year} Events</h2>");
				response.AppendLine($"                    </div>");
				response.AppendLine($"                    <div class=\"small-border\"></div>");
				response.AppendLine($"                  </div>");
				response.AppendLine($"                  <div class=\"row\">");
				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Dates</strong></div>");
				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Event</strong></div>");
				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Location</strong></div>");
				response.AppendLine($"                  </div>");
				for (int i = 0; i < shindigsInYear.Count; i++)
				{
					if (i % 2 == 0)
						response.AppendLine($"                  <div class=\"row\" data-bgcolor=\"#EEEEEE\" onclick=\"location.href='{shindigs[i].Permalink}.html';\" style=\"cursor: pointer\">");
					else
						response.AppendLine($"                  <div class=\"row\" onclick=\"location.href='{shindigsInYear[i].Permalink}.html';\" style=\"cursor: pointer\">");
					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{DateRangeToString(shindigsInYear[i].StartDate, shindigsInYear[i].EndDate)}</div>");
					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{shindigsInYear[i].ShindigName}</div>");
					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{shindigsInYear[i].ListingLocation}</div>");
					response.AppendLine($"                  </div>");
				}
				response.AppendLine($"                </div>");
				return response.ToString();
			}
		}
		return string.Empty;
	}

	private string AddEngagementListing(List<Shindig> shindigs)
	{

		if (shindigs is not null && shindigs.Any())
		{
			StringBuilder response = new();
			List<Shindig> upcomingShindigs = shindigs.Where(x => x.StartDate >= DateTime.UtcNow).OrderBy(x => x.StartDate).ToList();
			if (upcomingShindigs is not null && upcomingShindigs.Any())
			{
				response.Append(AddUpcomingEngagementListing(upcomingShindigs));
				response.AppendLine("<br /><br />");
			}

			List<int> engagementYears = shindigs.Select(x => x.StartDate.Year).Distinct().ToList();
			foreach (int engagementYear in engagementYears)
			{
				response.AppendLine(AddEngagementsForYear(shindigs, engagementYear));
				response.AppendLine("<br /><br />");
			}
			return response.ToString();
		}
		return string.Empty;
	}

	private string DateRangeToDayString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.Day.ToString();
		else
			return $"{startDate.Day}-{endDate.Day}";
	}

	private string DateRangeToString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.ToString("MMMM d");
		else if (startDate.Month == endDate.Month)
			return $"{startDate.ToString("MMMM d")} - {endDate.Day}";
		else
			return $"{startDate.ToString("MMMM d")} - {endDate.ToString("MMMM d")}";
	}

	private string AddEngagementCosts(Shindig shindig)
	{
		if ((shindig.StartingCost is not null && shindig.StartingCost != "N/A") || (shindig.EndingCost is not null && shindig.EndingCost != "N/A"))
		{
			string costs;
			if (shindig.StartingCost is not null)
			{
				if (shindig.StartingCost != shindig.EndingCost)
					costs = $"{shindig.StartingCost} to {shindig.EndingCost}";
				else
					costs = shindig.StartingCost;
			}
			else
			{
				costs = shindig.EndingCost;
			}

			StringBuilder response = new();
			response.AppendLine($"<div class=\"sm-icon mb30\">");
			response.AppendLine($"                <i class=\"bg-color fa fa-money\"></i>");
			response.AppendLine($"                <div class=\"si-inner\">");
			response.AppendLine($"                  <h5>Costs</h5>");
			response.AppendLine($"                  {costs}");
			response.AppendLine($"                </div>");
			response.AppendLine($"              </div>");
			return response.ToString();
		}
		else
		{
			return string.Empty;
		}
	}

	private string AddPresentations(List<ShindigPresentation> shindigPresentations)
	{
		if (shindigPresentations is not null && shindigPresentations.Any())
		{
			StringBuilder response = new();
			response.AppendLine($"<div class=\"col-md-8\">");
			response.AppendLine($"              <h4>Presentations</h4>");
			response.AppendLine($"              <div class=\"row\">");
			foreach (ShindigPresentation shindigPresentation in shindigPresentations)
			{
				response.AppendLine($"                <div class=\"col-lg-5 col-md-6 col-sm-6 mb30 wow fadeInRight\" data-wow-delay=\".2s\">");
				response.AppendLine($"                  <div class=\"f-profile text-center\">");
				response.AppendLine($"                    <a href=\"{shindigPresentation.Presentation.Permalink}.html\">");
				response.AppendLine($"                      <div class=\"fp-wrap f-invert\">");
				response.AppendLine($"                        <img src=\"images/presentations/{shindigPresentation.Presentation.Permalink}.jpg\" class=\"fp-image img-fluid\" alt=\"{shindigPresentation.Presentation.PresentationTitle}\">");
				response.AppendLine($"                      </div>");
				response.AppendLine($"                      <h4>{shindigPresentation.Presentation.PresentationTitle}</h4>");
				response.AppendLine($"                    </a>");
				if (shindigPresentation.StartDateTime is not null || shindigPresentation.EndDateTime is not null)
					response.AppendLine($"                    <i class=\"fa fa-calendar\"></i> {shindigPresentation.StartDateTime?.ToString("MMMM d, yyyy") ?? shindigPresentation.EndDateTime?.ToString("MMMM d, yyyy")}<br />");
				if (shindigPresentation.StartDateTime is not null || shindigPresentation.EndDateTime is not null)
					response.AppendLine($"                    <i class=\"fa fa-clock-o\"></i> {shindigPresentation.StartDateTime?.ToString("h:mm tt") ?? shindigPresentation.EndDateTime?.ToString("h:mm tt")} {shindigPresentation.TimeZone}<br />");
				response.AppendLine($"                    <i class=\"fa fa-map-marker\"></i> {shindigPresentation.Room ?? "TBA"}<br />");
				if (shindigPresentation.ShindigPresentationDownloads is not null && shindigPresentation.ShindigPresentationDownloads.Any())
					foreach (ShindigPresentationDownload shindigPresentationDownload in shindigPresentation.ShindigPresentationDownloads)
						response.AppendLine($"                    <a href=\"{shindigPresentationDownload.DownloadLink}\" class=\"btn-custom\" target=\"_blank\">{shindigPresentationDownload.DownloadName}</a>");
				response.AppendLine($"                  </div>");
				response.AppendLine($"                </div>");
			}
			response.AppendLine($"              </div>");
			response.AppendLine($"            </div>");
			return response.ToString();
		}
		else
		{
			return string.Empty;
		}
	}

}