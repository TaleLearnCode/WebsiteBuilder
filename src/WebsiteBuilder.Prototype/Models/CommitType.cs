namespace WebsiteBuilder.Prototype.Models
{
	/// <summary>
	/// Represents a type of a file commit.
	/// </summary>
	public partial class CommitType
	{
		public CommitType()
		{
			CommitLogs = new HashSet<CommitLog>();
		}

		/// <summary>
		/// The identifier of the commit type record.
		/// </summary>
		public int CommitTypeId { get; set; }
		/// <summary>
		/// The of the commit type.
		/// </summary>
		public string CommitTypeName { get; set; } = null!;

		public virtual ICollection<CommitLog> CommitLogs { get; set; }
	}
}
