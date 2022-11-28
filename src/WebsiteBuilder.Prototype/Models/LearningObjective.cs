using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a learning objective of a presentation.
    /// </summary>
    public partial class LearningObjective
    {
        /// <summary>
        /// The identifier of the learning objective record.
        /// </summary>
        public int LearningObjectiveId { get; set; }
        /// <summary>
        /// The identifier of the associated presentation record.
        /// </summary>
        public int PresentationId { get; set; }
        /// <summary>
        /// The text of the learning objective.
        /// </summary>
        public string LearningObjectiveText { get; set; } = null!;
        /// <summary>
        /// The sorting order of the learning objective.
        /// </summary>
        public int SortOrder { get; set; }

        public virtual Presentation Presentation { get; set; } = null!;
    }
}
