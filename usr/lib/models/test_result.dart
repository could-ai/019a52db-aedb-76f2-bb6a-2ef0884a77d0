import 'package:couldai_user_app/models/test.dart';

class TestResult {
  final String id;
  final Test test;
  final String userId;
  final int score; // percentage
  final int rank;
  final DateTime completedAt;
  final Map<String, dynamic> detailedResults;

  TestResult({
    required this.id,
    required this.test,
    required this.userId,
    required this.score,
    required this.rank,
    required this.completedAt,
    required this.detailedResults,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      id: json['id'],
      test: Test.fromJson(json['test']),
      userId: json['user_id'],
      score: json['score'],
      rank: json['rank'],
      completedAt: DateTime.parse(json['completed_at']),
      detailedResults: json['detailed_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'test': test.toJson(),
      'user_id': userId,
      'score': score,
      'rank': rank,
      'completed_at': completedAt.toIso8601String(),
      'detailed_results': detailedResults,
    };
  }
}
