namespace WebsiteBuilder.Prototype.Services;

internal abstract class ServicesBase
{

	private readonly WebsiteBuilderContext _websiteBuilderContext;
	private readonly Repository _repository;
	private readonly string _sourceDirectoryPath;
	private readonly string _templateDirectoryPath;
	private readonly List<Shindig> _upcomingSpeakingEngagements;

	protected ServicesBase(
		WebsiteBuilderContext websiteBuilderContext,
		Repository repository,
		string workingDirectoryPath,
		List<Shindig> upcomingSpeakingEngagements)
	{
		_websiteBuilderContext = websiteBuilderContext;
		_repository = repository;
		_sourceDirectoryPath = @$"{workingDirectoryPath}src\";
		_templateDirectoryPath = @$"{workingDirectoryPath}\templates\";
		_upcomingSpeakingEngagements = upcomingSpeakingEngagements;
	}

	protected bool TryGetTemplateDetails(
		int templateTypeId,
		out Template? template)
	{
		template = _websiteBuilderContext.Templates
			.Include(x => x.TemplateType)
			.FirstOrDefault(x => x.TemplateTypeId == templateTypeId);
		return template is not null;
	}

	protected async Task<List<string>> ReadTemplateAsync(string templateFileName)
	{
		List<string> response = new();
		foreach (string templateLine in await File.ReadAllLinesAsync($"{_templateDirectoryPath}{templateFileName}"))
			response.Add(templateLine);
		return response;
	}

	protected async Task<string> GlobalReplacements(string templateLine)
	{
		if (templateLine.Contains("<template_upcomingeventscarousel></template_upcomingeventscarousel>"))
			templateLine = templateLine.Replace("<template_upcomingeventscarousel></template_upcomingeventscarousel>", AddUpcomingShindigCarousel());
		if (templateLine.Contains("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>"))
			templateLine = templateLine.Replace("<template_upcomingspeakingengagementslist></template_upcomingspeakingengagementslist>", AddUpcomingShindigListing());
		if (templateLine.Contains("<template_upcomingmeetups></template_upcomingmeetups>"))
			templateLine = templateLine.Replace("<template_upcomingmeetups></template_upcomingmeetups>", AddUpcomingMeetupsListing());
		if (templateLine.Contains("<template_footer></template_footer>"))
			templateLine = templateLine.Replace("<template_footer></template_footer>", await AddFooterAsync());
		return templateLine;
	}

	protected string AddUpcomingShindigCarousel()
	{
		if (_upcomingSpeakingEngagements is not null && _upcomingSpeakingEngagements.Any())
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
			foreach (Shindig upcomingShindig in _upcomingSpeakingEngagements)
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

	protected string AddUpcomingShindigListing()
	{
		StringBuilder response = new();
		if (_upcomingSpeakingEngagements is not null && _upcomingSpeakingEngagements.Any())
		{
			response.AppendLine($"            <ul class=\"ul-style-2\">");
			int engagementsToShow = (_upcomingSpeakingEngagements.Count > 3) ? 3 : _upcomingSpeakingEngagements.Count;
			for (int i = 0; i < engagementsToShow; i++)
				response.AppendLine($"              <li><a href=\"{_upcomingSpeakingEngagements[i].Permalink}.html\">{_upcomingSpeakingEngagements[i].ShindigName}</a></li>");
			if (_upcomingSpeakingEngagements.Count > 3)
				response.AppendLine($"              <li><a href=\"speaking-engagements.html\">All upcoming speaking engagements</a></li>");
			response.AppendLine($"            </ul>");
		}
		else
		{
			response.AppendLine("<p>No upcoming speaking engagements</p>");
		}
		return response.ToString();
	}

	protected string AddUpcomingMeetupsListing()
	{
		StringBuilder response = new();
		response.AppendLine("<p>No upcoming meetups</p>");
		return response.ToString();
	}

	protected async Task<string> AddFooterAsync()
	{
		StringBuilder response = new();
		if (TryGetTemplateDetails(TemplateTypeIdValues.Footer, out Template? templateDetails) && templateDetails is not null)
		{
			List<string> template = await ReadTemplateAsync(templateDetails.TemplateFileName);
			foreach (string templateLine in template)
				response.AppendLine(await GlobalReplacements(templateLine));
		}
		return response.ToString();
	}

	protected string DateRangeToDayString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.Day.ToString();
		else
			return $"{startDate.Day}-{endDate.Day}";
	}

	protected string DateRangeToString(DateTime startDate, DateTime endDate)
	{
		if (startDate.Date == endDate.Date)
			return startDate.ToString("MMMM d");
		else if (startDate.Month == endDate.Month)
			return $"{startDate.ToString("MMMM d")} - {endDate.Day}";
		else
			return $"{startDate.ToString("MMMM d")} - {endDate.ToString("MMMM d")}";
	}

	protected void AddFileToGetIndex(string pathInWorkingDirectory)
	{
		_repository.Index.Add(pathInWorkingDirectory);
		_repository.Index.Write();
	}

	protected string GetPathInWorkingDirectory(string fileName)
		=> @$"src\{fileName}";

	protected string GetPathWithWorkingDirectory(string fileName)
		=> $"{_sourceDirectoryPath}{fileName}";

}