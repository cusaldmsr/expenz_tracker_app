import 'package:flutter/material.dart';

enum ExpensCategory { food, transport, shopping, health, subscriptions }

//category images
final Map<ExpensCategory, String> expensCategoryImages = {
  ExpensCategory.food: 'assets/images/restaurant.png',
  ExpensCategory.transport: 'assets/images/car.png',
  ExpensCategory.shopping: 'assets/images/bag.png',
  ExpensCategory.health: 'assets/images/health.png',
  ExpensCategory.subscriptions: 'assets/images/bill.png',
};

//category colors
final Map<ExpensCategory, Color> expensCategoryColors = {
  ExpensCategory.food: Color.fromARGB(255, 255, 82, 82),
  ExpensCategory.transport: Color.fromARGB(255, 30, 136, 229),
  ExpensCategory.shopping: Color.fromARGB(255, 156, 39, 176),
  ExpensCategory.health: Color.fromARGB(255, 67, 160, 71),
  ExpensCategory.subscriptions: Color.fromARGB(255, 255, 143, 0),
};

class ExpensModel {
  final int id;
  final String title;
  final ExpensCategory category;
  final double amount;
  final DateTime date;
  final DateTime time;
  final String description;

  ExpensModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.title,
    required this.time,
    required this.description,
  });

  //Convert the expensModel to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category.index,
      'amount': amount,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }
}
