// This file is used by Code Analysis to maintain SuppressMessage
// attributes that are applied to this project.
// Project-level suppressions either have no target or are given
// a specific target and scoped to a namespace, type, member, etc.

using System.Diagnostics.CodeAnalysis;

[assembly: SuppressMessage("Minor Code Smell", "S3251:Implementations should be provided for \"partial\" methods", Justification = "Standard practice for Entity Framework Core context classes.", Scope = "member", Target = "~M:WebsiteBuilder.Prototype.Data.WebsiteBuilderContext.OnModelCreating(Microsoft.EntityFrameworkCore.ModelBuilder)")]
[assembly: SuppressMessage("Minor Code Smell", "S3251:Implementations should be provided for \"partial\" methods", Justification = "Standard practice for Entity Framework Core context classes.", Scope = "member", Target = "~M:WebsiteBuilder.Prototype.Data.WebsiteBuilderContext.OnModelCreatingPartial(Microsoft.EntityFrameworkCore.ModelBuilder)")]
