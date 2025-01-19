import 'package:flutter/material.dart';

class AwarenessPage extends StatelessWidget {
  const AwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drug Awareness'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Learn About Different Drugs',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Drug List
            _buildDrugCard(
              context,
              'Cocaine',
              'assets/cocaine_image.jpg', // Make sure to add the image in your assets folder
              'Cocaine is a powerful stimulant drug that affects the brain and body.',
              'Origin: Coca plant (Erythroxylum coca), South America.',
              'Side Effects: Increased heart rate, high blood pressure, anxiety, paranoia, and risk of overdose.',
            ),
            const SizedBox(height: 16),
            _buildDrugCard(
              context,
              'Heroin',
              'assets/heroin_image.jpg', // Make sure to add the image in your assets folder
              'Heroin is an opioid drug derived from morphine, which is used recreationally.',
              'Origin: Poppy plant (Papaver somniferum), Southeast Asia, Afghanistan.',
              'Side Effects: Euphoria, drowsiness, respiratory depression, addiction, and risk of overdose.',
            ),
            const SizedBox(height: 16),
            _buildDrugCard(
              context,
              'Methamphetamine',
              'assets/meth_image.jpg', // Make sure to add the image in your assets folder
              'Methamphetamine is a highly addictive stimulant that affects the central nervous system.',
              'Origin: Chemically synthesized.',
              'Side Effects: Increased energy, hyperthermia, anxiety, paranoia, aggression, and long-term damage to the brain.',
            ),
            // Add more drugs as needed
          ],
        ),
      ),
    );
  }

  Widget _buildDrugCard(
    BuildContext context,
    String drugName,
    String imagePath,
    String description,
    String origin,
    String sideEffects,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drug Image
            Center(
              child: Image.asset(
                imagePath,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Drug Name
            Text(
              drugName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            // Origin
            Text(
              origin,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 8),

            // Side Effects
            Text(
              sideEffects,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
