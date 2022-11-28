using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents the speaker&apos;s presentations.
    /// </summary>
    public partial class Presentation
    {
        public Presentation()
        {
            LearningObjectives = new HashSet<LearningObjective>();
            PresentationRelatedPrimaryPresentations = new HashSet<PresentationRelated>();
            PresentationRelatedRelatedPresentations = new HashSet<PresentationRelated>();
            PresentationTags = new HashSet<PresentationTag>();
            ShindigPresentations = new HashSet<ShindigPresentation>();
        }

        /// <summary>
        /// The identifier of the presentation record.
        /// </summary>
        public int PresentationId { get; set; }
        /// <summary>
        /// The full title of the presentation.
        /// </summary>
        public string PresentationTitle { get; set; } = null!;
        /// <summary>
        /// The short title of the presentation.
        /// </summary>
        public string PresentationShortTitle { get; set; } = null!;
        /// <summary>
        /// The full abstract for the presentation.
        /// </summary>
        public string Abstract { get; set; } = null!;
        /// <summary>
        /// The short abstract for the presentation.
        /// </summary>
        public string ShortAbstract { get; set; } = null!;
        /// <summary>
        /// The summary for the presentation.
        /// </summary>
        public string Summary { get; set; } = null!;
        /// <summary>
        /// Identifier of the type of presentation is represented.
        /// </summary>
        public int PresentationTypeId { get; set; }
        public string? RepoLink { get; set; }
        public string Permalink { get; set; } = null!;
        /// <summary>
        /// Flag indicating whether the presentation has been archived.
        /// </summary>
        public bool IsArchived { get; set; }

        public virtual PresentationType PresentationType { get; set; } = null!;
        public virtual ICollection<LearningObjective> LearningObjectives { get; set; }
        public virtual ICollection<PresentationRelated> PresentationRelatedPrimaryPresentations { get; set; }
        public virtual ICollection<PresentationRelated> PresentationRelatedRelatedPresentations { get; set; }
        public virtual ICollection<PresentationTag> PresentationTags { get; set; }
        public virtual ICollection<ShindigPresentation> ShindigPresentations { get; set; }
    }
}
