namespace WebsiteBuilder.Prototype.Models
{
	/// <summary>
	/// Record of a file upload to GitHub.
	/// </summary>
	public partial class CommitLog
	{
		/// <summary>
		/// The identifier of the commit.
		/// </summary>
		public string CommitId { get; set; } = null!;
		/// <summary>
		/// Identifier of the type of commit that was performed.
		/// </summary>
		public int CommitTypeId { get; set; }
		/// <summary>
		/// Identifier of the template used to build the commited file.
		/// </summary>
		public int TemplateId { get; set; }
		/// <summary>
		/// The permalink of the commited file.
		/// </summary>
		public string Permalink { get; set; } = null!;
		/// <summary>
		/// The UTC date and time of the commit.
		/// </summary>
		public DateTime CommitDateTime { get; set; }

		public virtual CommitType CommitType { get; set; } = null!;
		public virtual Template Template { get; set; } = null!;
	}
}
