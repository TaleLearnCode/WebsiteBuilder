using LibGit2Sharp;
using LibGit2Sharp.Handlers;

const string username = "chad.green@talelearncode.com";

const string sourceUrl = "https://github.com/TaleLearnCode/GitExploration.git";
const string workingDirectoryPath = @"D:\Temp\GitExploration";

Console.Write("Personal Access Token: ");
string? accessToken = Console.ReadLine();
if (accessToken is not null)
{
	//////Clone();
	////Pull();
	////Checkout();
	//Commit();
	//Push();
	////Push2();
	///

	Clone();
	Checkout();
	Console.WriteLine("Press enter once you make the change");
	Console.ReadLine();
	Add();
	Commit();
	Push();

}




void Clone()
{
	Console.WriteLine("Starting clone");
	CloneOptions cloneOptions = new();
	cloneOptions.CredentialsProvider = (_url, _user, _cred) => GetCredentials();
	Repository.Clone(sourceUrl, workingDirectoryPath, cloneOptions);
	Console.WriteLine("Clone complete");
}

void Pull()
{

	Console.WriteLine("Starting pull");

	using Repository repository = new(workingDirectoryPath);

	// Credential information to fetch
	PullOptions pullOptions = new();
	pullOptions.FetchOptions = new FetchOptions();
	pullOptions.FetchOptions.CredentialsProvider = new CredentialsHandler((url, usernameFromUrl, types) => GetCredentials());

	// User information to create a merge commit
	//Signature signature = new(new Identity("TaleLearnCode", "chad.green@talelearncode.com"), DateTimeOffset.Now);

	// Pull
	MergeResult mergeResult = Commands.Pull(repository, GetSignature(), pullOptions);
	string statusStatement = mergeResult.Status switch
	{
		MergeStatus.UpToDate => "Repository is already up to date. No changes to pull.",
		MergeStatus.FastForward or MergeStatus.NonFastForward => $"Repository updated to commit {GetCommitId(mergeResult.Commit)}.",
		MergeStatus.Conflicts => "Merge resulted in conflicts.",
		_ => "Unrecognized merge status",
	};
	Console.WriteLine(statusStatement);

}

void CreateBranch(string branchName)
{
	Console.WriteLine("Creating local branch");
	using Repository repository = new(workingDirectoryPath);
	repository.CreateBranch(branchName);
	Console.WriteLine("Local branch created");
}

void Checkout()
{
	using Repository repository = new(workingDirectoryPath);
	var branch = repository.Branches["main"];
	if (branch is null)
		Console.WriteLine("Unable to find the branch");
	else
	{
		Branch currentBranch = Commands.Checkout(repository, branch);
		Console.WriteLine($"Checking out the '{currentBranch.FriendlyName}' branch");
	}
}

void AddAndCommit()
{

	string pathInTheWorkdir = "fileToCommit62.txt";

	// Write content to the file system
	using Repository repository = new(workingDirectoryPath);
	//File.WriteAllText(Path.Combine(repository.Info.WorkingDirectory, pathInTheWorkdir), "Commit this!");

	//// Stage the file
	//repository.Index.Add(pathInTheWorkdir);
	//repository.Index.Write();

	// Create the commiter's signature and commit
	Signature signature = GetSignature();

	// Commit to the repository
	Commit commit = repository.Commit("Here's a commit I made!", signature, signature);

	Console.WriteLine($"Commit {GetCommitId(commit)} created locally.");

}

void Add()
{
	string pathInTheWorkdir = "fileToCommit62.txt";
	using Repository repository = new(workingDirectoryPath);
	repository.Index.Add(pathInTheWorkdir);
	repository.Index.Write();
}

void Commit()
{

	string pathInTheWorkdir = "fileToCommit62.txt";

	using Repository repository = new(workingDirectoryPath);

	// Create the commiter's signature and commit
	Signature signature = GetSignature();

	// Commit to the repository
	Commit commit = repository.Commit("Here's a commit I made!", signature, signature);

	Console.WriteLine($"Commit {GetCommitId(commit)} created locally.");

}


void Push()
{
	using Repository repository = new(workingDirectoryPath);
	try
	{
		PushOptions pushOptions = new();
		pushOptions.CredentialsProvider = new CredentialsHandler((url, usernameFromUrl, types) => GetCredentials());
		repository.Network.Push(repository.Branches["main"], pushOptions);
		Console.WriteLine($"Successfully pushed changes to '{repository.Branches["main"].FriendlyName}'.");
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

void Push2()
{
	using (var repo = new Repository(workingDirectoryPath))
	{
		try
		{
			LibGit2Sharp.PushOptions options = new LibGit2Sharp.PushOptions();
			options.CredentialsProvider = new CredentialsHandler(
					(url, usernameFromUrl, types) =>
							new UsernamePasswordCredentials()
							{
								Username = accessToken,
								Password = string.Empty
							});
			repo.Network.Push(repo.Branches["main"], options);
			Console.WriteLine($"Successfully pushed changes to '{repo.Branches["main"].FriendlyName}'.");
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
}

UsernamePasswordCredentials GetCredentials()
	=> new UsernamePasswordCredentials()
	{
		Username = accessToken,
		Password = string.Empty
	};

string GetCommitId(Commit? commit)
	=> commit?.Id.ToString(7) ?? string.Empty;

Signature GetSignature()
	=> new(new Identity("TaleLearnCode", "chad.green@talelearncode.com"), DateTimeOffset.Now);