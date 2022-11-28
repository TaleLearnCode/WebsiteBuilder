using Microsoft.EntityFrameworkCore;
using ShellProgressBar;
using WebsiteBuilder.Prototype.Data;
using WebsiteBuilder.Prototype.Models;
using WebsiteBuilder.Prototype.Services;

const string templatePath = @"D:\Repos\TaleLearnCode\WebsiteBuilder\src\WebsiteBuilder.Prototype\PageTemplates\";
const string presentationDetailTemplatePath = $"{templatePath}template_presentation.html";
const string presenationListTemplatePath = $"{templatePath}template_presentations.html";

using WebsiteBuilderContext websiteBuilderContext = new WebsiteBuilderContext();

Console.WriteLine("Retrieving the upcoming shindig...");
List<Shindig> upcomingShindigs = await websiteBuilderContext.Shindigs
	.Where(x => x.EndDate >= DateTime.UtcNow)
	.OrderBy(x => x.StartDate)
	.ToListAsync();

Console.WriteLine("Retrieving list of presentations...");
List<Presentation> presentations = await websiteBuilderContext.Presentations
	.Include(x => x.PresentationTags)
		.ThenInclude(x => x.Tag)
	.Include(x => x.PresentationType)
	.Include(x => x.LearningObjectives)
	.Include(x => x.PresentationRelatedRelatedPresentations)
	.Include(x => x.ShindigPresentations)
		.ThenInclude(x => x.Shindig)
	.Include(x => x.ShindigPresentations)
		.ThenInclude(x => x.ShindigPresentationDownloads)
	.ToListAsync();

using ProgressBar progressBar = new(presentations.Count, $"Building static pages (1 of {presentations.Count + 1})");
PresentationServices presentationServices = new(upcomingShindigs, @"D:\Temp\");
await presentationServices.BuildPresentationListPageAsync(presentations, presenationListTemplatePath);
foreach (Presentation presentation in presentations)
{
	await presentationServices.BuildPresentationPageAsync(presentation, presentationDetailTemplatePath);
	progressBar.Tick($"Building presentation pages ({progressBar.CurrentTick + 1} of {progressBar.MaxTicks})");
}