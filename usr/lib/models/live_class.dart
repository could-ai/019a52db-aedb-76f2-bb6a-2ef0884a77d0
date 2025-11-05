import 'package:couldai_user_app/models/teacher.dart';

class LiveClass {
  final String id;
  final String title;
  final String description;
  final Teacher teacher;
  final DateTime scheduledDate;
  final int duration; // in minutes
  final bool isLive;
  final int participantCount;
  final String? recordingUrl;

  LiveClass({
    required this.id,
    required this.title,
    required this.description,
    required this.teacher,
    required this.scheduledDate,
    required this.duration,
    required this.isLive,
    required this.participantCount,
    this.recordingUrl,
  });

  factory LiveClass.fromJson(Map<String, dynamic> json) {
    return LiveClass(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      teacher: Teacher.fromJson(json['teacher']),
      scheduledDate: DateTime.parse(json['scheduled_date']),
      duration: json['duration'],
      isLive: json['is_live'],
      participantCount: json['participant_count'],
      recordingUrl: json['recording_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'teacher': teacher.toJson(),
      'scheduled_date': scheduledDate.toIso8601String(),
      'duration': duration,
      'is_live': isLive,
      'participant_count': participantCount,
      'recording_url': recordingUrl,
    };
  }
}
