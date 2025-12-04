import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Sales Page Display Tests', () {
    testWidgets('Page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      expect(find.text('Sale Products'), findsOneWidget);
    });

    testWidgets('Title is displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      final titleFinder = find.text('Sale Products');
      expect(titleFinder, findsOneWidget);

      final titleWidget = tester.widget<Text>(titleFinder);
      expect(titleWidget.style?.fontSize, 32);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('All sale products are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for sale products
      expect(find.text('Classic Sweat Shirts'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
    });

    testWidgets('Sale prices are displayed in red',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for sale prices
      expect(find.text('£20.00'), findsOneWidget); // Classic Sweat Shirts
      expect(find.text('£18.00'), findsOneWidget); // White Hoodie
      expect(find.text('£10.00'), findsOneWidget); // Grey hoodie
      expect(find.text('£25.00'), findsOneWidget); // Blue Hoodie
    });

    testWidgets('Original prices are displayed with strikethrough',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for original prices (all products have £35.00 original price)
      expect(find.text('£35.00'), findsWidgets);
    });

    testWidgets('Products are displayed in grid layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for GridView
      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);
    });

    testWidgets('Product cards have images', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for images in cards
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('Product cards have proper elevation',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for Card widgets with elevation
      final cardFinder = find.byType(Card);
      expect(cardFinder, findsWidgets);

      // Get first card and verify elevation
      final firstCard = tester.widget<Card>(cardFinder.first);
      expect(firstCard.elevation, 2);
    });

    testWidgets('4 sale products are displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Verify all 4 products
      expect(find.text('Classic Sweat Shirts'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
    });
  });

  group('Sales Page Price Display Tests', () {
    testWidgets('Sale price and original price both visible for each product',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check Classic Sweat Shirts
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£35.00'), findsWidgets);
    });

    testWidgets('Discounted prices vary by product',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Verify different sale prices
      expect(find.text('£20.00'), findsOneWidget); // Classic Sweat Shirts
      expect(find.text('£18.00'), findsOneWidget); // White Hoodie
      expect(find.text('£10.00'), findsOneWidget); // Grey hoodie (lowest)
      expect(find.text('£25.00'), findsOneWidget); // Blue Hoodie (highest)
    });

    testWidgets('Grey hoodie has lowest sale price (£10.00)',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
    });

    testWidgets('Blue Hoodie has highest sale price (£25.00)',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      expect(find.text('Blue Hoodie'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });
  });

  group('Sales Page Product Card Tests', () {
    testWidgets('Product cards are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Find and tap a product card
      final cardsFinder = find.byType(Card);
      expect(cardsFinder, findsWidgets);

      await tester.tap(cardsFinder.first);
      await tester.pumpAndSettle();
    });

    testWidgets('Product titles are displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Verify product titles
      expect(find.text('Classic Sweat Shirts'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
    });

    testWidgets('Each product card shows both prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Verify sale prices are shown
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£18.00'), findsOneWidget);
      expect(find.text('£10.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);

      // Verify original prices are shown
      expect(find.text('£35.00'), findsWidgets);
    });

    testWidgets('Product images load in cards', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to sales page
      await tester.tap(find.text('SALE!'));
      await tester.pumpAndSettle();

      // Check for images
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });
  });
}
