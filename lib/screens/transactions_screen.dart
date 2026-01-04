import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/widgets/expense_card.dart';
import 'package:expenz_tracker_app/widgets/income_card.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'See your Financial Records',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: kMainColor,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Expenses',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        ExpenseCard(
                          title: 'Health',
                          date: DateTime.now(),
                          amount: 40.0,
                          category: ExpensCategory.health,
                          description: 'Pharmacy purchase',
                          createdAt: DateTime.now(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Incomes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        IncomeCard(
                          title: 'Salary',
                          date: DateTime.now(),
                          amount: 5000.0,
                          category: IncomeCategory.salary,
                          description: 'Monthly salary',
                          createdAt: DateTime.now(),
                        ),
                        IncomeCard(
                          title: 'Freelance',
                          date: DateTime.now(),
                          amount: 1500.0,
                          category: IncomeCategory.freelance,
                          description: 'Freelance project payment',
                          createdAt: DateTime.now(),
                        ),
                        IncomeCard(
                          title: 'Passive Income',
                          date: DateTime.now(),
                          amount: 2000.0,
                          category: IncomeCategory.passiveIncome,
                          description: 'Returns from investment',
                          createdAt: DateTime.now(),
                        ),
                        IncomeCard(
                          title: 'Gift',
                          date: DateTime.now(),
                          amount: 300.0,
                          category: IncomeCategory.gift,
                          description: 'Birthday gift from friend',
                          createdAt: DateTime.now(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
