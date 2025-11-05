import 'package:couldai_user_app/models/test.dart';
import 'package:couldai_user_app/models/test_result.dart';

class TestService {
  // TODO: Replace with actual Supabase integration
  Future<List<Test>> getAvailableTests() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return [
      Test(
        id: 't1',
        title: 'Physics Mock Test 1',
        subject: 'Physics',
        duration: 120,
        totalQuestions: 50,
        teacherId: 't1',
        createdAt: DateTime.now(),
      ),
      Test(
        id: 't2',
        title: 'Chemistry Mock Test 1',
        subject: 'Chemistry',
        duration: 90,
        totalQuestions: 40,
        teacherId: 't2',
        createdAt: DateTime.now(),
      ),
      Test(
        id: 't3',
        title: 'Biology Mock Test 1',
        subject: 'Biology',
        duration: 100,
        totalQuestions: 45,
        teacherId: 't3',
        createdAt: DateTime.now(),
      ),
    ];
  }

  Future<List<TestResult>> getMyResults() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    final tests = await getAvailableTests();
    return [
      TestResult(
        id: 'r1',
        test: tests[0],
        userId: 'u1',
        score: 85,
        rank: 12,
        completedAt: DateTime.now().subtract(const Duration(days: 5)),
        detailedResults: {},
      ),
      TestResult(
        id: 'r2',
        test: tests[1],
        userId: 'u1',
        score: 78,
        rank: 25,
        completedAt: DateTime.now().subtract(const Duration(days: 3)),
        detailedResults: {},
      ),
    ];
  }
}