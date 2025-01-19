import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  // List of groups
  final List<Map<String, dynamic>> groups = [
    {
      'name': 'Group 1',
      'description': 'Support group for wellness and motivation',
      'members': 25,
    },
    {
      'name': 'Group 2',
      'description': 'Substance abuse prevention group',
      'members': 18,
    },
    {
      'name': 'Group 3',
      'description': 'Mental health support group',
      'members': 30,
    },
  ];

  // Mockup for functionality of image sending, chat, etc.
  void _sendImage(String groupName) {
    // Logic to send image
    print('Sending image to $groupName');
  }

  void _sendAnnouncement(String groupName) {
    // Logic to send announcement
    print('Sending announcement to $groupName');
  }

  void _startVoiceCall(String groupName) {
    // Logic to start voice call
    print('Starting voice call in $groupName');
  }

  void _startVideoCall(String groupName) {
    // Logic to start video call
    print('Starting video call in $groupName');
  }

  void _sendMessage(String groupName) {
    // Logic to send message
    print('Sending message to $groupName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Groups'),
      ),
      body: ListView(
        children: [
          for (var group in groups)
            Card(
              margin: const EdgeInsets.all(10),
              child: ExpansionTile(
                title: Text(group['name']),
                subtitle: Text('${group['members']} members'),
                children: [
                  ListTile(
                    title: Text(group['description']),
                    subtitle: const Text('Description of the group'),
                  ),
                  const Divider(),

                  // Chat and Send Image Section
                  ListTile(
                    title: const Text('Chat'),
                    trailing: IconButton(
                      icon: const Icon(Icons.chat),
                      onPressed: () => _sendMessage(group['name']),
                    ),
                  ),
                  ListTile(
                    title: const Text('Send Image'),
                    trailing: IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () => _sendImage(group['name']),
                    ),
                  ),
                  const Divider(),

                  // Announcements Section
                  ListTile(
                    title: const Text('Send Announcement'),
                    trailing: IconButton(
                      icon: const Icon(Icons.announcement),
                      onPressed: () => _sendAnnouncement(group['name']),
                    ),
                  ),
                  const Divider(),

                  // Call Sections
                  ListTile(
                    title: const Text('Voice Call'),
                    trailing: IconButton(
                      icon: const Icon(Icons.phone),
                      onPressed: () => _startVoiceCall(group['name']),
                    ),
                  ),
                  ListTile(
                    title: const Text('Video Call'),
                    trailing: IconButton(
                      icon: const Icon(Icons.videocam),
                      onPressed: () => _startVideoCall(group['name']),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
