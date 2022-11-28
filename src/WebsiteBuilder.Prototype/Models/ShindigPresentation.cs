using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents the speaker&apos;s presentations.
    /// </summary>
    public partial class ShindigPresentation
    {
        public ShindigPresentation()
        {
            ShindigPresentationDownloads = new HashSet<ShindigPresentationDownload>();
        }

        /// <summary>
        /// Identifier of the ShindigPresentation record.
        /// </summary>
        public int ShindigPresentationId { get; set; }
        /// <summary>
        /// Identifier of the associated shindig.
        /// </summary>
        public int ShindigId { get; set; }
        /// <summary>
        /// Identifier of the associated presentation.
        /// </summary>
        public int PresentationId { get; set; }
        /// <summary>
        /// The starting date and time for the presentation.
        /// </summary>
        public DateTime? StartDateTime { get; set; }
        /// <summary>
        /// The ending date and time for the presentation.
        /// </summary>
        public DateTime? EndDateTime { get; set; }
        public string? TimeZone { get; set; }
        /// <summary>
        /// The room where the presentation is being presented.
        /// </summary>
        public string? Room { get; set; }

        public virtual Presentation Presentation { get; set; } = null!;
        public virtual Shindig Shindig { get; set; } = null!;
        public virtual ICollection<ShindigPresentationDownload> ShindigPresentationDownloads { get; set; }
    }
}
