import 'package:couldai_user_app/models/chat.dart';
import 'package:couldai_user_app/models/teacher.dart';

class ChatService {
  // TODO: Replace with actual Supabase integration
  Future<List<Chat>> getTeacherChats() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return [
      Chat(
        id: 'c1',
        teacher: Teacher(
          id: 't1',
          name: 'Dr. Sarah Johnson',
          email: 'sarah.johnson@hleduroom.com',
          subject: 'Physics',
          bio: 'Experienced physics professor',
          rating: 4.8,
        ),
        lastMessage: 'Please review the homework assignment',
        timestamp: '2 hours ago',
        isUnread: true,
      ),
      Chat(
        id: 'c2',
        teacher: Teacher(
          id: 't2',
          name: 'Prof. Michael Chen',
          email: 'michael.chen@hleduroom.com',
          subject: 'Chemistry',
          bio: 'Organic chemistry specialist',
          rating: 4.9,
        ),
        lastMessage: 'Great work on the lab report!',
        timestamp: '1 day ago',
        isUnread: false,
      ),
    ];
  }

  Future<List<GroupChat>> getGroupChats() async {
    // Mock data for now
    await Future.delayed(const Duration(seconds: 1));
    return [
      GroupChat(
        id: 'gc1',
        name: 'Physics Study Group',
        description: 'Discuss physics concepts and solve problems together',
        members: 23,
        lastMessage: 'Anyone solved question 15?',
        timestamp: '30 min ago',
        isUnread: true,
      ),
      GroupChat(
        id: 'gc2',
        name: 'Chemistry Lab Partners',
        description: 'Find study partners for chemistry experiments',
        members: 18,
        lastMessage: 'Lab session tomorrow at 10 AM',
        timestamp: '2 hours ago',
        isUnread: false,
      ),
    ];
  }
}