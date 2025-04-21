class Company {
  final String name;
  final String activity;
  final String commercialRecord;
  final String taxNumber;
  final String description;
  final List<JobPosting> jobPostings;

  Company({
    required this.name,
    required this.activity,
    required this.commercialRecord,
    required this.taxNumber,
    required this.description,
    this.jobPostings = const [],
  });
}

class JobPosting {
  final String title;
  final String description;
  final String category;
  final String requirements;
  final String location;

  JobPosting({
    required this.title,
    required this.description,
    required this.category,
    required this.requirements,
    required this.location,
  });
}
