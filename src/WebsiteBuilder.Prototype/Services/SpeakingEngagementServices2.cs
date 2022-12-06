//using System.Text;
//using WebsiteBuilder.Prototype.Data;

//namespace WebsiteBuilder.Prototype.Services;

//internal class SpeakingEngagementServices2 : ServicesBase
//{

//	private const int _speakingEngagementListTemplateTypeId = 1;

//	internal SpeakingEngagementServices2(
//		List<Shindig> upcomingSpeakingEngagements,
//		GitHubClient gitHubClient,
//		WebsiteBuilderContext websiteBuilderContext,
//		string outputPath,
//		string templatePath,
//		string repoOwner,
//		string repoName,
//		string repoFilePath,
//		string repoBranch,
//		Dictionary<string, RepositoryContent> repositoryContents) : base(upcomingSpeakingEngagements, gitHubClient, websiteBuilderContext, outputPath, templatePath, repoOwner, repoName, repoFilePath, repoBranch, repositoryContents) { }

//	internal async Task BuildSpeakingEngagementListingAsync(
//		bool pushToGitHub,
//		bool saveLocally,
//		List<Shindig> speakingEngagements)
//	{

//		if (TryGetTemplateDetails(_speakingEngagementListTemplateTypeId, out Template? templateDetails) && templateDetails is not null && templateDetails.TemplateType.Permalink is not null)
//		{
//			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
//			StringBuilder pageHtml = new();
//			foreach (string templateLine in template)
//			{
//				string lineHtml = await GlobalReplacements(templateLine);
//				if (lineHtml.Contains("<template-engagements_listing></template-engagements_listing>"))
//					lineHtml = lineHtml.Replace("<template-engagements_listing></template-engagements_listing>", AddEngagementListing(speakingEngagements));
//				pageHtml.AppendLine(lineHtml);
//			}

//			if (saveLocally)
//			{
//				await File.WriteAllTextAsync($"{_ouptutPath}{templateDetails.TemplateType.Permalink}", pageHtml.ToString());
//			}
//			if (pushToGitHub)
//			{
//				if (_repositoryContents.TryGetValue(templateDetails.TemplateType.Permalink, out RepositoryContent? repositoryContent) && repositoryContent is not null)
//				{
//					if (pageHtml.ToString() != repositoryContent.Content)
//					{
//						RepositoryContentChangeSet updateResult = await _gitHubClient.Repository.Content.UpdateFile(_repoOwner, _repoName, $"{_repoFilePath}{templateDetails.TemplateType.Permalink}",
//							new UpdateFileRequest("My updated file", pageHtml.ToString(), repositoryContent.Sha));
//						await RecordGitHubCommit(updateResult, _updateCommit, templateDetails.TemplateId, templateDetails.TemplateType.Permalink);
//					}
//				}
//				else
//				{
//					RepositoryContentChangeSet updateResult = await _gitHubClient.Repository.Content.CreateFile(_repoOwner, _repoName, $"{_repoFilePath}{templateDetails.TemplateType.Permalink}",
//						new CreateFileRequest($"First commit for {templateDetails.TemplateType.Permalink}", pageHtml.ToString(), _repoBranch));
//					await RecordGitHubCommit(updateResult, _createCommit, templateDetails.TemplateId, templateDetails.TemplateType.Permalink);
//				}

//			}

//		}



//	}

//	private string AddEngagementListing(List<Shindig> shindigs)
//	{

//		if (shindigs is not null && shindigs.Any())
//		{
//			StringBuilder response = new();
//			List<Shindig> upcomingShindigs = shindigs.Where(x => x.StartDate >= DateTime.UtcNow).OrderBy(x => x.StartDate).ToList();
//			if (upcomingShindigs is not null && upcomingShindigs.Any())
//			{
//				response.Append(AddUpcomingEngagementListing(upcomingShindigs));
//				response.AppendLine("<br /><br />");
//			}

//			List<int> engagementYears = shindigs.Select(x => x.StartDate.Year).Distinct().ToList();
//			foreach (int engagementYear in engagementYears)
//			{
//				response.AppendLine(AddEngagementsForYear(shindigs, engagementYear));
//				response.AppendLine("<br /><br />");
//			}
//			return response.ToString();
//		}
//		return string.Empty;
//	}

//	private string AddUpcomingEngagementListing(List<Shindig> upcomingShindigs)
//	{
//		if (upcomingShindigs is not null && upcomingShindigs.Any())
//		{
//			StringBuilder response = new();
//			response.AppendLine($"<div class=\"container\">");
//			response.AppendLine($"                    <div class=\"row\">");
//			response.AppendLine($"                        <div class=\"col-md-12 text-center\">");
//			response.AppendLine($"                          <h2>Upcoming Events</h2>");
//			response.AppendLine($"                        </div>");
//			response.AppendLine($"                        <div class=\"small-border\"></div>");
//			response.AppendLine($"                    </div>");
//			response.AppendLine($"                    <div class=\"row no-gutters\">");
//			foreach (Shindig upcomingShindig in upcomingShindigs)
//			{
//				response.AppendLine($"                        <div class=\"col-lg-4 col-md-6\">");
//				response.AppendLine($"                            <div class=\"mask s2\">");
//				response.AppendLine($"                                <div class=\"m-date\">{DateRangeToDayString(upcomingShindig.StartDate, upcomingShindig.EndDate)} <span>{upcomingShindig.StartDate.ToString("MMM")}</span></div>");
//				response.AppendLine($"                                <div class=\"cover\">");
//				response.AppendLine($"                                    <div class=\"c-inner\">");
//				response.AppendLine($"                                        <h3><i class=\"fa fa-circle-thin\"></i><span>{upcomingShindig.ShindigName}</span></h3>");
//				response.AppendLine($"                                        <p>{upcomingShindig.ShindigSummary}</p>");
//				response.AppendLine($"                                        <div class=\"spacer20\"></div>");
//				response.AppendLine($"                                        <a href=\"{upcomingShindig.Permalink}.html\" class=\"btn-custom capsule\">Event Details</a>");
//				response.AppendLine($"                                    </div>");
//				response.AppendLine($"                                </div>");
//				response.AppendLine($"                                <img src=\"images/conferences/{upcomingShindig.Permalink}.png\" alt=\"{upcomingShindig.ShindigName}\" class=\"img-responsive\" />");
//				response.AppendLine($"                            </div>");
//				response.AppendLine($"                        </div>");
//			}
//			response.AppendLine($"                    </div>");
//			response.AppendLine($"                </div>");
//			return response.ToString();
//		}
//		return string.Empty;
//	}

//	private string AddEngagementsForYear(List<Shindig> shindigs, int year)
//	{
//		if (shindigs is not null && shindigs.Any())
//		{
//			List<Shindig> shindigsInYear = shindigs.Where(x => x.StartDate.Year == year).ToList();
//			if (shindigsInYear is not null && shindigsInYear.Any())
//			{
//				StringBuilder response = new();
//				response.AppendLine($"<div class=\"container\">");
//				response.AppendLine($"                  <div class=\"row\">");
//				response.AppendLine($"                    <div class=\"col-md-12 text-center\">");
//				response.AppendLine($"                      <h2>{year} Events</h2>");
//				response.AppendLine($"                    </div>");
//				response.AppendLine($"                    <div class=\"small-border\"></div>");
//				response.AppendLine($"                  </div>");
//				response.AppendLine($"                  <div class=\"row\">");
//				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Dates</strong></div>");
//				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Event</strong></div>");
//				response.AppendLine($"                    <div class=\"col-md-4 text-center\"><strong>Location</strong></div>");
//				response.AppendLine($"                  </div>");
//				for (int i = 0; i < shindigsInYear.Count; i++)
//				{
//					if (i % 2 == 0)
//						response.AppendLine($"                  <div class=\"row\" data-bgcolor=\"#EEEEEE\" onclick=\"location.href='{shindigs[i].Permalink}.html';\" style=\"cursor: pointer\">");
//					else
//						response.AppendLine($"                  <div class=\"row\" onclick=\"location.href='{shindigsInYear[i].Permalink}.html';\" style=\"cursor: pointer\">");
//					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{DateRangeToString(shindigsInYear[i].StartDate, shindigsInYear[i].EndDate)}</div>");
//					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{shindigsInYear[i].ShindigName}</div>");
//					response.AppendLine($"                    <div class=\"col-md-4 text-center\">{shindigsInYear[i].ListingLocation}</div>");
//					response.AppendLine($"                  </div>");
//				}
//				response.AppendLine($"                </div>");
//				return response.ToString();
//			}
//		}
//		return string.Empty;
//	}




//}