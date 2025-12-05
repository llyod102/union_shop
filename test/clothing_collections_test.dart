import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/clothing_collections.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Clothing Collections Page Tests', () {
    testWidgets('Clothing Collections page renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      expect(find.byType(ClothingCollections), findsOneWidget);
    });

    testWidgets('Displays "Collections" title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      expect(find.text('Collections'), findsOneWidget);
    });

    testWidgets('Displays all 4 product categories',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Verify all category cards are displayed
      expect(find.text('Hoodies'), findsOneWidget);
      expect(find.text('T-Shirts'), findsOneWidget);
      expect(find.text('Everyday Items'), findsOneWidget);
      expect(find.text('Merchandise'), findsOneWidget);
    });

    testWidgets('ProductCard widgets are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Should find 4 ProductCard widgets
      expect(find.byType(ProductCard), findsNWidgets(4));
    });

    testWidgets('Grid layout is used for product cards',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Verify GridView is used
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Hoodies card navigates to hoodies page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ClothingCollections(),
          routes: {
            '/hoodies': (context) => const Scaffold(body: Text('Hoodies Page')),
          },
        ),
      );

      // Find and tap the Hoodies card
      await tester.tap(find.text('Hoodies'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Hoodies Page'), findsOneWidget);
    });

    testWidgets('T-Shirts card navigates to tops page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ClothingCollections(),
          routes: {
            '/tops': (context) => const Scaffold(body: Text('Tops Page')),
          },
        ),
      );

      // Find and tap the T-Shirts card
      await tester.tap(find.text('T-Shirts'));
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Tops Page'), findsOneWidget);
    });

    testWidgets('Everyday Items card navigates to everyday items page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ClothingCollections(),
          routes: {
            '/everdayitems': (context) =>
                const Scaffold(body: Text('Everyday Items Page')),
          },
        ),
      );

      // Find and tap the Everyday Items card
      await tester.ensureVisible(find.text('Everyday Items'));
      await tester.tap(find.text('Everyday Items'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Everyday Items Page'), findsOneWidget);
    });

    testWidgets('Merchandise card navigates to merchandise page',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const ClothingCollections(),
          routes: {
            '/merchandise': (context) =>
                const Scaffold(body: Text('Merchandise Page')),
          },
        ),
      );

      // Find and tap the Merchandise card
      await tester.ensureVisible(find.text('Merchandise'));
      await tester.tap(find.text('Merchandise'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Verify navigation
      expect(find.text('Merchandise Page'), findsOneWidget);
    });

    testWidgets('Page is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Verify SingleChildScrollView exists
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('Collections title has correct styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Find the Collections text widget
      final titleFinder = find.text('Collections');
      expect(titleFinder, findsOneWidget);

      // Get the Text widget
      final titleWidget = tester.widget<Text>(titleFinder);

      // Verify styling
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.fontSize, 32);
    });

    testWidgets('All category cards have images', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // ProductCard uses Image.network, so check for images
      // There should be at least 4 images for the 4 categories
      expect(find.byType(Image), findsAtLeastNWidgets(4));
    });

    testWidgets('Product cards do not display prices',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // All ProductCards have empty price strings
      // So we shouldn't see price text like £
      expect(find.textContaining('£'), findsNothing);
    });

    testWidgets('Correct routes are set for each category',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Find all ProductCard widgets
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );

      // Convert to list and verify routes
      final cardsList = productCards.toList();
      expect(cardsList.length, 4);

      // Verify each card has the correct route
      expect(cardsList[0].route, '/hoodies');
      expect(cardsList[1].route, '/tops');
      expect(cardsList[2].route, '/everdayitems');
      expect(cardsList[3].route, '/merchandise');
    });

    testWidgets('All category titles are displayed correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Find all ProductCard widgets
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );

      // Convert to list and verify titles
      final cardsList = productCards.toList();

      expect(cardsList[0].title, 'Hoodies');
      expect(cardsList[1].title, 'T-Shirts');
      expect(cardsList[2].title, 'Everyday Items');
      expect(cardsList[3].title, 'Merchandise');
    });

    testWidgets('Grid uses appropriate column count',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ClothingCollections(),
        ),
      );

      // Find the GridView
      final gridView = tester.widget<GridView>(find.byType(GridView));

      // Verify it's a GridView.count
      expect(gridView.gridDelegate,
          isA<SliverGridDelegateWithFixedCrossAxisCount>());
    });
  });
}
