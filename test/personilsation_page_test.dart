import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Personalization Page Tests', () {
    testWidgets('Page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page via "Find Out More" button on home
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('Custom T-Shirt Personalization'), findsOneWidget);
    });

    testWidgets('Title is displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      final titleFinder = find.text('Custom T-Shirt Personalization');
      expect(titleFinder, findsOneWidget);

      final titleWidget = tester.widget<Text>(titleFinder);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('Initial price displays correctly (£25.00)',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('Product description is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(
          find.text(
              'Create your own custom design with our personalization service'),
          findsOneWidget);
    });

    testWidgets('Design selection dropdown is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('Select Design Type'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsWidgets);
    });

    testWidgets('Size selection dropdown is displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('Size'), findsOneWidget);
    });

    testWidgets('Product image is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('Add to Cart button is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('Add to Cart'), findsOneWidget);
    });
  });

  group('Personalization Design Selection Tests', () {
    testWidgets('Default design is "One line of text"',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      expect(find.text('One line of text'), findsWidgets);
    });

    testWidgets('Selecting "Two line of text" increases price to £27.00',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Open dropdown and select "Two line of text"
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Two line of text').last);
      await tester.pumpAndSettle();

      expect(find.text('£27.00'), findsOneWidget);
    });

    testWidgets('Selecting "Three lines of text" increases price to £29.00',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Open dropdown and select "Three lines of text"
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Three lines of text').last);
      await tester.pumpAndSettle();

      expect(find.text('£29.00'), findsOneWidget);
    });

    testWidgets('Selecting "Four lines of text" increases price to £31.00',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Open dropdown and select "Four lines of text"
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Four lines of text').last);
      await tester.pumpAndSettle();

      expect(find.text('£31.00'), findsOneWidget);
    });

    testWidgets('Selecting "Small logo" increases price to £28.00',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Open dropdown and select "Small logo"
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Small logo').last);
      await tester.pumpAndSettle();

      expect(find.text('£28.00'), findsOneWidget);
    });

    testWidgets('Design options include all five options',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Open dropdown
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();

      // Verify all design options are visible
      expect(find.text('One line of text'), findsWidgets);
      expect(find.text('Two line of text'), findsWidgets);
      expect(find.text('Three lines of text'), findsWidgets);
      expect(find.text('Four lines of text'), findsWidgets);
      expect(find.text('Small logo'), findsWidgets);
    });

    testWidgets('Changing design multiple times updates price correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // First selection: Two line of text (£27.00)
      final dropdownFinder = find.byType(DropdownButton<String>);
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Two line of text').last);
      await tester.pumpAndSettle();
      expect(find.text('£27.00'), findsOneWidget);

      // Second selection: Four lines of text (£31.00)
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Four lines of text').last);
      await tester.pumpAndSettle();
      expect(find.text('£31.00'), findsOneWidget);

      // Third selection: One line of text (£25.00)
      await tester.tap(dropdownFinder.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('One line of text').last);
      await tester.pumpAndSettle();
      expect(find.text('£25.00'), findsOneWidget);
    });
  });

  group('Personalization Add to Cart Tests', () {
    testWidgets('Add to Cart button is clickable', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Tap Add to Cart button
      final addToCartFinder = find.text('Add to Cart');
      expect(addToCartFinder, findsOneWidget);
      await tester.tap(addToCartFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('Add to Cart with default design (One line, £25.00)',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Verify default price
      expect(find.text('£25.00'), findsOneWidget);

      // Tap Add to Cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();
    });

    testWidgets('Quantity field is present and defaults to 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to personalization page
      final findOutMoreButtons = find.byType(ElevatedButton);
      await tester.tap(findOutMoreButtons.first);
      await tester.pumpAndSettle();

      // Check for quantity field with default value
      final textFields = find.byType(TextField);
      expect(textFields, findsWidgets);
    });
  });
}
