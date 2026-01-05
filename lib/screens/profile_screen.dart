import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/screens/onboarding_screen.dart';
import 'package:expenz_tracker_app/services/expense_services.dart';
import 'package:expenz_tracker_app/services/income_services.dart';
import 'package:expenz_tracker_app/services/user_services.dart';
import 'package:expenz_tracker_app/widgets/profile_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //for storeing user details
  String fullname = 'New User';
  String email = 'not found';

  @override
  void initState() {
    super.initState();
    UserService.getUserDetails().then((userDetails) {
      if (userDetails['fullname'] != null && userDetails['email'] != null) {
        setState(() {
          fullname = userDetails['fullname']!;
          email = userDetails['email']!;
        });
      }
    });
  }

  //open scaffold messenger for logout
  void _showLogoutMessage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Wrap(
            children: [
              ListTile(title: const Text('Are you sure you want to logout?')),

              ListTile(
                leading: const Icon(Icons.cancel, color: kGrey),
                title: const Text('Cancel'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: kRed),
                title: const Text('Logout', style: TextStyle(color: kRed)),
                onTap: () async {
                  //clear the user data from shared preferences
                  await UserService.clearAllUserDetails();
                  //navigate to onboarding screen
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );

                  //clear all expenses and incomes
                  if (context.mounted) {
                    await ExpenseServices.clearAllExpenses(context);
                    await IncomeServices.clearAllIncomes(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
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
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              color: kWhite,
                              border: Border.all(color: kMainColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                'assets/images/user.jpg',
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fullname,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: kGrey,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            // Handle notification icon press
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            size: 28,
                            color: kGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Profile Cards
                    ProfileCard(
                      icon: Icons.person,
                      title: 'My Wallet',
                      color: kBlue,
                    ),
                    ProfileCard(
                      icon: Icons.settings,
                      title: 'Settings',
                      color: kMainColor,
                    ),
                    ProfileCard(
                      icon: Icons.notifications_none,
                      title: 'Notifications',
                      color: kPink,
                    ),
                    ProfileCard(
                      icon: Icons.lock,
                      title: 'Privacy',
                      color: kGreen,
                    ),
                    ProfileCard(
                      icon: Icons.help_outline,
                      title: 'Help & Support',
                      color: kOrange,
                    ),
                    ProfileCard(
                      icon: Icons.language_sharp,
                      title: 'App Language',
                      color: kBrown,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showLogoutMessage(context);
                      },
                      child: ProfileCard(
                        icon: Icons.logout,
                        title: 'Logout',
                        color: kRed,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
