using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents the association between a presentation and a tag.
    /// </summary>
    public partial class PresentationTag
    {
        /// <summary>
        /// The identifier of the presentation/tag record.
        /// </summary>
        public int PresentationTagId { get; set; }
        /// <summary>
        /// Identifier of the associated tag.
        /// </summary>
        public int TagId { get; set; }
        /// <summary>
        /// Identifier of the associated presentation.
        /// </summary>
        public int PresentationId { get; set; }

        public virtual Presentation Presentation { get; set; } = null!;
        public virtual Chlib Tag { get; set; } = null!;
    }
}
