import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;

  const CustomButton({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
