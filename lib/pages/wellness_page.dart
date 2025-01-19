// lib/pages/wellness_page.dart
import 'package:flutter/material.dart';

class WellnessPage extends StatefulWidget {
  const WellnessPage({super.key});

  @override
  State<WellnessPage> createState() => _WellnessPageState();
}

class _WellnessPageState extends State<WellnessPage> {
  final List<Map<String, String>> _forumMessages = [];
  final List<Map<String, String>> _privateMessages = [];
  final TextEditingController _forumController = TextEditingController();
  final TextEditingController _privateMessageController =
      TextEditingController();

  void _addForumMessage(String message) {
    setState(() {
      _forumMessages.add({'user': 'Anonymous', 'message': message});
    });
    _forumController.clear();
  }

  void _addPrivateMessage(String message) {
    setState(() {
      _privateMessages.add({'user': 'You', 'message': message});
    });
    _privateMessageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wellness Forum'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.forum), text: 'Forum'),
              Tab(icon: Icon(Icons.chat), text: 'Private Chat'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Forum Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _forumMessages.length,
                      itemBuilder: (context, index) {
                        final message = _forumMessages[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(message['user']!),
                            subtitle: Text(message['message']!),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _forumController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_forumController.text.trim().isNotEmpty) {
                            _addForumMessage(_forumController.text.trim());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Private Chat Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _privateMessages.length,
                      itemBuilder: (context, index) {
                        final message = _privateMessages[index];
                        return Align(
                          alignment: message['user'] == 'You'
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Card(
                            color: message['user'] == 'You'
                                ? Colors.blue.shade100
                                : Colors.grey.shade200,
                            margin: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: message['user'] == 'You'
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message['user']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(message['message']!),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _privateMessageController,
                          decoration: const InputDecoration(
                            hintText: 'Type a private message...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          if (_privateMessageController.text
                              .trim()
                              .isNotEmpty) {
                            _addPrivateMessage(
                                _privateMessageController.text.trim());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
