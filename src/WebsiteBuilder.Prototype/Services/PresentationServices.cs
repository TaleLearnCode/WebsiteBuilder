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

}