import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/widgets/budget_pie_chart.dart';
import 'package:expenz_tracker_app/widgets/category_card.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  final Map<ExpensCategory, double> expenseCategoryTotals;
  final Map<IncomeCategory, double> incomeCategoryTotals;
  const BudgetScreen({
    super.key,
    required this.expenseCategoryTotals,
    required this.incomeCategoryTotals,
  });

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectedMethod = 0; //0 for income, 1 for expense
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Financial Report',
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 0 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 66.0,
                              vertical: 14.0,
                            ),
                            child: Text(
                              'Income',
                              style: TextStyle(
                                color: _selectedMethod == 0 ? kWhite : kBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 1 ? kMainColor : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 66.0,
                              vertical: 14.0,
                            ),
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                color: _selectedMethod == 1 ? kWhite : kBlack,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              BudgetPieChart(
                expenseCategoryTotals: widget.expenseCategoryTotals,
                incomeCategoryTotals: widget.incomeCategoryTotals,
                isExpense: _selectedMethod == 1,
              ),
              SizedBox(height: 20),
              // List of categories
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _selectedMethod == 1
                      ? widget.expenseCategoryTotals.length
                      : widget.incomeCategoryTotals.length,
                  itemBuilder: (context, index) {
                    final category = _selectedMethod == 1
                        ? widget.expenseCategoryTotals.keys.toList()[index]
                        : widget.incomeCategoryTotals.keys.toList()[index];
                    final total = _selectedMethod == 1
                        ? widget.expenseCategoryTotals.values.toList()[index]
                        : widget.incomeCategoryTotals.values.toList()[index];
                    return CategoryCard(
                      title: category.name,
                      amount: total,
                      total: _selectedMethod == 1
                          ? widget.expenseCategoryTotals.values.reduce(
                              (a, b) => a + b,
                            )
                          : widget.incomeCategoryTotals.values.reduce(
                              (a, b) => a + b,
                            ),
                      color: _selectedMethod == 1
                          ? expensCategoryColors[category as ExpensCategory]!
                          : incomeCategoryColors[category as IncomeCategory]!,
                      isExpense: _selectedMethod == 1,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
