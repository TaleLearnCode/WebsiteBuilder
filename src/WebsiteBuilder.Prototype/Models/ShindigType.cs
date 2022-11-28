using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a type of shindig.
    /// </summary>
    public partial class ShindigType
    {
        public ShindigType()
        {
            Shindigs = new HashSet<Shindig>();
        }

        /// <summary>
        /// The identifier of the shindig type record.
        /// </summary>
        public int ShindigTypeId { get; set; }
        /// <summary>
        /// The name of the shindig type.
        /// </summary>
        public string ShindigTypeName { get; set; } = null!;

        public virtual ICollection<Shindig> Shindigs { get; set; }
    }
}
