import 'package:expenz_tracker_app/constants/colors.dart';
import 'package:expenz_tracker_app/data/onboarding_data.dart';
import 'package:expenz_tracker_app/screens/onboarding/front_page.dart';
import 'package:expenz_tracker_app/screens/onboarding/sheared_onboarding_screen.dart';
import 'package:expenz_tracker_app/screens/user_data_screen.dart';
import 'package:expenz_tracker_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool showDetailsPage = false;
  int currentPage = 0;
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
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3 ? true : false;
                    });
                  },
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
                    ShearedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[2].title,
                      description:
                          OnboardingData.onboardingDataList[2].description,
                      imagePath: OnboardingData.onboardingDataList[2].imagePath,
                    ),
                  ],
                ),
                // Smooth Indicator
                Container(
                  alignment: const Alignment(0, 0.55),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: const WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),
                // Navigation Buttons
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserDataScreen(),
                                ),
                              );
                            },
                            child: CustomButton(
                              text: showDetailsPage ? "Get Started" : "Next",
                              color: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustomButton(
                              text: showDetailsPage ? "Get Started" : "Next",
                              color: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
