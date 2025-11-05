import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/test.dart';
import 'package:couldai_user_app/models/test_result.dart';
import 'package:couldai_user_app/services/test_service.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  int _selectedIndex = 0;
  final TestService _testService = TestService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Mock Tests'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Available Tests'),
              Tab(text: 'My Results'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildAvailableTests(),
            _buildMyResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvailableTests() {
    return FutureBuilder<List<Test>>(
      future: _testService.getAvailableTests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final tests = snapshot.data ?? [];
        return ListView.builder(
          itemCount: tests.length,
          itemBuilder: (context, index) {
            final test = tests[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(test.title),
                subtitle: Text('${test.subject} - ${test.duration} minutes'),
                trailing: ElevatedButton(
                  onPressed: () => _startTest(test),
                  child: const Text('Start Test'),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMyResults() {
    return FutureBuilder<List<TestResult>>(
      future: _testService.getMyResults(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final results = snapshot.data ?? [];
        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final result = results[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(result.test.title),
                subtitle: Text('Score: ${result.score}% - Rank: ${result.rank}'),
                trailing: IconButton(
                  icon: const Icon(Icons.analytics),
                  onPressed: () => _viewDetailedResult(result),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _startTest(Test test) {
    // TODO: Navigate to test taking screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Starting ${test.title}')),
    );
  }

  void _viewDetailedResult(TestResult result) {
    // TODO: Navigate to detailed result screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Viewing detailed result')),
    );
  }
}