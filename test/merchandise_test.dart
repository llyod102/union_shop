import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Merchandise Page Tests', () {
    testWidgets('Page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();
      expect(find.text('Merchandise Collections'), findsOneWidget);
    });

    testWidgets('Title is displayed correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      final titleFinder = find.text('Merchandise Collections');
      expect(titleFinder, findsOneWidget);

      final titleWidget = tester.widget<Text>(titleFinder);
      expect(titleWidget.style?.fontSize, 32);
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
    });

    testWidgets('All products are displayed with prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Check for all products
      expect(find.text('Headphones'), findsOneWidget);
      expect(find.text('Post Card'), findsOneWidget);
      expect(find.text('Plushy'), findsOneWidget);
      expect(find.text('Toy'), findsOneWidget);

      // Check for prices
      expect(find.text('£40'), findsWidgets); // Headphones
      expect(find.text('£30'), findsOneWidget); // Post Card
      expect(find.text('£25'), findsOneWidget); // Plushy
      expect(find.text('£35'), findsOneWidget); // Toy
    });

    testWidgets('Correct number of ProductCard widgets are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Find all ProductCard widgets
      final cardsFinder = find.byType(Card);
      expect(cardsFinder, findsWidgets);
    });

    testWidgets('Products are displayed in GridView layout',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Check for GridView
      final gridViewFinder = find.byType(GridView);
      expect(gridViewFinder, findsOneWidget);
    });

    testWidgets('Products have images displayed', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Check for images in cards
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('Product cards have proper elevation styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Check for Card widgets with elevation
      final cardFinder = find.byType(Card);
      expect(cardFinder, findsWidgets);

      // Get first card and check it's a Card widget
      final firstCard = tester.widget<Card>(cardFinder.first);
      expect(firstCard.elevation, 2);
    });

    testWidgets('All products have Add to Cart buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Find all Add to Cart buttons
      final addToCartFinder = find.byType(ElevatedButton);
      expect(addToCartFinder, findsWidgets);
    });

    testWidgets('Product prices are displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Check all product prices
      expect(find.text('£40'), findsWidgets);
      expect(find.text('£30'), findsOneWidget);
      expect(find.text('£25'), findsOneWidget);
      expect(find.text('£35'), findsOneWidget);
    });

    testWidgets('Product cards are tappable', (WidgetTester tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Navigate to merchandise page
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Find and tap a product card
      final cardsFinder = find.byType(Card);
      expect(cardsFinder, findsWidgets);

      // Tap the first card
      await tester.tap(cardsFinder.first);
      await tester.pumpAndSettle();
    });
  });
}
