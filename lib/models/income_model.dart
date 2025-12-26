import 'package:flutter/material.dart';

enum IncomeCategory { freelance, salary, passiveIncome, sales }

//category images
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: 'assets/images/freelance.png',
  IncomeCategory.salary: 'assets/images/health.png',
  IncomeCategory.passiveIncome: 'assets/images/car.png',
  IncomeCategory.sales:  'assets/images/salary.png',
};

//category colors
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: Color.fromARGB(255, 255, 158, 1),
  IncomeCategory.salary: Color.fromARGB(255, 30, 136, 229),
  IncomeCategory.passiveIncome: Color.fromARGB(255, 67, 160, 71),
  IncomeCategory.sales: Color.fromARGB(255, 223, 204, 33),
};

//category names
final class IncomeModel {
  final int id;
  final String title;
  final IncomeCategory category;
  final double amount;
  final DateTime date;
  final DateTime time;
  final String description;

  IncomeModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.title,
    required this.time,
    required this.description,
  });
}
