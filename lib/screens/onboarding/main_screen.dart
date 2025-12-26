import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/screens/add_new_screen.dart';
import 'package:expenz_tracker_app/screens/budget_screen.dart';
import 'package:expenz_tracker_app/screens/home_screen.dart';
import 'package:expenz_tracker_app/screens/profile_screen.dart';
import 'package:expenz_tracker_app/screens/transactions_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current index of bottom navigation bar
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    //Screen list
    final List<Widget> screens = [
      const HomeScreen(),
      const TransactionsScreen(),
      const AddNewScreen(),
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
