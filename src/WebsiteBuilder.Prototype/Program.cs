using Microsoft.EntityFrameworkCore;
using WebsiteBuilder.Prototype.Data;
using WebsiteBuilder.Prototype.Services;

//GitHubClient gitHubClient = new GitHubClient(new ProductHeaderValue("MyCoolApp"));
////User user = await gitHubClient.User.Get("talelearncode");
////Console.WriteLine($"Woah! TaleLearnCode has {user.PublicRepos} public repositories.");
//gitHubClient.Credentials = new("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");
////IReadOnlyList<RepositoryContent> fileDetails = await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main");
//Dictionary<string, RepositoryContent> repositoryContents = (await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main")).ToDictionary(x => x.Name, x => x);

//Console.WriteLine(repositoryContents.Count);


const string outputPath = @"D:\Temp\";
const string templatePath = @"D:\Repos\TaleLearnCode\WebsiteBuilder\src\WebsiteBuilder.Prototype\PageTemplates\";
const string presentationDetailTemplatePath = $"{templatePath}template_presentation.html";
const string presenationListTemplatePath = $"{templatePath}template_presentations.html";
const string speakingEngaementListTemplatePath = $"{templatePath}template_speaking-engagements.html";
const string speakingEngaementDetailTemplatePath = $"{templatePath}template_speaking-engagement.html";

const string repoOwner = "TaleLearnCode";
const string repoName = "ChadGreen.com";
const string repoFilePath = "src";
const string repoBranch = "main";

using WebsiteBuilderContext websiteBuilderContext = new WebsiteBuilderContext();

Console.WriteLine("Retrieving list of speaking engagements...");
List<Shindig> speakingEngagements = await websiteBuilderContext.Shindigs
	.Include(x => x.ShindigPresentations)
		.ThenInclude(x => x.ShindigPresentationDownloads)
	.OrderBy(x => x.StartDate)
	.ToListAsync();

List<Shindig> upcomingShindigs = speakingEngagements
	.Where(x => x.EndDate >= DateTime.UtcNow)
	.OrderBy(x => x.StartDate)
	.ToList();






//Console.WriteLine("Retrieving the upcoming shindig...");
//List<Shindig> upcomingShindigs = await websiteBuilderContext.Shindigs
//	.Where(x => x.EndDate >= DateTime.UtcNow)
//	.OrderBy(x => x.StartDate)
//	.ToListAsync();

Console.WriteLine("Retrieving the GitHub repository content details...");
GitHubClient gitHubClient = new GitHubClient(new ProductHeaderValue("MyCoolApp"));
gitHubClient.Credentials = new("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");
Dictionary<string, RepositoryContent> repositoryContents = (await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main")).ToDictionary(x => x.Name, x => x);


SpeakingEngagementServices2 speakingEngagementServices = new(upcomingShindigs, gitHubClient, websiteBuilderContext, outputPath, templatePath, repoOwner, repoName, repoFilePath, repoBranch, repositoryContents);
await speakingEngagementServices.BuildSpeakingEngagementListingAsync(true, true, speakingEngagements);








//Console.WriteLine("Retrieving list of presentations...");
//List<Presentation> presentations = await websiteBuilderContext.Presentations
//	.Include(x => x.PresentationTags)
//		.ThenInclude(x => x.Tag)
//	.Include(x => x.PresentationType)
//	.Include(x => x.LearningObjectives)
//	.Include(x => x.PresentationRelatedRelatedPresentations)
//	.Include(x => x.ShindigPresentations)
//		.ThenInclude(x => x.Shindig)
//	.Include(x => x.ShindigPresentations)
//		.ThenInclude(x => x.ShindigPresentationDownloads)
//	.ToListAsync();


//using ProgressBar progressBar = new(presentations.Count + 2 + speakingEngagements.Count, $"Building static pages (1 of {presentations.Count + 2})");

//PresentationServices presentationServices = new(upcomingShindigs, outputPath);
//await presentationServices.BuildPresentationListPageAsync(presentations, presenationListTemplatePath);
//ProgressBarTick();
//foreach (Presentation presentation in presentations)
//{
//	await presentationServices.BuildPresentationPageAsync(presentation, presentationDetailTemplatePath);
//	ProgressBarTick();
//}

//SpeakingEngagementServices speakingEngagementServices = new(upcomingShindigs, outputPath);
//List<Shindig> shindigs = await websiteBuilderContext.Shindigs
//	.OrderByDescending(x => x.StartDate)
//	.ToListAsync();
//await speakingEngagementServices.BuildShindigListingPageAsync(shindigs, speakingEngaementListTemplatePath);
//ProgressBarTick();

//foreach (Shindig speakingEngagement in speakingEngagements)
//{
//	await speakingEngagementServices.BuildShiningDetailPageAsync(speakingEngagement, speakingEngaementDetailTemplatePath);
//	ProgressBarTick();
//}



//void ProgressBarTick() =>
//	progressBar.Tick($"Building static pages ({progressBar.CurrentTick + 1} of {progressBar.MaxTicks})");