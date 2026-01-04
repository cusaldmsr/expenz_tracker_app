import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final ExpensCategory category;
  final String description;
  final DateTime createdAt;

  const ExpenseCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
    required this.description,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: kGrey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: expensCategoryColors[category]!.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Image.asset(
                expensCategoryImages[category]!,
                height: 24,
                width: 24,
                color: expensCategoryColors[category],
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: kGrey,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '- ' + '\$${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: kRed,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                '${date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour)}:${date.minute.toString().padLeft(2, '0')} ${date.hour >= 12 ? 'PM' : 'AM'}',
                style: const TextStyle(fontSize: 12.0, color: kGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
