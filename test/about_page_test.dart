import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/main.dart';

void main() {
  group('AboutPage Widget Tests', () {
    testWidgets('AboutPage renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/': (context) => const Scaffold(body: Text('Home Page')),
            '/authentication': (context) =>
                const Scaffold(body: Text('Auth Page')),
            '/cart': (context) => const Scaffold(body: Text('Cart Page')),
            '/personalisation': (context) =>
                const Scaffold(body: Text('Personalisation Page')),
          },
        ),
      );

      // Verify the page renders
      expect(find.byType(AboutPage), findsOneWidget);
    });

    testWidgets('Header banner displays correct text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/': (context) => const Scaffold(body: Text('Home Page')),
          },
        ),
      );

      // Check for the promotional banner
      expect(
        find.text(
            'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!'),
        findsOneWidget,
      );
    });

    testWidgets('About Us title is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for the "About us" heading
      expect(find.text('About us'), findsOneWidget);
    });

    testWidgets('Welcome message is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for the welcome text
      expect(find.text('Welcome to the Union Shop!'), findsOneWidget);
    });

    testWidgets('Contact email is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for contact email in the description
      expect(
        find.textContaining('hello@upsu.net'),
        findsOneWidget,
      );
    });

    testWidgets('Team signature is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for the team signature
      expect(find.text('The Union Shop & Reception Team​​​​​​​​​'),
          findsOneWidget);
    });

    testWidgets('Opening hours section is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for opening hours heading
      expect(find.text('Opening hours'), findsOneWidget);

      // Check for winter break closure information
      expect(find.text('❄️ Winter Break Closure Dates ❄️'), findsOneWidget);
      expect(find.text('Closing 4pm 19/12/2025'), findsOneWidget);
      expect(find.text('Reopening 10am 05/01/2026'), findsOneWidget);

      // Check for term time hours
      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
      expect(find.text('Monday - Friday 10am - 3pm'), findsOneWidget);
      expect(find.text('Purchase Online 24/7'), findsOneWidget);
    });

    testWidgets('Help & Information section is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for Help & Information heading
      expect(find.text('Help & Information'), findsOneWidget);

      // Check for buttons in this section
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);
    });

    testWidgets('Latest Offers section is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for Latest Offers heading
      expect(find.text('Lastest Offers'), findsOneWidget);

      // Check for email input and subscribe button
      expect(
          find.widgetWithText(TextField, 'Enter your email'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Subscribe'), findsOneWidget);
    });

    testWidgets('Navigation icons are present', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/': (context) => const Scaffold(body: Text('Home Page')),
            '/authentication': (context) =>
                const Scaffold(body: Text('Auth Page')),
            '/cart': (context) => const Scaffold(body: Text('Cart Page')),
          },
        ),
      );

      // Check for navigation icons
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('Search icon toggles search field',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Initially, search field should not be visible
      expect(find.byType(TextField),
          findsNWidgets(2)); // Email field only initially

      // Tap search icon
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      // Now search field should be visible
      expect(find.byType(TextField), findsNWidgets(3)); // Search + Email fields
    });

    testWidgets('Logo navigates to home page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/': (context) => const Scaffold(body: Text('Home Page')),
          },
        ),
      );

      // Find and tap the logo (GestureDetector with Image.network)
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Verify navigation to home
      expect(find.text('Home Page'), findsOneWidget);
    });

    testWidgets('Cart icon navigates to cart page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/cart': (context) => const Scaffold(body: Text('Cart Page')),
          },
        ),
      );

      // Tap cart icon
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Verify navigation to cart
      expect(find.text('Cart Page'), findsOneWidget);
    });

    testWidgets('Person icon navigates to authentication page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/authentication': (context) =>
                const Scaffold(body: Text('Auth Page')),
          },
        ),
      );

      // Tap person icon
      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();

      // Verify navigation to authentication
      expect(find.text('Auth Page'), findsOneWidget);
    });

    testWidgets('Personalisation link navigates to personalisation page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const AboutPage(),
          routes: {
            '/personalisation': (context) =>
                const Scaffold(body: Text('Personalisation Page')),
          },
        ),
      );

      // Find and tap the personalisation link in RichText
      await tester.tap(find.textContaining('personailisation service'));
      await tester.pumpAndSettle();

      // Verify navigation to personalisation
      expect(find.text('Personalisation Page'), findsOneWidget);
    });

    testWidgets('Email input field accepts text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Find the email TextField
      final emailField = find.widgetWithText(TextField, 'Enter your email');
      expect(emailField, findsOneWidget);

      // Enter text
      await tester.enterText(emailField, 'test@example.com');
      await tester.pump();

      // Verify text was entered
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('Subscribe button exists and is tappable',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Find subscribe button
      final subscribeButton = find.widgetWithText(ElevatedButton, 'Subscribe');
      expect(subscribeButton, findsOneWidget);

      // Tap subscribe button (should not throw error)
      await tester.tap(subscribeButton);
      await tester.pump();
    });

    testWidgets('Page is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Verify SingleChildScrollView exists
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('HomeButtonSections widgets are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Check for HomeButtonSections (should find multiple)
      expect(find.byType(HomeButtonSections), findsWidgets);
    });
  });

  group('AboutPage State Tests', () {
    testWidgets('Search state toggles correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: AboutPage(),
        ),
      );

      // Initially not searching - should see HomeButtonSections
      expect(find.byType(HomeButtonSections), findsWidgets);

      // Tap search icon to start searching
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();

      // Should still have search icon
      expect(find.byIcon(Icons.search), findsOneWidget);
    });
  });
}
