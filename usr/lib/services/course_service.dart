import 'package:couldai_user_app/models/course.dart';
import 'package:couldai_user_app/models/enrollment.dart';

class CourseService {
  // TODO: Replace with actual Supabase integration
  Future<List<Course>> getAllCourses() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return [
      Course(
        id: '1',
        title: 'Physics Fundamentals',
        subject: 'Physics',
        description: 'Comprehensive physics course covering basic principles',
        duration: 20,
        teacherId: 't1',
        createdAt: DateTime.now(),
      ),
      Course(
        id: '2',
        title: 'Chemistry Basics',
        subject: 'Chemistry',
        description: 'Essential chemistry concepts for medical entrance',
        duration: 15,
        teacherId: 't2',
        createdAt: DateTime.now(),
      ),
      Course(
        id: '3',
        title: 'Biology Essentials',
        subject: 'Biology',
        description: 'Core biology topics for medical students',
        duration: 25,
        teacherId: 't3',
        createdAt: DateTime.now(),
      ),
      Course(
        id: '4',
        title: 'Mathematics for Medicine',
        subject: 'Mathematics',
        description: 'Mathematical concepts relevant to medical studies',
        duration: 18,
        teacherId: 't4',
        createdAt: DateTime.now(),
      ),
    ];
  }

  Future<List<Enrollment>> getMyEnrollments() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    final courses = await getAllCourses();
    return [
      Enrollment(
        id: 'e1',
        userId: 'u1',
        course: courses[0],
        progress: 0.7,
        enrolledAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      Enrollment(
        id: 'e2',
        userId: 'u1',
        course: courses[1],
        progress: 0.4,
        enrolledAt: DateTime.now().subtract(const Duration(days: 20)),
      ),
    ];
  }
}