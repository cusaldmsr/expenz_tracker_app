import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/services/user_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
