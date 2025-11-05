import 'package:couldai_user_app/models/course.dart';

class Enrollment {
  final String id;
  final String userId;
  final Course course;
  final double progress; // 0.0 to 1.0
  final DateTime enrolledAt;
  final DateTime? completedAt;

  Enrollment({
    required this.id,
    required this.userId,
    required this.course,
    required this.progress,
    required this.enrolledAt,
    this.completedAt,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      id: json['id'],
      userId: json['user_id'],
      course: Course.fromJson(json['course']),
      progress: json['progress'],
      enrolledAt: DateTime.parse(json['enrolled_at']),
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'course': course.toJson(),
      'progress': progress,
      'enrolled_at': enrolledAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }
}
