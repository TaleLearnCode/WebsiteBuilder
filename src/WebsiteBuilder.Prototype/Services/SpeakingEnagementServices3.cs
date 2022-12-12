namespace WebsiteBuilder.Prototype.Services;

internal class SpeakingEnagementServices3 : ServicesBase3
{

	internal SpeakingEnagementServices3(
		WebsiteBuilderContext websiteBuilderContext,
		Repository repository,
		string workingDirectoryPath,
		List<Shindig> upcomingSpeakingEngagements) : base(
			websiteBuilderContext,
			repository,
			workingDirectoryPath,
			upcomingSpeakingEngagements)
	{ }

	internal async Task BuildSpeakingEngagmentListAsync(List<Shindig> speakingEngagements)
	{
		if (TryGetTemplateDetails(TemplateTypeIdValues.SpeakingEngagementListing, out Template? templateDetails) && templateDetails is not null && templateDetails.TemplateType.Permalink is not null)
		{
			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
			StringBuilder pageHtml = new();
			foreach (string templateLine in template)
			{
				string lineHtml = await GlobalReplacements(templateLine);
				if (lineHtml.Contains("<template-engagements_listing></template-engagements_listing>"))
					lineHtml = lineHtml.Replace("<template-engagements_listing></template-engagements_listing>", AddEngagementListing(speakingEngagements));
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
				}
			}
			else
			{
				await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
				AddFileToGetIndex(pathInWorkingDirectory);
			}

		}
	}

	internal async Task BuildSpeakingEngagmentPagesAsync(
		List<Shindig> speakingEngagements,
		ProgressBar parentProgressBar)
	{
		using ChildProgressBar progressBar = parentProgressBar.Spawn(speakingEngagements.Count, null);
		foreach (Shindig speakingEngagement in speakingEngagements)
		{
			await BuildSpeakingEngagementPageAsync(speakingEngagement);
			progressBar.Tick();
		}
	}

	private async Task BuildSpeakingEngagementPageAsync(Shindig speakingEngagment)
	{
		if (TryGetTemplateDetails(TemplateTypeIdValues.SpeakingEngagementDetail, out Template? templateDetails) && templateDetails is not null)
		{
			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
			StringBuilder pageHtml = new();
			foreach (string templateLine in template)
			{
				string lineHtml = await GlobalReplacements(templateLine);
				if (lineHtml.Contains("<template-engagement_name></template-engagement_name>"))
					lineHtml = lineHtml.Replace("<template-engagement_name></template-engagement_name>", speakingEngagment.ShindigName);
				if (lineHtml.Contains("<template-engagement_summarymeta></template-engagement_summarymeta>"))
					lineHtml = lineHtml.Replace("<template-engagement_summarymeta></template-engagement_summarymeta>", speakingEngagment.ShindigSummary);
				if (lineHtml.Contains("<template-engagement_dates></template-engagement_dates>"))
					lineHtml = lineHtml.Replace("<template-engagement_dates></template-engagement_dates>", DateRangeToString(speakingEngagment.StartDate, speakingEngagment.EndDate));
				if (lineHtml.Contains("<template-engagment_description></template-engagment_description>"))
					lineHtml = lineHtml.Replace("<template-engagment_description></template-engagment_description>", speakingEngagment.ShindigDescription);
				if (lineHtml.Contains("<template-engagement_overviewlocation></template-engagement_overviewlocation>"))
					lineHtml = lineHtml.Replace("<template-engagement_overviewlocation></template-engagement_overviewlocation>", speakingEngagment.OverviewLocation);
				if (lineHtml.Contains("<template-engagement_costs></template-engagement_costs>"))
					lineHtml = lineHtml.Replace("<template-engagement_costs></template-engagement_costs>", AddEngagementCosts(speakingEngagment));
				if (lineHtml.Contains("<template-engagement_presentations></template-engagement_presentations>"))
					lineHtml = lineHtml.Replace("<template-engagement_presentations></template-engagement_presentations>", AddPresentations(speakingEngagment.ShindigPresentations.ToList()));
				if (lineHtml.Contains("template-engagement_link"))
					lineHtml = lineHtml.Replace("template-engagement_link", speakingEngagment.ShindigLink);
				if (lineHtml.Contains("template-presentation_permalink"))
					lineHtml = lineHtml.Replace("template-presentation_permalink", speakingEngagment.Permalink);
				pageHtml.AppendLine(lineHtml);
			}

			string permalink = $"{speakingEngagment.Permalink}.html";
			string pathInWorkingDirectory = GetPathInWorkingDirectory(permalink);
			string pathWithWorkingDirectory = GetPathWithWorkingDirectory(permalink);
			if (File.Exists(pathWithWorkingDirectory))
			{
				string currentFile = await File.ReadAllTextAsync(pathWithWorkingDirectory);
				if (pageHtml.ToString() != currentFile)
				{
					await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
					AddFileToGetIndex(pathInWorkingDirectory);
				}
			}
			else
			{
				await File.WriteAllTextAsync(pathWithWorkingDirectory, pageHtml.ToString());
				AddFileToGetIndex(pathInWorkingDirectory);
			}

		}
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

	private string AddEngagementCosts(Shindig speakingEngagement)
	{
		if ((speakingEngagement.StartingCost is not null && speakingEngagement.StartingCost != "N/A") || (speakingEngagement.EndingCost is not null && speakingEngagement.EndingCost != "N/A"))
		{
			string costs;
			if (speakingEngagement.StartingCost is not null)
			{
				if (speakingEngagement.StartingCost != speakingEngagement.EndingCost)
					costs = $"{speakingEngagement.StartingCost} to {speakingEngagement.EndingCost}";
				else
					costs = speakingEngagement.StartingCost;
			}
			else
			{
				costs = speakingEngagement.EndingCost;
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

	private string AddPresentations(List<ShindigPresentation> speakingEngagementPresentations)
	{
		if (speakingEngagementPresentations is not null && speakingEngagementPresentations.Any())
		{
			StringBuilder response = new();
			response.AppendLine($"<div class=\"col-md-8\">");
			response.AppendLine($"              <h4>Presentations</h4>");
			response.AppendLine($"              <div class=\"row\">");
			foreach (ShindigPresentation shindigPresentation in speakingEngagementPresentations)
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