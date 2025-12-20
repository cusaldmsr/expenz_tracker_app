import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ShearedOnboardingScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  const ShearedOnboardingScreen({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 300, fit: BoxFit.cover),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
