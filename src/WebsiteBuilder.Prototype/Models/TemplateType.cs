using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a type of a stage page template.
    /// </summary>
    public partial class TemplateType
    {
        public TemplateType()
        {
            Templates = new HashSet<Template>();
        }

        /// <summary>
        /// The identifier of the template type record.
        /// </summary>
        public int TemplateTypeId { get; set; }
        /// <summary>
        /// The of the template type.
        /// </summary>
        public string TemplateTypeName { get; set; } = null!;
        /// <summary>
        /// The permanent link for the file generated using the template. Not used for output files associated with speaking engagements or presentations.
        /// </summary>
        public string? Permalink { get; set; }

        public virtual ICollection<Template> Templates { get; set; }
    }
}
