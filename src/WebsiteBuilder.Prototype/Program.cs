using Microsoft.EntityFrameworkCore;
using ShellProgressBar;
using WebsiteBuilder.Prototype.Data;
using WebsiteBuilder.Prototype.Models;
using WebsiteBuilder.Prototype.Services;

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

using ProgressBar progressBar = new(presentations.Count, $"Building presenation pages (1 of {presentations.Count})");
PresentationServices presentationServices = new(@"D:\Repos\TaleLearnCode\WebsiteBuilder\src\WebsiteBuilder.Prototype\PageTemplates\template_presentation.html", upcomingShindigs, @"D:\Temp\");
foreach (Presentation presentation in presentations)
{
	await presentationServices.BuildPresentationPage(presentation, progressBar);
	progressBar.Tick($"Building presentation pages ({progressBar.CurrentTick + 1} of {progressBar.MaxTicks})");
}