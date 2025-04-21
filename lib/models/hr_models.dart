class Course {
  final String title;
  final String description;
  final String duration;
  final String instructor;

  Course({
    required this.title,
    required this.description,
    required this.duration,
    required this.instructor,
  });
}

class Interview {
  final String candidateName;
  final DateTime date;
  final String position;
  final String status;

  Interview({
    required this.candidateName,
    required this.date,
    required this.position,
    required this.status,
  });
}

class Candidate {
  final String name;
  final String position;
  final String resumeUrl;
  final String interviewNotes;

  Candidate({
    required this.name,
    required this.position,
    required this.resumeUrl,
    required this.interviewNotes,
  });
}
