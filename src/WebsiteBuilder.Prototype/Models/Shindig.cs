using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents an event that the speaker participates in.
    /// </summary>
    public partial class Shindig
    {
        public Shindig()
        {
            ShindigPresentations = new HashSet<ShindigPresentation>();
        }

        /// <summary>
        /// The identifier of the shindig record.
        /// </summary>
        public int ShindigId { get; set; }
        /// <summary>
        /// Identifier of the associated shindig type.
        /// </summary>
        public int ShindigTypeId { get; set; }
        /// <summary>
        /// Identifier of the associated shindig status.
        /// </summary>
        public int ShindigStatusId { get; set; }
        /// <summary>
        /// The name of the shindig.
        /// </summary>
        public string ShindigName { get; set; } = null!;
        /// <summary>
        /// The location of the event to show on the overview.
        /// </summary>
        public string OverviewLocation { get; set; } = null!;
        /// <summary>
        /// The location of the event to show on the event listing.
        /// </summary>
        public string ListingLocation { get; set; } = null!;
        /// <summary>
        /// The start date of the event.
        /// </summary>
        public DateTime StartDate { get; set; }
        /// <summary>
        /// The end date of the event.
        /// </summary>
        public DateTime EndDate { get; set; }
        /// <summary>
        /// The starting cost for the event.
        /// </summary>
        public string StartingCost { get; set; } = null!;
        /// <summary>
        /// The ending cost for the event.
        /// </summary>
        public string EndingCost { get; set; } = null!;
        /// <summary>
        /// The full description of the event.
        /// </summary>
        public string ShindigDescription { get; set; } = null!;
        /// <summary>
        /// The summary description of the event.
        /// </summary>
        public string ShindigSummary { get; set; } = null!;
        public string? ShindigLink { get; set; }
        public string Permalink { get; set; } = null!;

        public virtual ShindigStatus ShindigStatus { get; set; } = null!;
        public virtual ShindigType ShindigType { get; set; } = null!;
        public virtual ICollection<ShindigPresentation> ShindigPresentations { get; set; }
    }
}
