import 'package:expenz_tracker_app/data/onboarding_data.dart';
import 'package:expenz_tracker_app/screens/onboarding/front_page.dart';
import 'package:expenz_tracker_app/screens/onboarding/sheared_onboarding_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Onboarding Screens
                PageView(
                  children: [
                    FrontPage(),
                    ShearedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[0].title,
                      description:
                          OnboardingData.onboardingDataList[0].description,
                      imagePath: OnboardingData.onboardingDataList[0].imagePath,
                    ),
                    ShearedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[1].title,
                      description:
                          OnboardingData.onboardingDataList[1].description,
                      imagePath: OnboardingData.onboardingDataList[1].imagePath,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
