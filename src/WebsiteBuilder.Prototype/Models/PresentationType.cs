using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a type of a presentation.
    /// </summary>
    public partial class PresentationType
    {
        public PresentationType()
        {
            Presentations = new HashSet<Presentation>();
        }

        /// <summary>
        /// The identifier of the presentation type record.
        /// </summary>
        public int PresentationTypeId { get; set; }
        /// <summary>
        /// The name of the presentation type.
        /// </summary>
        public string PresentationTypeName { get; set; } = null!;

        public virtual ICollection<Presentation> Presentations { get; set; }
    }
}
