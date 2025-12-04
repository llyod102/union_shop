import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/hoodies.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Hoodies Page Tests', () {
    testWidgets('Hoodies page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      expect(find.byType(Hoodies), findsOneWidget);
    });

    testWidgets('Displays "Hoodies" title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      expect(find.text('Hoodies'), findsOneWidget);
    });

    testWidgets('Displays all 4 hoodie products', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify all products are displayed
      expect(find.text('Dark Hoodies'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
    });

    testWidgets('Displays product prices', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify prices are displayed
      expect(find.text('£40.00'), findsNWidgets(2)); // Dark and White
      expect(find.text('£45.00'), findsOneWidget); // Grey
      expect(find.text('£35.00'), findsOneWidget); // Blue
    });

    testWidgets('ProductCard widgets are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Should find 4 ProductCard widgets
      expect(find.byType(ProductCard), findsNWidgets(4));
    });

    testWidgets('Grid layout is used for products',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify GridView.builder is used
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Page is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify SingleChildScrollView exists
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('Title has correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Find the title text widget
      final titleFinder = find.text('Hoodies');
      expect(titleFinder, findsOneWidget);

      // Get the Text widget
      final titleWidget = tester.widget<Text>(titleFinder);

      // Verify styling
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.fontSize, 32);
    });
  });

  group('Hoodies Sort Functionality Tests', () {
    testWidgets('Sort dropdown is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify sort dropdown shows "Featured" by default
      expect(find.text('Featured'), findsOneWidget);
    });

    testWidgets('Sort dropdown shows all options', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Tap to open dropdown
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();

      // Verify all sort options are available
      expect(find.text('Best Selling'), findsOneWidget);
      expect(find.text('Alphabetically'), findsOneWidget);
      expect(find.text('Price High to Low'), findsOneWidget);
      expect(find.text('Price Low to High'), findsOneWidget);
    });

    testWidgets('Sorting alphabetically works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open dropdown and select Alphabetically
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Alphabetically').last);
      await tester.pumpAndSettle();

      // Get all product titles
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      // Verify alphabetical order: Blue, Dark, Grey, White
      expect(titles[0], 'Blue Hoodie');
      expect(titles[1], 'Dark Hoodies');
      expect(titles[2], 'Grey hoodie');
      expect(titles[3], 'White Hoodie');
    });

    testWidgets('Sorting by price low to high works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open dropdown and select Price Low to High
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Price Low to High'));
      await tester.pumpAndSettle();

      // Get all product titles
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      // Verify price order: Blue (£35), Dark/White (£40), Grey (£45)
      expect(titles[0], 'Blue Hoodie');
      expect(titles[3], 'Grey hoodie');
    });

    testWidgets('Sorting by price high to low works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open dropdown and select Price High to Low
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Price High to Low'));
      await tester.pumpAndSettle();

      // Get all product titles
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      // Verify price order: Grey (£45), Dark/White (£40), Blue (£35)
      expect(titles[0], 'Grey hoodie');
      expect(titles[3], 'Blue Hoodie');
    });

    testWidgets('Sort dropdown updates selected text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Initially shows Featured
      expect(find.text('Featured'), findsOneWidget);

      // Select Alphabetically
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Alphabetically').last);
      await tester.pumpAndSettle();

      // Should now show Alphabetically
      expect(find.text('Alphabetically'), findsOneWidget);
    });
  });

  group('Hoodies Filter Functionality Tests', () {
    testWidgets('Filter dropdown is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Verify filter dropdown shows "All Hoodies" by default
      expect(find.text('All Hoodies'), findsOneWidget);
    });

    testWidgets('Filter dropdown shows all options',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Tap to open filter dropdown
      await tester.tap(find.text('All Hoodies'));
      await tester.pumpAndSettle();

      // Verify all filter options are available
      expect(find.text('Dark Hoodies'), findsWidgets);
      expect(find.text('Bright Hoodies'), findsOneWidget);
    });

    testWidgets('Filtering by Dark Hoodies works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open filter dropdown and select Dark Hoodies
      await tester.tap(find.text('All Hoodies'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Hoodies').last);
      await tester.pumpAndSettle();

      // Should show only Dark and Grey hoodies (2 products)
      expect(find.byType(ProductCard), findsNWidgets(2));
      expect(find.text('Dark Hoodies'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
    });

    testWidgets('Filtering by Bright Hoodies works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open filter dropdown and select Bright Hoodies
      await tester.tap(find.text('All Hoodies'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bright Hoodies'));
      await tester.pumpAndSettle();

      // Should show only White and Blue hoodies (2 products)
      expect(find.byType(ProductCard), findsNWidgets(2));
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
    });

    testWidgets('Filter dropdown updates selected text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Initially shows All Hoodies
      expect(find.text('All Hoodies'), findsOneWidget);

      // Select Dark Hoodies
      await tester.tap(find.text('All Hoodies'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Hoodies').last);
      await tester.pumpAndSettle();

      // Should now show Dark Hoodies
      expect(find.text('Dark Hoodies'), findsOneWidget);
    });
  });

  group('Hoodies Product Display Tests', () {
    testWidgets('All products have prices displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Count how many prices are shown (4 products)
      final priceMatches = find.textContaining('£');
      expect(priceMatches, findsNWidgets(4));
    });

    testWidgets('Product cards are clickable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Hoodies(),
          routes: {
            '/product': (context) => const Scaffold(body: Text('Product Page')),
          },
        ),
      );

      // Find a product card
      final productCard = find.byType(ProductCard).first;
      expect(productCard, findsOneWidget);

      // Tap should not throw error
      await tester.tap(productCard);
      await tester.pump();
    });

    testWidgets('Products maintain order when not sorted or filtered',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Get all product titles
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      // Default order: Dark, White, Grey, Blue
      expect(titles[0], 'Dark Hoodies');
      expect(titles[1], 'White Hoodie');
      expect(titles[2], 'Grey hoodie');
      expect(titles[3], 'Blue Hoodie');
    });

    testWidgets('All product images are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // ProductCard uses Image.network, so check for images
      // Should find at least 4 images for the products
      expect(find.byType(Image), findsAtLeastNWidgets(4));
    });
  });

  group('Hoodies Combined Filter and Sort Tests', () {
    testWidgets('Can filter and sort at the same time',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Filter to Dark Hoodies
      await tester.tap(find.text('All Hoodies'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Hoodies').last);
      await tester.pumpAndSettle();

      // Sort alphabetically
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Alphabetically').last);
      await tester.pumpAndSettle();

      // Should show 2 products in alphabetical order
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      expect(titles.length, 2);
      expect(titles[0], 'Dark Hoodies');
      expect(titles[1], 'Grey hoodie');
    });
  });
}
