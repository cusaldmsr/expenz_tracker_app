import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:expenz_tracker_app/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verify MaterialApp is present
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
