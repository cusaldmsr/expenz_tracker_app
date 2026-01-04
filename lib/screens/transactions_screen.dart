import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/widgets/expense_card.dart';
import 'package:expenz_tracker_app/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  final List<ExpensModel> expensesList;
  final void Function(ExpensModel) onDismissedExpenses;
  const TransactionsScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpenses,
  });

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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.expensesList.length,
                          itemBuilder: (context, index) {
                            final expens = widget.expensesList[index];
                            return Dismissible(
                              key: ValueKey(expens),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction) {
                                widget.onDismissedExpenses(expens);
                              },
                              child: ExpenseCard(
                                title: expens.title,
                                date: expens.date,
                                amount: expens.amount,
                                category: expens.category,
                                description: expens.description,
                                createdAt: expens.time,
                              ),
                            );
                          },
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
