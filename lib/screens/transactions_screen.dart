import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/widgets/expense_card.dart';
import 'package:expenz_tracker_app/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionsScreen extends StatefulWidget {
  final List<ExpensModel> expensesList;
  final List<IncomeModel> incomesList;
  final void Function(ExpensModel) onDismissedExpenses;
  final void Function(IncomeModel) onDismissedIncomes;
  const TransactionsScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpenses,
    required this.incomesList,
    required this.onDismissedIncomes,
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
                        widget.expensesList.isEmpty
                            ? Center(
                                child: Text(
                                  'No transactions added yet!',
                                  style: TextStyle(fontSize: 16, color: kGrey),
                                ),
                              )
                            // : const SizedBox.shrink(),
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.expensesList.length,
                                itemBuilder: (context, index) {
                                  final expens = widget.expensesList[index];
                                  return Dismissible(
                                    key: ValueKey(expens),
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (direction) {
                                      setState(() {
                                        widget.onDismissedExpenses(expens);
                                      });
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
                        widget.incomesList.isEmpty
                            ? Center(
                                child: Text(
                                  'No transactions added yet!',
                                  style: TextStyle(fontSize: 16, color: kGrey),
                                ),
                              )
                            // : const SizedBox.shrink(),
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.incomesList.length,
                                itemBuilder: (context, index) {
                                  final income = widget.incomesList[index];
                                  return Dismissible(
                                    key: ValueKey(income),
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (direction) {
                                      setState(() {
                                        widget.onDismissedIncomes(income);
                                      });
                                    },
                                    child: IncomeCard(
                                      title: income.title,
                                      date: income.date,
                                      amount: income.amount,
                                      category: income.category,
                                      description: income.description,
                                      createdAt: income.time,
                                    ),
                                  );
                                },
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
