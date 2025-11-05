import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user.dart';
import 'package:couldai_user_app/services/user_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserService _userService = UserService();
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = _userService.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editProfile(context),
          ),
        ],
      ),
      body: FutureBuilder<User>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final user = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Text(
                      user.name[0],
                      style: const TextStyle(fontSize: 48),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    user.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),
                _buildStatCard('Study Streak', '${user.studyStreak} days'),
                _buildStatCard('Courses Completed', '${user.completedCourses}'),
                _buildStatCard('Tests Taken', '${user.testsTaken}'),
                _buildStatCard('Average Score', '${user.averageScore}%'),
                const SizedBox(height: 32),
                const Text(
                  'Achievements',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: user.achievements.map((achievement) =>
                    Chip(label: Text(achievement))
                  ).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    // TODO: Navigate to edit profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile')),
    );
  }
}