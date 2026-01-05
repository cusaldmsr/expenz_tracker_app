import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Store the userName and password using shared preferences
  static Future<void> storeUserDetails(
    String fullname,
    String email,
    String password,
    String confirmPassword,
    String phoneNumber,
    BuildContext context,
  ) async {
    //check if the password and confirm password are the same
    if (password != confirmPassword) {
      //show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password and Confirm Password do not match"),
        ),
      );
    }
    //Store the username and email in shared preferences
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullname', fullname);
      await prefs.setString('email', email);
      await prefs.setString('phoneNumber', phoneNumber);
      await prefs.setString('password', password);

      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User Details stored successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error storing user details: $e")));
    }
  }

  //Get the username and email from shared preferences
  static Future<Map<String, String>> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fullname = prefs.getString('fullname');
    String? email = prefs.getString('email');
    return {'fullname': fullname!, 'email': email!};
  }

  //remove the username and email from shared preferences
  static Future<void> clearUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('fullname');
    await prefs.remove('email');
  }

  //method to check whether the fullname is stored in shared preferences
  static Future<bool> checkFullname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fullname = prefs.getString('fullname');
    return fullname != null;
  }

  //remove all user details from shared preferences
  static Future<void> clearAllUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('fullname');
    await prefs.remove('email');
    await prefs.remove('phoneNumber');
    await prefs.remove('password');
  }
}
