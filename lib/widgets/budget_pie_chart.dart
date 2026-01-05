import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
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
  //sections data for pie chart
  List<PieChartSectionData> getSections() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.food],
          value: widget.expenseCategoryTotals[ExpensCategory.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.health],
          value: widget.expenseCategoryTotals[ExpensCategory.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.shopping],
          value: widget.expenseCategoryTotals[ExpensCategory.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.subscriptions],
          value:
              widget.expenseCategoryTotals[ExpensCategory.subscriptions] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.transport],
          value: widget.expenseCategoryTotals[ExpensCategory.transport] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
