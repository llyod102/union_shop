import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/authentication.dart';

void main() {
  group('Authentication Widget Tests', () {
    testWidgets('Authentication page renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Authentication(),
        ),
      );

      // Verify the page renders
      expect(find.byType(Authentication), findsOneWidget);
    });

    testWidgets('Username field accepts text input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Authentication(),
        ),
      );

      // Find username field and enter text
      final usernameField = find.widgetWithText(TextField, 'Username');
      await tester.enterText(usernameField, 'testuser');
      await tester.pump();

      // Verify text was entered
      expect(find.text('testuser'), findsOneWidget);
    });

    testWidgets('Password field accepts text input',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Authentication(),
        ),
      );

      // Find password field and enter text
      final passwordField = find.widgetWithText(TextField, 'Password');
      await tester.enterText(passwordField, 'password123');
      await tester.pump();

      // Verify text was entered
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('Both fields can accept input simultaneously',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Authentication(),
        ),
      );

      // Enter text in username field
      await tester.enterText(
        find.widgetWithText(TextField, 'Username'),
        'johndoe',
      );
      await tester.pump();

      // Enter text in password field
      await tester.enterText(
        find.widgetWithText(TextField, 'Password'),
        'securepass',
      );
      await tester.pump();

      // Verify both texts are present
      expect(find.text('johndoe'), findsOneWidget);
      expect(find.text('securepass'), findsOneWidget);
    });

    testWidgets('Back button navigates back', (WidgetTester tester) async {
      // Create a simple navigation setup
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Authentication(),
                    ),
                  );
                },
                child: const Text('Go to Auth'),
              ),
            ),
          ),
        ),
      );

      // Navigate to authentication page
      await tester.tap(find.text('Go to Auth'));
      await tester.pumpAndSettle();

      // Verify we're on the authentication page
      expect(find.byType(Authentication), findsOneWidget);

      // Tap back button
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      // Verify we're back to the previous page
      expect(find.text('Go to Auth'), findsOneWidget);
      expect(find.byType(Authentication), findsNothing);
    });
  });
}
