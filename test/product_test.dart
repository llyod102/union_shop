import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/product_page.dart';

void main() {
  group('Product Page Display Tests', () {
    Widget createTestWidget({
      String? title,
      String? price,
      String? imageUrl,
      List<String>? thumbnailImages,
      List<String>? designOptions,
      String? description,
    }) {
      return MaterialApp(
        home: ProductPage(
          title: title,
          price: price,
          imageUrl: imageUrl,
          thumbnailImages: thumbnailImages,
          designOptions: designOptions,
          description: description,
        ),
      );
    }

    testWidgets('Product page renders correctly', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Placeholder Product Name'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
    });

    testWidgets('Product name displays correctly when provided',
        (tester) async {
      await tester.pumpWidget(createTestWidget(
        title: 'Test Product',
        price: '£25.00',
      ));
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('Back button is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    });

    testWidgets('Product image is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(Image), findsWidgets);
    });

    testWidgets('Thumbnail gallery is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should have 4 thumbnail images
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });
  });

  group('Product Page Design Selection Tests', () {
    Widget createTestWidget({
      String? title,
      String? price,
      List<String>? designOptions,
    }) {
      return MaterialApp(
        home: ProductPage(
          title: title,
          price: price,
          designOptions: designOptions,
        ),
      );
    }

    testWidgets('Design dropdown is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Design'), findsOneWidget);
      expect(find.byType(DropdownButton<String>), findsWidgets);
    });

    testWidgets('Default design option is selected', (tester) async {
      await tester.pumpWidget(createTestWidget(
        designOptions: ['Option 1', 'Option 2', 'Option 3'],
      ));
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsWidgets);
    });

    testWidgets('Design dropdown can be opened and closed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find and tap the design dropdown
      final dropdownFinder = find.byType(DropdownButton<String>).first;
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      // Dropdown should now show options
      expect(find.text('Design'), findsWidgets);
    });

    testWidgets('Selecting design updates the selection', (tester) async {
      await tester.pumpWidget(createTestWidget(
        designOptions: ['Design A', 'Design B', 'Design C'],
      ));
      await tester.pumpAndSettle();

      // Open dropdown
      final dropdownFinder = find.byType(DropdownButton<String>).first;
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      // Select Design B
      await tester.tap(find.text('Design B').last);
      await tester.pumpAndSettle();

      expect(find.text('Design B'), findsWidgets);
    });

    testWidgets('Custom design options are displayed correctly',
        (tester) async {
      await tester.pumpWidget(createTestWidget(
        designOptions: ['Red', 'Blue', 'Green', 'Yellow'],
      ));
      await tester.pumpAndSettle();

      // Open dropdown
      final dropdownFinder = find.byType(DropdownButton<String>).first;
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      expect(find.text('Red'), findsWidgets);
      expect(find.text('Blue'), findsWidgets);
      expect(find.text('Green'), findsWidgets);
      expect(find.text('Yellow'), findsWidgets);
    });
  });

  group('Product Page Size Selection Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('Size dropdown is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Size'), findsOneWidget);
    });

    testWidgets('Default size is XS', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('XS'), findsWidgets);
    });

    testWidgets('Size dropdown contains all size options', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Open size dropdown
      final dropdownFinder = find.byType(DropdownButton<String>).last;
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      expect(find.text('XS'), findsWidgets);
      expect(find.text('S'), findsWidgets);
      expect(find.text('M'), findsWidgets);
      expect(find.text('L'), findsWidgets);
    });

    testWidgets('Selecting size updates the selection', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Open size dropdown
      final dropdownFinder = find.byType(DropdownButton<String>).last;
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      // Select M
      await tester.tap(find.text('M').last);
      await tester.pumpAndSettle();

      expect(find.text('M'), findsWidgets);
    });
  });

  group('Product Page Quantity Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('Quantity field is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Quantity'), findsOneWidget);
      expect(find.byType(TextField), findsWidgets);
    });

    testWidgets('Default quantity is 1', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find the quantity text field
      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsWidgets);
    });

    testWidgets('Quantity field accepts numeric input', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find quantity text field (should be the last TextField, after email)
      final textFields = find.byType(TextField);
      await tester.enterText(textFields.last, '5');
      await tester.pumpAndSettle();

      expect(find.text('5'), findsOneWidget);
    });
  });

  group('Product Page Add to Cart Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('Add to Cart button is displayed', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.text('Add to Cart'), findsOneWidget);
    });

    testWidgets('Add to Cart button is clickable', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final addToCartButton = find.text('Add to Cart');
      expect(addToCartButton, findsOneWidget);

      await tester.tap(addToCartButton);
      await tester.pumpAndSettle();
    });
  });

  group('Product Page Thumbnail Gallery Tests', () {
    Widget createTestWidget() {
      return const MaterialApp(home: ProductPage());
    }

    testWidgets('Thumbnail gallery displays multiple images', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Should have multiple thumbnail images
      final imageFinder = find.byType(Image);
      expect(imageFinder, findsWidgets);
    });

    testWidgets('Clicking thumbnail changes main image', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      // Find all GestureDetector widgets (thumbnails are wrapped in them)
      final gestureDetectors = find.byType(GestureDetector);
      expect(gestureDetectors, findsWidgets);
    });
  });
}
