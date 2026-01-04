import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:expenz_tracker_app/screens/add_new_screen.dart';
import 'package:expenz_tracker_app/screens/budget_screen.dart';
import 'package:expenz_tracker_app/screens/home_screen.dart';
import 'package:expenz_tracker_app/screens/profile_screen.dart';
import 'package:expenz_tracker_app/screens/transactions_screen.dart';
import 'package:expenz_tracker_app/services/expense_services.dart';
import 'package:expenz_tracker_app/services/income_services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current index of bottom navigation bar
  int _currentIndex = 0;

  List<ExpensModel> expensesList = [];
  List<IncomeModel> incomesList = [];

  //function to add new expense to the list
  void _fetchAllExpense() async {
    //Fetch all expenses from shared preferences
    List<ExpensModel> fetchedExpenses = await ExpenseServices().fetchExpenses();
    setState(() {
      expensesList = fetchedExpenses;
      debugPrint('Fetched Expenses: ${expensesList.length}');
    });
  }

  //function to add new income to the list
  void _fetchAllIncome() async {
    //Fetch all incomes from shared preferences
    List<IncomeModel> fetchedIncomes = await IncomeServices().getIncomes();
    setState(() {
      incomesList = fetchedIncomes;
      debugPrint('Fetched Incomes: ${incomesList.length}');
    });
  }

  //Function to add new expense to the list
  void _addNewExpense(ExpensModel expense) {
    ExpenseServices().saveExpense(expense, context);
    setState(() {
      expensesList.add(expense);
      // ignore: avoid_print
      print(expensesList.length);
    });
  }

  //Function to add new income to the list
  void _addNewIncome(IncomeModel income) {
    IncomeServices().saveIncome(income, context);
    setState(() {
      incomesList.add(income);
      // ignore: avoid_print
      print(incomesList.length);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _fetchAllExpense();
      _fetchAllIncome();
    });
  }

  //function to remove a expense from the list
  void _removeExpense(ExpensModel expense) {
    ExpenseServices().deleteExpense(expense.id, context);
    setState(() {
      expensesList.remove(expense);
    });
  }

  //function to remove an income from the list
  void _removeIncome(IncomeModel income) {
    IncomeServices().deleteIncome(income.id, context);
    setState(() {
      incomesList.remove(income);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Screen list
    final List<Widget> screens = [
      const HomeScreen(),
      TransactionsScreen(
        expensesList: expensesList,
        onDismissedExpenses: _removeExpense,
        incomesList: incomesList,
        onDismissedIncomes: _removeIncome,
      ),
      AddNewScreen(onAddExpense: _addNewExpense, onAddIncome: _addNewIncome),
      const BudgetScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        showUnselectedLabels: true,
        backgroundColor: kWhite,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: kWhite, size: 30),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: 'Budget'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
