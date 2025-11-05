import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/live_class.dart';
import 'package:couldai_user_app/services/live_class_service.dart';

class LiveClassesScreen extends StatelessWidget {
  const LiveClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveClassService _liveClassService = LiveClassService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Classes'),
      ),
      body: FutureBuilder<List<LiveClass>>(
        future: _liveClassService.getLiveClasses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final liveClasses = snapshot.data ?? [];
          return ListView.builder(
            itemCount: liveClasses.length,
            itemBuilder: (context, index) {
              final liveClass = liveClasses[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(liveClass.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Teacher: ${liveClass.teacher.name}'),
                      Text('Date: ${liveClass.scheduledDate}'),
                      Text('Participants: ${liveClass.participantCount}'),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: liveClass.isLive ? () => _joinLiveClass(context, liveClass) : null,
                    child: Text(liveClass.isLive ? 'Join Now' : 'Upcoming'),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewRecordings(context),
        child: const Icon(Icons.video_library),
        tooltip: 'View Recordings',
      ),
    );
  }

  void _joinLiveClass(BuildContext context, LiveClass liveClass) {
    // TODO: Implement live class joining logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Joining ${liveClass.title}')),
    );
  }

  void _viewRecordings(BuildContext context) {
    // TODO: Navigate to recordings screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Viewing recordings')),
    );
  }
}