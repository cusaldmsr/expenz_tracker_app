import 'package:expenz_tracker_app/models/onboarding_model.dart';

class OnboardingData {
  static final List<OnboardingModel> onboardingDataList = [
    OnboardingModel(
      imagePath: 'assets/images/onboard_1.png',
      title: 'Track Your Expenses',
      description:
          'Easily monitor and manage your daily expenses with our intuitive interface.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboard_2.png',
      title: 'Set Budgets',
      description:
          'Create budgets to control your spending and achieve your financial goals.',
    ),
    OnboardingModel(
      imagePath: 'assets/images/onboard_3.png',
      title: 'Generate Reports',
      description:
          'Get detailed reports and insights on your spending habits over time.',
    ),
  ];
}
