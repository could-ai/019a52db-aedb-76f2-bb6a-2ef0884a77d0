import 'package:couldai_user_app/models/live_class.dart';
import 'package:couldai_user_app/models/teacher.dart';

class LiveClassService {
  // TODO: Replace with actual Supabase integration
  Future<List<LiveClass>> getLiveClasses() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return [
      LiveClass(
        id: 'lc1',
        title: 'Advanced Physics Concepts',
        description: 'Deep dive into complex physics topics',
        teacher: Teacher(
          id: 't1',
          name: 'Dr. Sarah Johnson',
          email: 'sarah.johnson@hleduroom.com',
          subject: 'Physics',
          bio: 'Experienced physics professor with 15 years of teaching',
          rating: 4.8,
        ),
        scheduledDate: DateTime.now().add(const Duration(hours: 2)),
        duration: 90,
        isLive: true,
        participantCount: 45,
        recordingUrl: null,
      ),
      LiveClass(
        id: 'lc2',
        title: 'Organic Chemistry Reactions',
        description: 'Understanding key organic chemistry mechanisms',
        teacher: Teacher(
          id: 't2',
          name: 'Prof. Michael Chen',
          email: 'michael.chen@hleduroom.com',
          subject: 'Chemistry',
          bio: 'Organic chemistry specialist with research background',
          rating: 4.9,
        ),
        scheduledDate: DateTime.now().add(const Duration(days: 1)),
        duration: 75,
        isLive: false,
        participantCount: 0,
        recordingUrl: 'https://example.com/recording1',
      ),
    ];
  }
}