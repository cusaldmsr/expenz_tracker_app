import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Onboarding Screens
                PageView(
                  children: [
                    Container(
                      color: Colors.red,
                      child: const Center(child: Text('Onboarding Screen 1')),
                    ),
                    Container(
                      color: Colors.green,
                      child: const Center(child: Text('Onboarding Screen 2')),
                    ),
                    Container(
                      color: Colors.blue,
                      child: const Center(child: Text('Onboarding Screen 3')),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
