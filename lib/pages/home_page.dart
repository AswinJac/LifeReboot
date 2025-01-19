import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'appointment_page.dart';
import 'wellness_page.dart';
import 'awareness_page.dart';
import 'journal_page.dart';
import 'progress_page.dart'; // Import the ProgressPage
import 'support_page.dart'; // Import the SupportPage

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String dailyMotivation = 'Stay Strong, You Got This!'; // Default motivation

  final List<Widget> _pages = [
    const HomePage(), // Home Page
    const AppointmentPage(),
    const ProgressPage(), // Progress Page
    const WellnessPage(),
    const AwarenessPage(),
    const JournalPage(),
    const SupportPage(), // Support Page
  ];

  @override
  void initState() {
    super.initState();
    _setDailyMotivation();
  }

  // Function to calculate the day of the year
  int getDayOfYear(DateTime date) {
    return int.parse(
        (date.difference(DateTime(date.year)).inDays + 1).toString());
  }

  // Function to set daily motivation based on the day of the year
  void _setDailyMotivation() {
    final currentDate = DateTime.now();
    final int dayOfYear = getDayOfYear(currentDate);

    // Using the day of the year as a seed to generate a daily motivation
    final List<String> motivations = [
      'Stay Strong, You Got This!',
      'Every day is a fresh start.',
      'Believe in yourself and all that you are.',
      'You are capable of amazing things.',
      'Keep pushing forward, you’re doing great!',
    ];

    // Randomizing the motivation based on the day of the year
    final randomMotivation = motivations[dayOfYear % motivations.length];

    setState(() {
      dailyMotivation = randomMotivation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Motivation Box
            Card(
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  dailyMotivation,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sobriety Counter Card
            Card(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Days Clean',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '30', // Replace with actual count
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Keep going strong!',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Quick Actions Grid
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildActionCard(
                  context,
                  'Book Appointment',
                  Icons.calendar_today,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AppointmentPage()),
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'Journal',
                  Icons.book,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JournalPage()),
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'Progress Tracker',
                  Icons.bar_chart,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ProgressPage()), // Navigate to Progress Page
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'Support Group',
                  Icons.people,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SupportPage()), // Navigate to SupportPage
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'Wellness',
                  Icons.fitness_center,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WellnessPage()),
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'Awareness',
                  Icons.info,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AwarenessPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart), // Progress Tracker icon
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), // Wellness icon
            label: 'Wellness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info), // Awareness icon
            label: 'Awareness',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Journal icon
            label: 'Journal', // Add Journal to bottom navigation bar
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), // Support group icon
            label:
                'Support Group', // Add Support group to bottom navigation bar
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _pages[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.blue,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
