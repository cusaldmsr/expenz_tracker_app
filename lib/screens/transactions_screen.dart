import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/widgets/expense_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions Screen')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ExpenseCard(
                title: 'Groceries',
                date: DateTime.now(),
                amount: 50.0,
                category: ExpensCategory.food,
                description: 'Bought groceries from the supermarket',
                createdAt: DateTime.now(),
              ),
              ExpenseCard(
                title: 'Transport',
                date: DateTime.now(),
                amount: 20.0,
                category: ExpensCategory.transport,
                description: 'Taxi fare',
                createdAt: DateTime.now(),
              ),
              ExpenseCard(
                title: 'Entertainment',
                date: DateTime.now(),
                amount: 30.0,
                category: ExpensCategory.shopping,
                description: 'Movie tickets',
                createdAt: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
