import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/course.dart';
import 'package:couldai_user_app/models/enrollment.dart';
import 'package:couldai_user_app/services/course_service.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int _selectedIndex = 0;
  final CourseService _courseService = CourseService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Courses'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Catalog'),
              Tab(text: 'My Courses'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCourseCatalog(),
            _buildMyCourses(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCatalog() {
    return FutureBuilder<List<Course>>(
      future: _courseService.getAllCourses(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final courses = snapshot.data ?? [];
        return ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(course.title),
                subtitle: Text(course.subject),
                trailing: ElevatedButton(
                  onPressed: () => _enrollInCourse(course),
                  child: const Text('Enroll'),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMyCourses() {
    return FutureBuilder<List<Enrollment>>(
      future: _courseService.getMyEnrollments(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final enrollments = snapshot.data ?? [];
        return ListView.builder(
          itemCount: enrollments.length,
          itemBuilder: (context, index) {
            final enrollment = enrollments[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(enrollment.course.title),
                subtitle: LinearProgressIndicator(value: enrollment.progress),
                trailing: Text('${(enrollment.progress * 100).toInt()}%'),
              ),
            );
          },
        );
      },
    );
  }

  void _enrollInCourse(Course course) {
    // TODO: Implement enrollment logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Enrolled in ${course.title}')),
    );
  }
}