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


}