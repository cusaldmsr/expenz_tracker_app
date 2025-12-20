# expenz_tracker_app

A Flutter expense tracker app scaffold with onboarding, theming, and a user data form.

**Overview**

- **Purpose:** Foundation for an expense tracking application with an onboarding flow and basic form to collect user details.
- **Entry Point:** See [lib/main.dart](lib/main.dart).
- **Primary Screens:** [lib/screens/onboarding_screen.dart](lib/screens/onboarding_screen.dart), [lib/screens/user_data_screen.dart](lib/screens/user_data_screen.dart).

**Features**

- **Onboarding Flow:** Four pages with a worm-style page indicator (via `smooth_page_indicator`).
- **Custom Theme:** Global Inter font family with a defined color palette.
- **User Data Form:** Validated inputs for name, email, phone, password + confirm, and a “Remember Me” option.
- **Navigation:** Context-aware button switches from Next to Get Started, routing into the app.
- **Assets & Icons:** Organized images and app icons under `assets/`.
- **Extensible Persistence:** `shared_preferences` included for future local storage needs.

**Tech Stack**

- **Flutter:** Stable channel (Material design).
- **Dart:** 3.10+ (project `environment` is `^3.10.4`).
- **Packages:** `smooth_page_indicator`, `shared_preferences`, `cupertino_icons`, `flutter_lints`.

**Project Structure**

- **App:** [lib/](lib/) contains core code
  - **Main:** [lib/main.dart](lib/main.dart) bootstraps `MaterialApp` with Inter font
  - **Screens:** [lib/screens/onboarding_screen.dart](lib/screens/onboarding_screen.dart), [lib/screens/user_data_screen.dart](lib/screens/user_data_screen.dart), plus onboarding sub-screens in [lib/screens/onboarding](lib/screens/onboarding)
  - **Widgets:** [lib/widgets/custom_button.dart](lib/widgets/custom_button.dart)
  - **Constants:** [lib/constants/colors.dart](lib/constants/colors.dart), [lib/constants/constants.dart](lib/constants/constants.dart)
  - **Data/Models:** [lib/data/onboarding_data.dart](lib/data/onboarding_data.dart), [lib/models/onboarding_model.dart](lib/models/onboarding_model.dart)
- **Assets:** images, icons, and fonts under [assets/](assets/)
- **Platform:** standard Flutter platform folders (`android/`, `ios/`, `web/`, `windows/`, `linux/`, `macos/`)
- **Tests:** sample widget test in [test/widget_test.dart](test/widget_test.dart)

**Requirements**

- **Flutter SDK:** Install from https://docs.flutter.dev (ensure Dart 3.10+).
- **Platforms:** Android Studio/Xcode/Visual Studio toolchains as needed per target.

**Setup**

1. Install Flutter and verify:
   ```powershell
   flutter --version
   flutter doctor
   ```
2. Fetch dependencies:
   ```powershell
   flutter pub get
   ```

**Run**

- Start the app on a connected device or emulator:
  ```powershell
  flutter run
  ```
- Specify platform/device when needed (examples):
  ```powershell
  flutter run -d windows
  flutter run -d chrome
  flutter run -d emulator-5554
  ```

**Build**

- Android APK:
  ```powershell
  flutter build apk
  ```
- iOS (on macOS with Xcode):
  ```bash
  flutter build ios
  ```
- Windows desktop:
  ```powershell
  flutter build windows
  ```

**Configuration**

- **App Theme:** Set in [lib/main.dart](lib/main.dart) using Inter font.
- **Colors:** Update palette in [lib/constants/colors.dart](lib/constants/colors.dart).
- **Layout Constants:** Adjust spacing in [lib/constants/constants.dart](lib/constants/constants.dart).
- **Assets:** Declared in [pubspec.yaml](pubspec.yaml) under `flutter.assets` and `flutter.fonts`.

**Screenshots**

- Add images to `docs/` and reference here (e.g., onboarding, form screen).

**Roadmap Ideas**

- **Expense Tracking:** Transactions list with categories and notes.
- **Budgets:** Monthly/weekly budgets and progress tracking.
- **Reports:** Charts and trends (aligns with onboarding).
- **Persistence:** Initialize `shared_preferences` for onboarding completion; consider Hive/SQLite for data.
- **Auth:** Optional sign-in and secure storage.

**Testing**

- Run tests:
  ```powershell
  flutter test
  ```

**Contributing**

- Open issues/PRs with concise context and screenshots when relevant.
- Follow `flutter_lints` and keep widgets/components small and composable.

**License**

- No license specified. Add one if you plan to open-source.
