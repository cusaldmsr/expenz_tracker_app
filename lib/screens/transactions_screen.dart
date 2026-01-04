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
        child: Column(
          children: [
            const ExpenseCard(),
            const ExpenseCard(),
            const ExpenseCard(),
          ],
        ),
      ),
    );
  }
}
