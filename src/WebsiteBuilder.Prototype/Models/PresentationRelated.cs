using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    public partial class PresentationRelated
    {
        public int PresentationRelatedId { get; set; }
        public int PrimaryPresentationId { get; set; }
        public int RelatedPresentationId { get; set; }
        public int? SortOrder { get; set; }

        public virtual Presentation PrimaryPresentation { get; set; } = null!;
        public virtual Presentation RelatedPresentation { get; set; } = null!;
    }
}
