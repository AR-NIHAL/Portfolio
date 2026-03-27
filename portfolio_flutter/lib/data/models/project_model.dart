class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.category,
    required this.demoLink,
    required this.detailsLink,
    this.isFeatured = false,
  });

  final String title;
  final String subtitle;
  final String imagePath;
  final String category;
  final String demoLink;
  final String detailsLink;
  final bool isFeatured;
}
