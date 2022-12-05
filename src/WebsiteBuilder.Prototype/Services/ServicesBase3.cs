namespace WebsiteBuilder.Prototype.Services;

internal abstract class ServicesBase3
{

	private readonly List<Shindig> _upcomingSpeakingEngagements;
	private readonly string _githubAccessToken;


	protected ServicesBase3(
		List<Shindig> upcomingSpeakingEngagements,
		string githubAccessToken)
	{
		_upcomingSpeakingEngagements = upcomingSpeakingEngagements;
		_githubAccessToken = githubAccessToken;
	}

}