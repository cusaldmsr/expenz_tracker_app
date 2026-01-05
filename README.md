# expenz_tracker_app

Flutter expense tracker with onboarding, profile capture, and shared-preferences backed income/expense management.

## What’s inside

- **Onboarding** with logo splash, three feature slides, and a worm indicator in [lib/screens/onboarding_screen.dart](lib/screens/onboarding_screen.dart) using `smooth_page_indicator`.
- **Profile capture** form in [lib/screens/user_data_screen.dart](lib/screens/user_data_screen.dart) (name, email, phone, password/confirm, remember toggle) persisted via [lib/services/user_services.dart](lib/services/user_services.dart).
- **Wrapper logic** in [lib/widgets/wrapper.dart](lib/widgets/wrapper.dart) that decides between onboarding and the main app based on stored fullname.
- **Main app shell** in [lib/screens/onboarding/main_screen.dart](lib/screens/onboarding/main_screen.dart) with bottom navigation: Home, Transactions, Add, Budget, Profile.
- **Income/expense CRUD** via [lib/screens/add_new_screen.dart](lib/screens/add_new_screen.dart) with category pickers, date/time pickers, and persistence through [lib/services/expense_services.dart](lib/services/expense_services.dart) and [lib/services/income_services.dart](lib/services/income_services.dart).
- **Visualization**: line chart on Home ([lib/widgets/line_chart_sample.dart](lib/widgets/line_chart_sample.dart)) and pie chart with category breakdown on Budget ([lib/widgets/budget_pie_chart.dart](lib/widgets/budget_pie_chart.dart)).
- **UI building blocks**: Inter font family, palette in [lib/constants/colors.dart](lib/constants/colors.dart), spacing constants in [lib/constants/constants.dart](lib/constants/constants.dart), reusable buttons/cards under [lib/widgets](lib/widgets).

## Tech stack

- Flutter (Material), Dart ^3.10.4
- Packages: smooth_page_indicator, shared_preferences, intl, fl_chart, cupertino_icons
- State management: setState (no external state lib yet)
- Persistence: SharedPreferences (local only)

## Project structure (high level)

- [lib/main.dart](lib/main.dart): bootstraps app, checks stored fullname to skip onboarding
- [lib/screens](lib/screens): onboarding flow, profile capture, dashboard tabs
- [lib/services](lib/services): shared_preferences helpers for user, income, expense
- [lib/models](lib/models): enums/models for expenses and incomes
- [lib/widgets](lib/widgets): buttons, cards, charts, wrappers
- [assets/](assets/): images, icons, Inter fonts declared in [pubspec.yaml](pubspec.yaml)

## App flow

1. Launch: [lib/main.dart](lib/main.dart) initializes SharedPreferences and asks [UserService.checkFullname()](lib/services/user_services.dart) whether to show onboarding.
2. Onboarding: swipe through feature slides; CTA moves to profile form.
3. Profile form: validate inputs, store to SharedPreferences, then enter the main app.
4. Main app: bottom nav surfaces Home, Transactions, Add, Budget, Profile; add or delete income/expense entries, view charts and recent items.

## Run locally

```powershell
flutter pub get
flutter run            # default device
flutter run -d windows # example desktop target
```

## Build

- Android APK: `flutter build apk`
- iOS (on macOS): `flutter build ios`
- Windows: `flutter build windows`

## Testing and linting

- Analyze: `flutter analyze`
- Tests: `flutter test`

## Data and persistence

- User profile keys: fullname, email, phoneNumber, password (stored in SharedPreferences; not encrypted—use secure storage for production).
- Expense key: expenses; Income key: incomes. Each entry is serialized JSON of [ExpensModel](lib/models/expens_model.dart) or [IncomeModel](lib/models/income_model.dart).
- Deleting an item rewrites the stored list.

## Assets and theming

- Color palette in [lib/constants/colors.dart](lib/constants/colors.dart); spacing in [lib/constants/constants.dart](lib/constants/constants.dart).
- Inter fonts registered in [pubspec.yaml](pubspec.yaml); MaterialApp sets `fontFamily: 'Inter'` in [lib/main.dart](lib/main.dart).
- Image assets under [assets/images](assets/images) and icons under [assets/app_icons](assets/app_icons).

## Troubleshooting

- If onboarding repeats, ensure fullname is stored (SharedPreferences clear will reset flow).
- If charts show empty data, verify incomes/expenses exist and are not zero-valued entries.
- Hot reload issues on Windows: restart `flutter run -d windows` after font/asset changes.

## Future ideas

- Secure storage for credentials, cloud sync, authentication
- Search/filter for transactions, CSV export/import
- Budget targets with alerts, recurring transactions
- Theming toggle and accessibility passes
