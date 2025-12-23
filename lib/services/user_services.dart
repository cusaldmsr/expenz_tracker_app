import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final BuildContext context = await Future.value(context);
    // Implementation for fetching user data
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Passwords do not match')));

      return;
    }

    //If the users password and confirm password match, proceed to store user details
    try {
      // create an instance of SharedPreferences
      final prefs = await SharedPreferences.getInstance();

      // store the user details as key-value pairs
      await prefs.setString('fullName', fullName);
      await prefs.setString('email', email);
      await prefs.setString('phoneNumber', phoneNumber);
      await prefs.setString('password', password);

      // Notify user of successful storage
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User details stored successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error storing user details: $e')));
    }
  }
}
