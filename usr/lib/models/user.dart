class User {
  final String id;
  final String name;
  final String email;
  final int studyStreak;
  final int completedCourses;
  final int testsTaken;
  final double averageScore;
  final List<String> achievements;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.studyStreak,
    required this.completedCourses,
    required this.testsTaken,
    required this.averageScore,
    required this.achievements,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      studyStreak: json['study_streak'],
      completedCourses: json['completed_courses'],
      testsTaken: json['tests_taken'],
      averageScore: json['average_score'],
      achievements: List<String>.from(json['achievements']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'study_streak': studyStreak,
      'completed_courses': completedCourses,
      'tests_taken': testsTaken,
      'average_score': averageScore,
      'achievements': achievements,
      'created_at': createdAt.toIso8601String(),
    };
  }
}