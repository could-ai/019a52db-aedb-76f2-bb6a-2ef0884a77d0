import 'package:couldai_user_app/models/teacher.dart';

class Chat {
  final String id;
  final Teacher teacher;
  final String lastMessage;
  final String timestamp;
  final bool isUnread;

  Chat({
    required this.id,
    required this.teacher,
    required this.lastMessage,
    required this.timestamp,
    required this.isUnread,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      teacher: Teacher.fromJson(json['teacher']),
      lastMessage: json['last_message'],
      timestamp: json['timestamp'],
      isUnread: json['is_unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher': teacher.toJson(),
      'last_message': lastMessage,
      'timestamp': timestamp,
      'is_unread': isUnread,
    };
  }
}

class GroupChat {
  final String id;
  final String name;
  final String description;
  final int members;
  final String lastMessage;
  final String timestamp;
  final bool isUnread;

  GroupChat({
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.lastMessage,
    required this.timestamp,
    required this.isUnread,
  });

  factory GroupChat.fromJson(Map<String, dynamic> json) {
    return GroupChat(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      members: json['members'],
      lastMessage: json['last_message'],
      timestamp: json['timestamp'],
      isUnread: json['is_unread'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'members': members,
      'last_message': lastMessage,
      'timestamp': timestamp,
      'is_unread': isUnread,
    };
  }
}
