using System;
using System.Collections.Generic;

namespace WebsiteBuilder.Prototype.Models
{
    /// <summary>
    /// Represents a status of a shindig.
    /// </summary>
    public partial class ShindigStatus
    {
        public ShindigStatus()
        {
            Shindigs = new HashSet<Shindig>();
        }

        /// <summary>
        /// The identifier of the shindig status record.
        /// </summary>
        public int ShindigStatusId { get; set; }
        /// <summary>
        /// The name of the shindig status.
        /// </summary>
        public string ShindigStatusName { get; set; } = null!;

        public virtual ICollection<Shindig> Shindigs { get; set; }
    }
}
