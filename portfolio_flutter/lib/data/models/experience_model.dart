class ExperienceModel {
  final String companyName;
  final String role;
  final String duration;
  final String? location;
  final String? description;
  final List<String>? highlights;
  final List<String> technologies;

  const ExperienceModel({
    required this.companyName,
    required this.role,
    required this.duration,
    this.location,
    this.description,
    this.highlights,
    required this.technologies,
  });
}
