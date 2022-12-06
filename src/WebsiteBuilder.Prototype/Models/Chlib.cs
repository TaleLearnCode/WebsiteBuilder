namespace WebsiteBuilder.Prototype.Models
{
	/// <summary>
	/// Represents a label attached to a presentation.
	/// </summary>
	public partial class Chlib
	{
		public Chlib()
		{
			PresentationTags = new HashSet<PresentationTag>();
		}

		/// <summary>
		/// The identifier of the tag record.
		/// </summary>
		public int TagId { get; set; }
		/// <summary>
		/// The name of the tag.
		/// </summary>
		public string TagName { get; set; } = null!;

		public virtual ICollection<PresentationTag> PresentationTags { get; set; }
	}
}
