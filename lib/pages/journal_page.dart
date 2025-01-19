import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  final TextEditingController _textController = TextEditingController();
  String _currentDate = '';
  XFile? _image; // To store the picked image

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now()
        .toString()
        .split(' ')[0]; // Get current date in yyyy-mm-dd format
  }

  // Save the journal entry with text and image (if any)
  void _saveJournal() {
    String journalContent = _textController.text.isNotEmpty
        ? _textController.text
        : 'No text input';
    String imageContent = _image != null
        ? 'Image selected: ${_image!.path}'
        : 'No image selected';

    // Save the journal content (e.g., to a local database or cloud storage)
    // For now, just display it in a snack bar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Journal saved: $journalContent\n$imageContent')),
    );
  }

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display current date at the top
            Text(
              _currentDate,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Journal text input
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Write your journal entry...',
                border: OutlineInputBorder(),
              ),
              maxLines: 8,
            ),
            const SizedBox(height: 20),

            // Button to save the journal entry
            ElevatedButton(
              onPressed: _saveJournal,
              child: const Text('Save Journal'),
            ),
            const SizedBox(height: 20),

            // Button to pick an image
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 16),

            // Show picked image (if any)
            _image != null
                ? Image.file(
                    File(_image!.path),
                    width: 200,
                    height: 200,
                  )
                : const Text('No image selected'),
          ],
        ),
      ),
    );
  }
}
