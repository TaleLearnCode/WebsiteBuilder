namespace WebsiteBuilder.Prototype.Data
{
	public partial class WebsiteBuilderContext : DbContext
	{
		public WebsiteBuilderContext()
		{
		}

		public WebsiteBuilderContext(DbContextOptions<WebsiteBuilderContext> options)
				: base(options)
		{
		}

		public virtual DbSet<LearningObjective> LearningObjectives { get; set; } = null!;
		public virtual DbSet<Presentation> Presentations { get; set; } = null!;
		public virtual DbSet<PresentationRelated> PresentationRelateds { get; set; } = null!;
		public virtual DbSet<PresentationTag> PresentationTags { get; set; } = null!;
		public virtual DbSet<PresentationType> PresentationTypes { get; set; } = null!;
		public virtual DbSet<Shindig> Shindigs { get; set; } = null!;
		public virtual DbSet<ShindigPresentation> ShindigPresentations { get; set; } = null!;
		public virtual DbSet<ShindigPresentationDownload> ShindigPresentationDownloads { get; set; } = null!;
		public virtual DbSet<ShindigStatus> ShindigStatuses { get; set; } = null!;
		public virtual DbSet<ShindigType> ShindigTypes { get; set; } = null!;
		public virtual DbSet<Chlib> Chlibs { get; set; } = null!;
		public virtual DbSet<Template> Templates { get; set; } = null!;
		public virtual DbSet<TemplateType> TemplateTypes { get; set; } = null!;

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			if (!optionsBuilder.IsConfigured)
			{
				optionsBuilder.UseSqlServer("Data Source=Beast;Initial Catalog=WebsiteBuilder;Integrated Security=True");
			}
		}

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			modelBuilder.Entity<LearningObjective>(entity =>
			{
				entity.ToTable("LearningObjective");

				entity.HasComment("Represents a learning objective of a presentation.");

				entity.Property(e => e.LearningObjectiveId).HasComment("The identifier of the learning objective record.");

				entity.Property(e => e.LearningObjectiveText)
									.HasMaxLength(300)
									.HasComment("The text of the learning objective.");

				entity.Property(e => e.PresentationId).HasComment("The identifier of the associated presentation record.");

				entity.Property(e => e.SortOrder).HasComment("The sorting order of the learning objective.");

				entity.HasOne(d => d.Presentation)
									.WithMany(p => p.LearningObjectives)
									.HasForeignKey(d => d.PresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkLearningObjective_Presentation");
			});

			modelBuilder.Entity<Presentation>(entity =>
			{
				entity.ToTable("Presentation");

				entity.HasComment("Represents the speaker's presentations.");

				entity.HasIndex(e => e.Permalink, "unqPresentation_Permalink")
									.IsUnique();

				entity.Property(e => e.PresentationId).HasComment("The identifier of the presentation record.");

				entity.Property(e => e.Abstract)
									.HasMaxLength(2000)
									.HasComment("The full abstract for the presentation.");

				entity.Property(e => e.IsArchived).HasComment("Flag indicating whether the presentation has been archived.");

				entity.Property(e => e.Permalink).HasMaxLength(200);

				entity.Property(e => e.PresentationShortTitle)
									.HasMaxLength(60)
									.HasComment("The short title of the presentation.");

				entity.Property(e => e.PresentationTitle)
									.HasMaxLength(300)
									.HasComment("The full title of the presentation.");

				entity.Property(e => e.PresentationTypeId).HasComment("Identifier of the type of presentation is represented.");

				entity.Property(e => e.RepoLink).HasMaxLength(200);

				entity.Property(e => e.ShortAbstract)
									.HasMaxLength(500)
									.HasComment("The short abstract for the presentation.");

				entity.Property(e => e.Summary)
									.HasMaxLength(140)
									.HasComment("The summary for the presentation.");

				entity.HasOne(d => d.PresentationType)
									.WithMany(p => p.Presentations)
									.HasForeignKey(d => d.PresentationTypeId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkPresentation_PresentationType");
			});

			modelBuilder.Entity<PresentationRelated>(entity =>
			{
				entity.ToTable("PresentationRelated");

				entity.HasOne(d => d.PrimaryPresentation)
									.WithMany(p => p.PresentationRelatedPrimaryPresentations)
									.HasForeignKey(d => d.PrimaryPresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkRelatedPresentation_Presentation_Primary");

				entity.HasOne(d => d.RelatedPresentation)
									.WithMany(p => p.PresentationRelatedRelatedPresentations)
									.HasForeignKey(d => d.RelatedPresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkRelatedPresentation_Presentation_Related");
			});

			modelBuilder.Entity<PresentationTag>(entity =>
			{
				entity.ToTable("PresentationTag");

				entity.HasComment("Represents the association between a presentation and a tag.");

				entity.Property(e => e.PresentationTagId).HasComment("The identifier of the presentation/tag record.");

				entity.Property(e => e.PresentationId).HasComment("Identifier of the associated presentation.");

				entity.Property(e => e.TagId).HasComment("Identifier of the associated tag.");

				entity.HasOne(d => d.Presentation)
									.WithMany(p => p.PresentationTags)
									.HasForeignKey(d => d.PresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkPresentationTag_Presentation");

				entity.HasOne(d => d.Tag)
									.WithMany(p => p.PresentationTags)
									.HasForeignKey(d => d.TagId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkPresentationTag_Tag");
			});

			modelBuilder.Entity<PresentationType>(entity =>
			{
				entity.ToTable("PresentationType");

				entity.HasComment("Represents a type of a presentation.");

				entity.Property(e => e.PresentationTypeId).HasComment("The identifier of the presentation type record.");

				entity.Property(e => e.PresentationTypeName)
									.HasMaxLength(100)
									.HasComment("The name of the presentation type.");
			});

			modelBuilder.Entity<Shindig>(entity =>
			{
				entity.ToTable("Shindig");

				entity.HasComment("Represents an event that the speaker participates in.");

				entity.HasIndex(e => e.Permalink, "unqShindig_Permalink")
									.IsUnique();

				entity.Property(e => e.ShindigId).HasComment("The identifier of the shindig record.");

				entity.Property(e => e.EndDate)
									.HasColumnType("date")
									.HasComment("The end date of the event.");

				entity.Property(e => e.EndingCost)
									.HasMaxLength(20)
									.HasComment("The ending cost for the event.");

				entity.Property(e => e.ListingLocation)
									.HasMaxLength(100)
									.HasComment("The location of the event to show on the event listing.");

				entity.Property(e => e.OverviewLocation)
									.HasMaxLength(300)
									.HasComment("The location of the event to show on the overview.");

				entity.Property(e => e.Permalink).HasMaxLength(200);

				entity.Property(e => e.ShindigDescription)
									.HasMaxLength(2000)
									.HasComment("The full description of the event.");

				entity.Property(e => e.ShindigLink).HasMaxLength(200);

				entity.Property(e => e.ShindigName)
									.HasMaxLength(200)
									.HasComment("The name of the shindig.");

				entity.Property(e => e.ShindigStatusId).HasComment("Identifier of the associated shindig status.");

				entity.Property(e => e.ShindigSummary)
									.HasMaxLength(140)
									.HasComment("The summary description of the event.");

				entity.Property(e => e.ShindigTypeId).HasComment("Identifier of the associated shindig type.");

				entity.Property(e => e.StartDate)
									.HasColumnType("date")
									.HasComment("The start date of the event.");

				entity.Property(e => e.StartingCost)
									.HasMaxLength(20)
									.HasComment("The starting cost for the event.");

				entity.HasOne(d => d.ShindigStatus)
									.WithMany(p => p.Shindigs)
									.HasForeignKey(d => d.ShindigStatusId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkShindig_ShindigStatus");

				entity.HasOne(d => d.ShindigType)
									.WithMany(p => p.Shindigs)
									.HasForeignKey(d => d.ShindigTypeId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkShindig_ShindigType");
			});

			modelBuilder.Entity<ShindigPresentation>(entity =>
			{
				entity.ToTable("ShindigPresentation");

				entity.HasComment("Represents the speaker's presentations.");

				entity.Property(e => e.ShindigPresentationId).HasComment("Identifier of the ShindigPresentation record.");

				entity.Property(e => e.EndDateTime).HasComment("The ending date and time for the presentation.");

				entity.Property(e => e.PresentationId).HasComment("Identifier of the associated presentation.");

				entity.Property(e => e.Room)
									.HasMaxLength(50)
									.HasComment("The room where the presentation is being presented.");

				entity.Property(e => e.ShindigId).HasComment("Identifier of the associated shindig.");

				entity.Property(e => e.StartDateTime).HasComment("The starting date and time for the presentation.");

				entity.Property(e => e.TimeZone)
									.HasMaxLength(10)
									.IsUnicode(false);

				entity.HasOne(d => d.Presentation)
									.WithMany(p => p.ShindigPresentations)
									.HasForeignKey(d => d.PresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkShindigPresentation_Presentatiton");

				entity.HasOne(d => d.Shindig)
									.WithMany(p => p.ShindigPresentations)
									.HasForeignKey(d => d.ShindigId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkShindigPresentation_Shindig");
			});

			modelBuilder.Entity<ShindigPresentationDownload>(entity =>
			{
				entity.ToTable("ShindigPresentationDownload");

				entity.HasComment("Represents a download associated with a shindig presentation.");

				entity.Property(e => e.ShindigPresentationDownloadId).HasComment("Identifier of the ShindigPresentationDownload record.");

				entity.Property(e => e.DownloadLink)
									.HasMaxLength(500)
									.HasComment("The link to the download.");

				entity.Property(e => e.DownloadName).HasMaxLength(50);

				entity.Property(e => e.ShindigPresentationId).HasComment("Identifier of the associated shindig presentation.");

				entity.HasOne(d => d.ShindigPresentation)
									.WithMany(p => p.ShindigPresentationDownloads)
									.HasForeignKey(d => d.ShindigPresentationId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkShindigPresentationDownload_ShindigPresentation");
			});

			modelBuilder.Entity<ShindigStatus>(entity =>
			{
				entity.ToTable("ShindigStatus");

				entity.HasComment("Represents a status of a shindig.");

				entity.Property(e => e.ShindigStatusId).HasComment("The identifier of the shindig status record.");

				entity.Property(e => e.ShindigStatusName)
									.HasMaxLength(100)
									.HasComment("The name of the shindig status.");
			});

			modelBuilder.Entity<ShindigType>(entity =>
			{
				entity.ToTable("ShindigType");

				entity.HasComment("Represents a type of shindig.");

				entity.Property(e => e.ShindigTypeId).HasComment("The identifier of the shindig type record.");

				entity.Property(e => e.ShindigTypeName)
									.HasMaxLength(100)
									.HasComment("The name of the shindig type.");
			});

			modelBuilder.Entity<Chlib>(entity =>
			{
				entity.ToTable("Tag");

				entity.HasKey(x => x.TagId);

				entity.HasComment("Represents a label attached to a presentation.");

				entity.Property(e => e.TagId).HasComment("The identifier of the tag record.");

				entity.Property(e => e.TagName)
									.HasMaxLength(100)
									.HasComment("The name of the tag.");
			});

			modelBuilder.Entity<Template>(entity =>
			{
				entity.ToTable("Template");

				entity.HasComment("Represents a template used to generate a static web page.");

				entity.Property(e => e.TemplateId).HasComment("The identifier of the template record.");

				entity.Property(e => e.IsActive).HasComment("Flag indicating whether the template is active.");

				entity.Property(e => e.TemplateFileName)
									.HasMaxLength(100)
									.HasComment("The file name of the template.");

				entity.Property(e => e.TemplateName)
									.HasMaxLength(100)
									.HasComment("The of the template.");

				entity.Property(e => e.TemplateTypeId).HasComment("Identifier of the type of template being represented.");

				entity.HasOne(d => d.TemplateType)
									.WithMany(p => p.Templates)
									.HasForeignKey(d => d.TemplateTypeId)
									.OnDelete(DeleteBehavior.ClientSetNull)
									.HasConstraintName("fkTemplate_TemplateType");
			});

			modelBuilder.Entity<TemplateType>(entity =>
			{
				entity.ToTable("TemplateType");

				entity.HasComment("Represents a type of a stage page template.");

				entity.Property(e => e.TemplateTypeId)
									.ValueGeneratedNever()
									.HasComment("The identifier of the template type record.");

				entity.Property(e => e.Permalink)
									.HasMaxLength(200)
									.HasComment("The permanent link for the file generated using the template. Not used for output files associated with speaking engagements or presentations.");

				entity.Property(e => e.TemplateTypeName)
									.HasMaxLength(100)
									.IsUnicode(false)
									.HasComment("The of the template type.");
			});

			OnModelCreatingPartial(modelBuilder);
		}

		partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
	}
}
