import 'package:couldai_user_app/models/user.dart';

class UserService {
  // TODO: Replace with actual Supabase integration
  Future<User> getCurrentUser() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return User(
      id: 'u1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      studyStreak: 15,
      completedCourses: 3,
      testsTaken: 8,
      averageScore: 82.5,
      achievements: ['First Course Completed', 'Perfect Score', 'Study Streak'],
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    );
  }
}