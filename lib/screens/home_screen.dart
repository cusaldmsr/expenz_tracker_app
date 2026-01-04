import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/constants/constants.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/services/user_services.dart';
import 'package:expenz_tracker_app/widgets/expense_card.dart';
import 'package:expenz_tracker_app/widgets/income_card.dart';
import 'package:expenz_tracker_app/widgets/income_expenz_card.dart';
import 'package:expenz_tracker_app/widgets/line_chart_sample.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<ExpensModel> expensesList;
  final List<IncomeModel> incomesList;
  final void Function(ExpensModel) onDismissedExpenses;
  final void Function(IncomeModel) onDismissedIncomes;
  const HomeScreen({
    super.key,
    required this.expensesList,
    required this.incomesList,
    required this.onDismissedExpenses,
    required this.onDismissedIncomes,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for storeing user details
  String fullname = '';

  @override
  void initState() {
    super.initState();
    // Load user details when the screen initializes
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    // Assuming you have a UserService to get user details
    final userDetails = await UserService.getUserDetails();
    setState(() {
      fullname = userDetails['fullname'] ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.24,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.35),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: kMainColor,
                              border: Border.all(color: kMainColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Hello, $fullname!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              // Handle notification icon press
                            },
                            icon: Icon(
                              Icons.notifications_active,
                              size: 28,
                              color: kGrey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IncomeExpenzCard(
                            title: 'Income',
                            amount: "\$500",
                            bgColor: Colors.green,
                            imgPath: 'assets/images/income.png',
                          ),
                          SizedBox(width: 15),
                          IncomeExpenzCard(
                            title: 'Expenses',
                            amount: "\$300",
                            bgColor: Colors.red,
                            imgPath: 'assets/images/expense.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),

              //line chart
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Spend Frequency',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    LineChartSample(),

                    //Recent Transactions
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent Transactions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
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
                              widget.expensesList.isEmpty &&
                                      widget.incomesList.isEmpty
                                  ? Center(
                                      child: Text(
                                        'No transactions added yet!',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: kGrey,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                              ListView.builder(
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
