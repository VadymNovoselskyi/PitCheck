enum ArchiveFilter {
  active,
  archived,
  all;

  bool includes(bool isArchived) => switch (this) {
    ArchiveFilter.active => !isArchived,
    ArchiveFilter.archived => isArchived,
    ArchiveFilter.all => true,
  };
}
