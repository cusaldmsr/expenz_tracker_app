import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expenz_tracker_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Use in-memory SharedPreferences for tests
    SharedPreferences.setMockInitialValues(<String, Object?>{});

    await tester.pumpWidget(const MyApp());

    // Pump frames until the FutureBuilder resolves or we time out
    const int maxTries = 40; // ~2s at 50ms per pump
    Finder materialAppFinder = find.byType(MaterialApp);
    int tries = 0;
    while (tries < maxTries && tester.any(materialAppFinder) == false) {
      await tester.pump(const Duration(milliseconds: 50));
      tries++;
    }

    // Verify MaterialApp is present
    expect(materialAppFinder, findsOneWidget);
  });
}
