class Test {
  final String id;
  final String title;
  final String subject;
  final int duration; // in minutes
  final int totalQuestions;
  final String teacherId;
  final DateTime createdAt;

  Test({
    required this.id,
    required this.title,
    required this.subject,
    required this.duration,
    required this.totalQuestions,
    required this.teacherId,
    required this.createdAt,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      id: json['id'],
      title: json['title'],
      subject: json['subject'],
      duration: json['duration'],
      totalQuestions: json['total_questions'],
      teacherId: json['teacher_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'duration': duration,
      'total_questions': totalQuestions,
      'teacher_id': teacherId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}