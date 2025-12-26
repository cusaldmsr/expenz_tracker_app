import 'package:expenz_tracker_app/services/user_services.dart';
import 'package:expenz_tracker_app/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.checkFullname(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          final bool isFullnameStored = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Expenz Tracker',
            theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
            home: Wrapper(showMainScreen: isFullnameStored),
          );
        }
      },
    );
  }
}
