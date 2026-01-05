import 'package:expenz_tracker_app/constants/colors.dart';
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
  List<PieChartSectionData> getSections() {
    if (widget.isExpense) {
      return [
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.values[0]],
          value: widget.expenseCategoryTotals[ExpensCategory.values[0]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.values[1]],
          value: widget.expenseCategoryTotals[ExpensCategory.values[1]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.values[2]],
          value: widget.expenseCategoryTotals[ExpensCategory.values[2]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.values[3]],
          value: widget.expenseCategoryTotals[ExpensCategory.values[3]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expensCategoryColors[ExpensCategory.values[4]],
          value: widget.expenseCategoryTotals[ExpensCategory.values[4]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategory.values[0]],
          value: widget.incomeCategoryTotals[IncomeCategory.values[0]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategory.values[1]],
          value: widget.incomeCategoryTotals[IncomeCategory.values[1]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategory.values[2]],
          value: widget.incomeCategoryTotals[IncomeCategory.values[2]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColors[IncomeCategory.values[3]],
          value: widget.incomeCategoryTotals[IncomeCategory.values[3]] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
      sectionsSpace: 0,
      centerSpaceRadius: 70,
      startDegreeOffset: -90,
      sections: getSections(),
      borderData: FlBorderData(show: false),
    );

    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(pieChartData),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "70%",
                style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("of 100%", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
