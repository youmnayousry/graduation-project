import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graduationproject/main.dart'; // Ensure MyApp is imported

void main() {
  testWidgets('Splash screen loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the splash screen is displayed
    expect(find.text("Welcome to MyApp"), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // Wait for navigation to Login screen
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Verify the Login screen appears
    expect(find.text("Login"), findsOneWidget);
  });
}
