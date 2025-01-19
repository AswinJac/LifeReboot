import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date
import 'package:table_calendar/table_calendar.dart'; // For calendar

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  DateTime _selectedDate = DateTime.now();
  late Map<DateTime, List<String>> _events;
  late CalendarFormat _calendarFormat;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _events = {};
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
  }

  void _addEvent(String event) {
    if (_events[_selectedDate] != null) {
      _events[_selectedDate]?.add(event);
    } else {
      _events[_selectedDate] = [event];
    }
  }

  // Sample Milestone Dates
  final List<DateTime> _milestones = [
    DateTime.now().subtract(Duration(days: 50)),
    DateTime.now().subtract(Duration(days: 100)),
    DateTime.now().subtract(Duration(days: 125)),
  ];

  // Function to check if a date is a milestone
  bool _isMilestone(DateTime date) {
    for (var milestone in _milestones) {
      if (DateFormat('yyyy-MM-dd').format(milestone) ==
          DateFormat('yyyy-MM-dd').format(date)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar Widget
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDate,
              selectedDayPredicate: (day) {
                return isSameDay(day, _selectedDate);
              },
              onDaySelected: _onDaySelected,
              eventLoader: (day) {
                return _events[day] ?? [];
              },
              calendarFormat: _calendarFormat,
              headerStyle: HeaderStyle(formatButtonVisible: false),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Event addition
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add event logic here (dialog to enter event)
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController eventController =
                          TextEditingController();
                      return AlertDialog(
                        title: Text('Add Event'),
                        content: TextField(
                          controller: eventController,
                          decoration:
                              InputDecoration(hintText: "Enter event details"),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _addEvent(eventController.text);
                              Navigator.of(context).pop();
                            },
                            child: Text('Add'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Add Event'),
              ),
            ),
            // Milestone Display
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Milestones",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ..._milestones.map((milestone) {
                    return ListTile(
                      title: Text(
                          "Clean Day: ${DateFormat('yyyy-MM-dd').format(milestone)}"),
                    );
                  }).toList(),
                ],
              ),
            ),
            // Plot calories burned (Placeholder for your graph or chart widget)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Calories Burned Over Time",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    height: 200,
                    child: Center(
                      child: Text("Calories Burned Chart Here"),
                    ),
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
