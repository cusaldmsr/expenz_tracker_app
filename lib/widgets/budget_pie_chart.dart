import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:flutter/material.dart';

class BudgetPieChart extends StatefulWidget {
  final Map<ExpensCategory, double> expenseCategoryTotals;
  final Map<IncomeCategory, double> incomeCategoryTotals;
  final bool isExpense;
  const BudgetPieChart({
    super.key,
    required this.expenseCategoryTotals,
    required this.incomeCategoryTotals,
    required this.isExpense,
  });

  @override
  State<BudgetPieChart> createState() => _BudgetPieChartState();
}

class _BudgetPieChartState extends State<BudgetPieChart> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
