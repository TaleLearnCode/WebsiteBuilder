using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a download associated with a shindig presentation.
    /// </summary>
    public partial class ShindigPresentationDownload
    {
        /// <summary>
        /// Identifier of the ShindigPresentationDownload record.
        /// </summary>
        public int ShindigPresentationDownloadId { get; set; }
        /// <summary>
        /// Identifier of the associated shindig presentation.
        /// </summary>
        public int ShindigPresentationId { get; set; }
        public string DownloadName { get; set; } = null!;
        /// <summary>
        /// The link to the download.
        /// </summary>
        public string? DownloadLink { get; set; }

        public virtual ShindigPresentation ShindigPresentation { get; set; } = null!;
    }
}
