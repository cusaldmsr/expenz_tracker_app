import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo.png', width: 100, fit: BoxFit.cover),
        const SizedBox(height: 20),
        const Text(
          'Welcome to Expenz Tracker',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Track your expenses effortlessly',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
