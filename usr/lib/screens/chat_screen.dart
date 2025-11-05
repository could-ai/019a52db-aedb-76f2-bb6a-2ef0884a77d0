import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/chat.dart';
import 'package:couldai_user_app/services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Teachers'),
              Tab(text: 'Groups'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTeacherChats(),
            _buildGroupChats(),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherChats() {
    return FutureBuilder<List<Chat>>(
      future: _chatService.getTeacherChats(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final chats = snapshot.data ?? [];
        return ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            final chat = chats[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(chat.teacher.name[0]),
              ),
              title: Text(chat.teacher.name),
              subtitle: Text(chat.lastMessage),
              trailing: Text(chat.timestamp),
              onTap: () => _openChat(context, chat),
            );
          },
        );
      },
    );
  }

  Widget _buildGroupChats() {
    return FutureBuilder<List<GroupChat>>(
      future: _chatService.getGroupChats(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final groupChats = snapshot.data ?? [];
        return ListView.builder(
          itemCount: groupChats.length,
          itemBuilder: (context, index) {
            final groupChat = groupChats[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(groupChat.name[0]),
              ),
              title: Text(groupChat.name),
              subtitle: Text('${groupChat.members} members - ${groupChat.lastMessage}'),
              trailing: Text(groupChat.timestamp),
              onTap: () => _openGroupChat(context, groupChat),
            );
          },
        );
      },
    );
  }

  void _openChat(BuildContext context, Chat chat) {
    // TODO: Navigate to individual chat screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening chat with ${chat.teacher.name}')),
    );
  }

  void _openGroupChat(BuildContext context, GroupChat groupChat) {
    // TODO: Navigate to group chat screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Opening ${groupChat.name} group chat')),
    );
  }
}