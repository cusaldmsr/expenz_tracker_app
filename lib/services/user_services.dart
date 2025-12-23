import 'package:flutter/material.dart';

class UserServices {
  // User service methods will be implemented here
  static Future<void> storeUserDetails(
    String fullName,
    String email,
    String phoneNumber,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    // Implementation for fetching user data
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Passwords do not match')));
    }
  }
}
