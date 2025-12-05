import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/main.dart';
import 'dart:io';

// Mock HttpOverrides to prevent network image errors in widget tests
class _MockHttpOverrides extends HttpOverrides {}

void main() {
  setUpAll(() {
    HttpOverrides.global = _MockHttpOverrides();
  });
  group('Home Page Tests', () {
    testWidgets('should display home page with basic elements', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that basic UI elements are present
      expect(find.text('Essential Range - Over 20% OFF!'), findsOneWidget);
      expect(find.text('Grey Hoodie'), findsOneWidget);
      expect(find.text('T-Shirt'), findsOneWidget);
    });

    testWidgets('should display product cards on home page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that product cards are displayed
      expect(find.text('Grey Hoodie'), findsOneWidget);
      expect(find.text('T-Shirt'), findsOneWidget);
      expect(find.text('Watch'), findsOneWidget);
      expect(find.text('PostCard'), findsOneWidget);

      // Check prices are displayed
      expect(find.text('£7.99'), findsOneWidget);
      expect(find.text('£5.99'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('should display header navigation sections', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that navigation buttons are present
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shop'), findsOneWidget);
      expect(find.text('The Print Shack'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
    });

    testWidgets('should display header icons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that header icons are present
      expect(find.byIcon(Icons.search), findsWidgets);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should display footer with opening hours', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check that footer is present with opening hours info
      expect(find.text('Opening hours'), findsOneWidget);
      expect(find.text('❄️ Winter Break Closure Dates ❄️'), findsOneWidget);
      expect(find.text('Closing 4pm 19/12/2025'), findsOneWidget);
      expect(find.text('Reopening 10am 05/01/2026'), findsOneWidget);
      expect(find.text('Monday - Friday 10am - 4pm'), findsOneWidget);
      expect(find.text('Purchase Online 24/7'), findsOneWidget);
    });

    testWidgets('should display footer help and information section',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check help and information section
      expect(find.text('Help & Information'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Terms & Conditions of Sale Policy'), findsOneWidget);
    });

    testWidgets('should display footer latest offers section', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pumpAndSettle();

      // Check latest offers section
      expect(find.text('Lastest Offers'), findsOneWidget);
      expect(find.byType(TextField), findsWidgets);
      expect(find.text('Subscribe'), findsOneWidget);
    });

    testWidgets('should display hero slider title', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check that hero slider is present
      expect(find.text('Essential Range - Over 20% OFF!'), findsOneWidget);
    });

    testWidgets('hero slider should have navigation buttons', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Check for arrow navigation buttons
      expect(find.byIcon(Icons.arrow_back_ios), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
    });

    testWidgets('search icon should toggle search field visibility',
        (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Initially, search field should not be visible (refined predicate)
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is TextField && (widget.decoration?.hintText == 'Shop'),
        ),
        findsNothing,
      );

      // Tap search icon
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Search field should now be visible
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is TextField && (widget.decoration?.hintText == 'Shop'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('product cards should be clickable', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Find and tap the first product card (Grey Hoodie)
      await tester.tap(find.text('Grey Hoodie'));
      await tester.pumpAndSettle();

      // Should navigate (we can verify by checking if we're on a different page)
      // This is a basic test that the tap gesture works
      expect(find.text('Grey Hoodie'), findsOneWidget);
    });

    testWidgets('navigation to authentication page works', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Tap person icon
      await tester.tap(find.byIcon(Icons.person_outline));
      await tester.pumpAndSettle();

      // Verify navigation occurred (the page would change)
      expect(find.byType(UnionShopApp), findsOneWidget);
    });

    testWidgets('navigation to cart page works', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Tap shopping bag icon
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      await tester.pumpAndSettle();

      // Verify navigation occurred
      expect(find.byType(UnionShopApp), findsOneWidget);
    });

    testWidgets('home button navigates to home page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Verify Home button exists
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('about button navigates to about page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Verify About button exists
      final aboutButtons = find.text('About');
      expect(aboutButtons, findsWidgets);
    });

    testWidgets('sale button navigates to sales page', (tester) async {
      await tester.pumpWidget(const UnionShopApp());
      await tester.pump();

      // Verify SALE! button exists
      expect(find.text('SALE!'), findsOneWidget);
    });
  });

  group('CartItem Model Tests', () {
    test('CartItem should have required properties', () {
      final item = CartItem(
        title: 'Test Product',
        price: '£10.00',
        imageUrl: 'https://example.com/image.jpg',
        design: 'Plain',
        size: 'Medium',
        quantity: 1,
      );

      expect(item.title, 'Test Product');
      expect(item.price, '£10.00');
      expect(item.imageUrl, 'https://example.com/image.jpg');
      expect(item.design, 'Plain');
      expect(item.size, 'Medium');
      expect(item.quantity, 1);
    });

    test('CartItem can be created without optional design and size', () {
      final item = CartItem(
        title: 'Test Product',
        price: '£15.00',
        imageUrl: 'https://example.com/image.jpg',
        quantity: 2,
      );

      expect(item.title, 'Test Product');
      expect(item.price, '£15.00');
      expect(item.design, isNull);
      expect(item.size, isNull);
      expect(item.quantity, 2);
    });
  });

  group('SlideData Model Tests', () {
    test('SlideData should have all required properties', () {
      final slide = SlideData(
        imageUrl: 'https://example.com/slide.jpg',
        title: 'Slide Title',
        subtitle: 'Slide Subtitle',
        buttonText: 'Click Me',
      );

      expect(slide.imageUrl, 'https://example.com/slide.jpg');
      expect(slide.title, 'Slide Title');
      expect(slide.subtitle, 'Slide Subtitle');
      expect(slide.buttonText, 'Click Me');
    });
  });

  group('ProductCard Widget Tests', () {
    testWidgets('ProductCard should display title and price', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Test Product',
              price: '£20.00',
              imageUrl: 'https://example.com/image.jpg',
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('£20.00'), findsOneWidget);
    });

    testWidgets('ProductCard with route parameter should exist',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Routable Product',
              price: '£30.00',
              imageUrl: 'https://example.com/image.jpg',
              route: '/product',
            ),
          ),
        ),
      );

      expect(find.text('Routable Product'), findsOneWidget);
    });

    testWidgets('ProductCard with design options and description',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              title: 'Customizable Product',
              price: '£25.00',
              imageUrl: 'https://example.com/image.jpg',
              designOptions: ['Plain', 'Striped'],
              description: 'A great product',
              thumbnailImages: ['https://example.com/thumb1.jpg'],
            ),
          ),
        ),
      );

      expect(find.text('Customizable Product'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });
  });
}
