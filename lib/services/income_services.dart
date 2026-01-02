import 'dart:convert';

import 'package:expenz_tracker_app/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServices {
  //Define the key for storing income data in shared preferences
  static const String _incomeKey = 'incomes';

  //Function to save income data to shared preferences
  Future<void> saveIncome(IncomeModel income, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingIncomes = prefs.getStringList(_incomeKey);

      //Converting the existing incomes to a list of IncomeModel objects
      List<IncomeModel> existingIncomeObjects = [];

      if (existingIncomes != null) {
        existingIncomeObjects = existingIncomes
            .map((e) => IncomeModel.fromJson(json.decode(e)))
            .toList();
      }
      //Adding the new income to the list
      existingIncomeObjects.add(income);
      //Converting the list of IncomeModel objects to a list of JSON strings
      List<String> incomeJsonList = existingIncomeObjects
          .map((e) => json.encode(e.toJson()))
          .toList();

      //Save the updated list of incomes back to shared preferences
      await prefs.setStringList(_incomeKey, incomeJsonList);

      //show a success message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Income saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save income'),
            backgroundColor: Colors.red,
          ),
        );
      }
      debugPrint('Error saving income: $e');
    }
  }
}

