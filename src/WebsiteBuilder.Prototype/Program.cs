const string workingDirectoryPath = @"D:\Repos\TaleLearnCode\ChadGreen.com\";
const string sourceUrl = "https://github.com/TaleLearnCode/ChadGreen.com.git";
const string repoName = "TaleLearnCode";
const string signatureEmailAddress = "chad.green@talelearncode.com";
const string branchName = "main";

Console.Write("Personal Access Token: ");
string? accessToken = Console.ReadLine();
if (accessToken is not null)
{

	using ProgressBar progressBar = new(6, "Retrieving website data...");

	using WebsiteBuilderContext websiteBuilderContext = new();
	List<Shindig> speakingEngagements = await websiteBuilderContext.Shindigs.ToListAsync();
	List<Shindig> upcomingSpeakingEngagements = speakingEngagements.Where(x => x.StartDate >= DateTime.UtcNow).ToList();
	List<Presentation> presentations = await websiteBuilderContext.Presentations.ToListAsync();

	progressBar.Tick("Connecting to the git repository...");
	if (!Directory.Exists(workingDirectoryPath) || Pull() == MergeStatus.Conflicts)
	{
		Directory.Delete(workingDirectoryPath, true);
		Clone();
	}
	using Repository repository = new(workingDirectoryPath);
	Checkout(repository);

	SpeakingEnagementServices speakingEnagementServices = new(websiteBuilderContext, repository, workingDirectoryPath, upcomingSpeakingEngagements);
	PresentationServices presentationServices = new(websiteBuilderContext, repository, workingDirectoryPath, upcomingSpeakingEngagements);

	progressBar.Tick("Building speaking engagements listing page...");
	bool speakingEngagementListingChanges = await speakingEnagementServices.BuildSpeakingEngagmentListAsync(speakingEngagements);

	progressBar.Tick("Building speaking engagement detail pages...");
	bool speakingEngagementDetailChanges = await speakingEnagementServices.BuildSpeakingEngagmentPagesAsync(speakingEngagements, progressBar);

	progressBar.Tick("Buidling presentation listing page...");
	bool presentationListingChanges = await presentationServices.BuildListingPageAsync(presentations);

	if (speakingEngagementListingChanges || speakingEngagementDetailChanges || presentationListingChanges)
	{
		progressBar.Tick("Committing changes to the git repository...");
		Commit(repository);
		Push(repository);
	}

}





void Clone()
{
	CloneOptions cloneOptions = new();
	cloneOptions.CredentialsProvider = (_url, _user, _cred) => GetCredentials();
	Repository.Clone(sourceUrl, workingDirectoryPath, cloneOptions);
}

MergeStatus Pull()
{
	using Repository repository = new(workingDirectoryPath);
	PullOptions pullOptions = new();
	pullOptions.FetchOptions = new FetchOptions();
	pullOptions.FetchOptions.CredentialsProvider = new CredentialsHandler((FormUrlEncodedContent, usernameFromUrl, SupportedCredentialTypes) => GetCredentials());
	return Commands.Pull(repository, GetSignature(), pullOptions).Status;
}

void Checkout(Repository repository)
{
	Branch branch = repository.Branches[branchName];
	// If (branch is null) Throw Exception
	Commands.Checkout(repository, branch);
}

void Commit(Repository repository)
{
	Signature signature = GetSignature();
	repository.Commit("Static website builder", signature, signature);
}

void Push(Repository repository)
{
	try
	{
		PushOptions pushOptions = new();
		pushOptions.CredentialsProvider = new CredentialsHandler((url, usernameFromUrl, types) => GetCredentials());
		repository.Network.Push(repository.Branches[branchName], pushOptions);
	}
	catch (LibGit2SharpException ex)
	{
		Console.WriteLine($"Failed to push the changes: {ex.Message}");
	}
	catch (Exception ex)
	{
		Console.WriteLine(ex.Message);
	}
}

UsernamePasswordCredentials GetCredentials()
	=> new UsernamePasswordCredentials()
	{
		Username = accessToken,
		Password = string.Empty
	};

Signature GetSignature()
	=> new(new Identity(repoName, signatureEmailAddress), DateTimeOffset.Now);








//using Microsoft.EntityFrameworkCore;
//using WebsiteBuilder.Prototype.Data;

////GitHubClient gitHubClient = new GitHubClient(new ProductHeaderValue("MyCoolApp"));
//////User user = await gitHubClient.User.Get("talelearncode");
//////Console.WriteLine($"Woah! TaleLearnCode has {user.PublicRepos} public repositories.");
////gitHubClient.Credentials = new("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");
//////IReadOnlyList<RepositoryContent> fileDetails = await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main");
////Dictionary<string, RepositoryContent> repositoryContents = (await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main")).ToDictionary(x => x.Name, x => x);

////Console.WriteLine(repositoryContents.Count);


//const string outputPath = @"D:\Temp\";
//const string templatePath = @"D:\Repos\TaleLearnCode\WebsiteBuilder\src\WebsiteBuilder.Prototype\PageTemplates\";
//const string presentationDetailTemplatePath = $"{templatePath}template_presentation.html";
//const string presenationListTemplatePath = $"{templatePath}template_presentations.html";
//const string speakingEngaementListTemplatePath = $"{templatePath}template_speaking-engagements.html";
//const string speakingEngaementDetailTemplatePath = $"{templatePath}template_speaking-engagement.html";

//const string repoOwner = "TaleLearnCode";
//const string repoName = "ChadGreen.com";
//const string repoFilePath = "src";
//const string repoBranch = "main";

//using WebsiteBuilderContext websiteBuilderContext = new WebsiteBuilderContext();

//Console.WriteLine("Retrieving list of speaking engagements...");
//List<Shindig> speakingEngagements = await websiteBuilderContext.Shindigs
//	.Include(x => x.ShindigPresentations)
//		.ThenInclude(x => x.ShindigPresentationDownloads)
//	.OrderBy(x => x.StartDate)
//	.ToListAsync();

//List<Shindig> upcomingShindigs = speakingEngagements
//	.Where(x => x.EndDate >= DateTime.UtcNow)
//	.OrderBy(x => x.StartDate)
//	.ToList();






////Console.WriteLine("Retrieving the upcoming shindig...");
////List<Shindig> upcomingShindigs = await websiteBuilderContext.Shindigs
////	.Where(x => x.EndDate >= DateTime.UtcNow)
////	.OrderBy(x => x.StartDate)
////	.ToListAsync();

//Console.WriteLine("Retrieving the GitHub repository content details...");
////GitHubClient gitHubClient = new GitHubClient(new ProductHeaderValue("MyCoolApp"));
////gitHubClient.Credentials = new("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");
////Dictionary<string, RepositoryContent> repositoryContents = (await gitHubClient.Repository.Content.GetAllContentsByRef("TaleLearnCode", "ChadGreen.com", "src", "main")).ToDictionary(x => x.Name, x => x);


////SpeakingEngagementServices2 speakingEngagementServices = new(upcomingShindigs, gitHubClient, websiteBuilderContext, outputPath, templatePath, repoOwner, repoName, repoFilePath, repoBranch, repositoryContents);
////await speakingEngagementServices.BuildSpeakingEngagementListingAsync(true, true, speakingEngagements);








////Console.WriteLine("Retrieving list of presentations...");
////List<Presentation> presentations = await websiteBuilderContext.Presentations
////	.Include(x => x.PresentationTags)
////		.ThenInclude(x => x.Tag)
////	.Include(x => x.PresentationType)
////	.Include(x => x.LearningObjectives)
////	.Include(x => x.PresentationRelatedRelatedPresentations)
////	.Include(x => x.ShindigPresentations)
////		.ThenInclude(x => x.Shindig)
////	.Include(x => x.ShindigPresentations)
////		.ThenInclude(x => x.ShindigPresentationDownloads)
////	.ToListAsync();


////using ProgressBar progressBar = new(presentations.Count + 2 + speakingEngagements.Count, $"Building static pages (1 of {presentations.Count + 2})");

////PresentationServices presentationServices = new(upcomingShindigs, outputPath);
////await presentationServices.BuildPresentationListPageAsync(presentations, presenationListTemplatePath);
////ProgressBarTick();
////foreach (Presentation presentation in presentations)
////{
////	await presentationServices.BuildPresentationPageAsync(presentation, presentationDetailTemplatePath);
////	ProgressBarTick();
////}

////SpeakingEngagementServices speakingEngagementServices = new(upcomingShindigs, outputPath);
////List<Shindig> shindigs = await websiteBuilderContext.Shindigs
////	.OrderByDescending(x => x.StartDate)
////	.ToListAsync();
////await speakingEngagementServices.BuildShindigListingPageAsync(shindigs, speakingEngaementListTemplatePath);
////ProgressBarTick();

////foreach (Shindig speakingEngagement in speakingEngagements)
////{
////	await speakingEngagementServices.BuildShiningDetailPageAsync(speakingEngagement, speakingEngaementDetailTemplatePath);
////	ProgressBarTick();
////}



////void ProgressBarTick() =>
////	progressBar.Tick($"Building static pages ({progressBar.CurrentTick + 1} of {progressBar.MaxTicks})");