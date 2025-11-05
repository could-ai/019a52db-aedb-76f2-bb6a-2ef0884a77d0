class Course {
  final String id;
  final String title;
  final String subject;
  final String description;
  final int duration; // in hours
  final String teacherId;
  final DateTime createdAt;

  Course({
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.duration,
    required this.teacherId,
    required this.createdAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      subject: json['subject'],
      description: json['description'],
      duration: json['duration'],
      teacherId: json['teacher_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'description': description,
      'duration': duration,
      'teacher_id': teacherId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}