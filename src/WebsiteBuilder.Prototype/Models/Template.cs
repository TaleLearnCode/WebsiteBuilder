using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a template used to generate a static web page.
    /// </summary>
    public partial class Template
    {
        public Template()
        {
            CommitLogs = new HashSet<CommitLog>();
        }

        /// <summary>
        /// The identifier of the template record.
        /// </summary>
        public int TemplateId { get; set; }
        /// <summary>
        /// Identifier of the type of template being represented.
        /// </summary>
        public int TemplateTypeId { get; set; }
        /// <summary>
        /// The of the template.
        /// </summary>
        public string TemplateName { get; set; } = null!;
        /// <summary>
        /// The file name of the template.
        /// </summary>
        public string TemplateFileName { get; set; } = null!;
        /// <summary>
        /// Flag indicating whether the template is active.
        /// </summary>
        public bool IsActive { get; set; }

        public virtual TemplateType TemplateType { get; set; } = null!;
        public virtual ICollection<CommitLog> CommitLogs { get; set; }
    }
}
