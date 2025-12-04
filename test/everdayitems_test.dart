import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/everdayitems.dart';
import 'package:union_shop/main.dart';

void main() {
  group('Everyday Items Page Tests', () {
    testWidgets('Everyday Items page renders correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      expect(find.byType(Everdayitems), findsOneWidget);
    });

    testWidgets('Displays "Everyday items Collection" title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      expect(find.text('Everyday items Collection'), findsOneWidget);
    });

    testWidgets('Displays all 4 products', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Verify all products are displayed
      expect(find.text('Watch'), findsOneWidget);
      expect(find.text('Laptop'), findsOneWidget);
      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('Headphone'), findsOneWidget);
    });

    testWidgets('Displays product prices', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Verify prices are displayed
      expect(find.text('£40.00'), findsOneWidget);
      expect(find.text('£1000.00'), findsOneWidget);
      expect(find.text('£500.00'), findsOneWidget);
      expect(find.text('£100.00'), findsOneWidget);
    });

    testWidgets('ProductCard widgets are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Should find 4 ProductCard widgets
      expect(find.byType(ProductCard), findsNWidgets(4));
    });

    testWidgets('Grid layout is used for products',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Verify GridView.builder is used
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Page is scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Verify SingleChildScrollView exists
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('Title has correct styling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Find the title text widget
      final titleFinder = find.text('Everyday items Collection');
      expect(titleFinder, findsOneWidget);

      // Get the Text widget
      final titleWidget = tester.widget<Text>(titleFinder);

      // Verify styling
      expect(titleWidget.style?.fontWeight, FontWeight.bold);
      expect(titleWidget.style?.fontSize, 32);
    });
  });

  group('Everyday Items Sort Functionality Tests', () {
    testWidgets('Sort dropdown is displayed', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Verify sort dropdown shows "Featured" by default
      expect(find.text('Featured'), findsOneWidget);
    });

    testWidgets('Sort dropdown shows all options', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
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
          home: Everdayitems(),
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

      // Verify alphabetical order: Headphone, Laptop, Phone, Watch
      expect(titles[0], 'Headphone');
      expect(titles[1], 'Laptop');
      expect(titles[2], 'Phone');
      expect(titles[3], 'Watch');
    });

    testWidgets('Sorting by price low to high works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
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

      // Verify price order: Watch (£40), Headphone (£100), Phone (£500), Laptop (£1000)
      expect(titles[0], 'Watch');
      expect(titles[1], 'Headphone');
      expect(titles[2], 'Phone');
      expect(titles[3], 'Laptop');
    });

    testWidgets('Sorting by price high to low works',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
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

      // Verify price order: Laptop (£1000), Phone (£500), Headphone (£100), Watch (£40)
      expect(titles[0], 'Laptop');
      expect(titles[1], 'Phone');
      expect(titles[2], 'Headphone');
      expect(titles[3], 'Watch');
    });

    testWidgets('Sort dropdown updates selected text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
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

  group('Everyday Items Product Display Tests', () {
    testWidgets('All products have prices displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Count how many prices are shown
      final priceMatches = find.textContaining('£');
      expect(priceMatches, findsNWidgets(4));
    });

    testWidgets('Product cards are clickable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Everdayitems(),
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

    testWidgets('Products maintain order when not sorted',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // Get all product titles
      final productCards = tester.widgetList<ProductCard>(
        find.byType(ProductCard),
      );
      final titles = productCards.map((card) => card.title).toList();

      // Default order: Watch, Laptop, Phone, Headphone
      expect(titles[0], 'Watch');
      expect(titles[1], 'Laptop');
      expect(titles[2], 'Phone');
      expect(titles[3], 'Headphone');
    });

    testWidgets('All product images are displayed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Everdayitems(),
        ),
      );

      // ProductCard uses Image.network, so check for images
      // Should find at least 4 images for the products
      expect(find.byType(Image), findsAtLeastNWidgets(4));
    });
  });
}
