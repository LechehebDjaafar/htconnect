class JobSeeker {
  final String name;
  final String phone;
  final String city;
  final String category;
  final String education;
  final String specialization;
  final List<String> documents;

  JobSeeker({
    required this.name,
    required this.phone,
    required this.city,
    required this.category,
    required this.education,
    required this.specialization,
    this.documents = const [],
  });
}
