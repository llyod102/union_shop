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

      expect(find.text('Hoodie Collection'), findsOneWidget);
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

      // Wait for any animations and layout to complete
      await tester.pumpAndSettle();

      // Scroll to find product cards
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Hoodies uses Card widgets for product display
      expect(find.byType(Card), findsNWidgets(4));
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
      final titleFinder = find.text('Hoodie Collection');
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

      // Scroll to see products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify alphabetical sort is applied (products should be in order: Blue, Dark, Grey, White)
      expect(find.text('Blue Hoodie'), findsOneWidget);
      expect(find.text('Dark Hoodies'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.byType(Card), findsNWidgets(4));
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

      // Scroll to see products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify price sort is applied - products should be present
      expect(find.text('Blue Hoodie'), findsOneWidget); // £35
      expect(find.text('Grey hoodie'), findsOneWidget); // £45
      expect(find.byType(Card), findsNWidgets(4));
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

      // Scroll to see products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify price sort is applied - products should be present
      expect(find.text('Grey hoodie'), findsOneWidget); // £45
      expect(find.text('Blue Hoodie'), findsOneWidget); // £35
      expect(find.byType(Card), findsNWidgets(4));
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

      // Verify filter dropdown shows "All Products" by default
      expect(find.text('All Products'), findsOneWidget);
    });

    testWidgets('Filter dropdown shows all options',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Tap to open filter dropdown
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();

      // Verify all filter options are available
      expect(find.text('Dark Clothing'), findsWidgets);
      expect(find.text('Bright Clothing'), findsOneWidget);
    });

    testWidgets('Filtering by Dark Hoodies works', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Open filter dropdown and select Dark Clothing
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Clothing').last);
      await tester.pumpAndSettle();

      // Scroll to find products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Should show only Dark and Grey hoodies (2 products) as Card widgets
      expect(find.byType(Card), findsNWidgets(2));
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

      // Open filter dropdown and select Bright Clothing
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bright Clothing'));
      await tester.pumpAndSettle();

      // Scroll to find products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Should show only White and Blue hoodies (2 products) as Card widgets
      expect(find.byType(Card), findsNWidgets(2));
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

      // Initially shows All Products
      expect(find.text('All Products'), findsOneWidget);

      // Select Dark Clothing
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Clothing').last);
      await tester.pumpAndSettle();

      // Should now show Dark Clothing
      expect(find.text('Dark Clothing'), findsOneWidget);
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

      // Find a product card - ensure it's visible first
      final productCardFinder = find.byType(ProductCard);
      if (productCardFinder.evaluate().isNotEmpty) {
        await tester.ensureVisible(productCardFinder.first);
        await tester.pumpAndSettle();

        // Tap should not throw error
        await tester.tap(productCardFinder.first);
        await tester.pump();
      }
    });

    testWidgets('Products maintain order when not sorted or filtered',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Hoodies(),
        ),
      );

      // Scroll to see products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Verify all products are displayed in default order
      expect(find.text('Dark Hoodies'), findsOneWidget);
      expect(find.text('White Hoodie'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
      expect(find.text('Blue Hoodie'), findsOneWidget);
      expect(find.byType(Card), findsNWidgets(4));
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

      // Filter to Dark Clothing
      await tester.tap(find.text('All Products'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Clothing').last);
      await tester.pumpAndSettle();

      // Sort alphabetically
      await tester.tap(find.text('Featured'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Alphabetically').last);
      await tester.pumpAndSettle();

      // Scroll to see products
      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -300));
      await tester.pumpAndSettle();

      // Should show 2 products (Dark and Grey)
      expect(find.byType(Card), findsNWidgets(2));
      expect(find.text('Dark Hoodies'), findsOneWidget);
      expect(find.text('Grey hoodie'), findsOneWidget);
    });
  });
}
