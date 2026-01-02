import 'dart:convert';

import 'package:expenz_tracker_app/models/expens_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseServices {
  List<ExpensModel> expensesList = [];

  static const String _expenseKey = 'expenses';

  //Save the expense to the shared preferences
  Future<void> saveExpense(ExpensModel expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingExpenses = prefs.getStringList(_expenseKey);

      //Converting the existing expenses to a list of ExpensModel objects
      List<ExpensModel> existingExpenseObjects = [];

      if (existingExpenses != null) {
        existingExpenseObjects = existingExpenses
            .map((e) => ExpensModel.fromJson(json.decode(e)))
            .toList();
      }
      //Adding the new expense to the list
      existingExpenseObjects.add(expense);
      //Converting the list of ExpensModel objects to a list of JSON strings
      List<String> expenseJsonList = existingExpenseObjects
          .map((e) => json.encode(e.toJson()))
          .toList();

      //Save the updated list of expenses back to shared preferences
      await prefs.setStringList(_expenseKey, expenseJsonList);

      //show a success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Expense saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save expense'),
            backgroundColor: Colors.red,
          ),
        );
      }
      debugPrint('Error saving expense: $e');
    }
  }

  //Fetch all expenses from shared preferences
  Future<List<ExpensModel>> fetchExpenses() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? expenseJsonList = prefs.getStringList(_expenseKey);

      if (expenseJsonList != null) {
        expensesList = expenseJsonList
            .map((e) => ExpensModel.fromJson(json.decode(e)))
            .toList();
      } else {
        expensesList = [];
      }
    } catch (e) {
      debugPrint('Error fetching expenses: $e');
      expensesList = [];
    }
    return expensesList;
  }
}
