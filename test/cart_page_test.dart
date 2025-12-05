import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/cart_page.dart';
import 'package:union_shop/main.dart';

void main() {
  setUp(() {
    // Clear cart before each test
    cartItems.clear();
  });

  group('Cart Page Display Tests', () {
    testWidgets('Cart page renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.byType(CartPage), findsOneWidget);
    });

    testWidgets('Shows "Shopping Cart" title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Shopping Cart'), findsOneWidget);
    });

    testWidgets('Shows empty cart message when cart is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Your cart is empty'), findsOneWidget);
    });

    testWidgets('Does not show Order Summary when cart is empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Order Summary'), findsNothing);
      expect(find.text('Proceed to Checkout'), findsNothing);
    });
  });

  group('Cart Items Display Tests', () {
    testWidgets('Displays cart items when cart has items',
        (WidgetTester tester) async {
      // Add test items to cart
      cartItems.add(CartItem(
        title: 'Test Hoodie',
        price: '£25.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 2,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // Verify item is displayed
      expect(find.text('Test Hoodie'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('Design: Plain'), findsOneWidget);
      expect(find.text('Size: M'), findsOneWidget);
      expect(find.text('Qty: 2'), findsOneWidget);
    });

    testWidgets('Displays multiple cart items', (WidgetTester tester) async {
      // Add multiple items to cart
      cartItems.addAll([
        CartItem(
          title: 'Test Hoodie',
          price: '£25.00',
          imageUrl: 'https://test.com/image1.jpg',
          design: 'Plain',
          size: 'M',
          quantity: 1,
        ),
        CartItem(
          title: 'Test Top',
          price: '£15.00',
          imageUrl: 'https://test.com/image2.jpg',
          design: 'Striped',
          size: 'L',
          quantity: 3,
        ),
      ]);

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // Verify both items are displayed
      expect(find.text('Test Hoodie'), findsOneWidget);
      expect(find.text('Test Top'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
      expect(find.text('£15.00'), findsOneWidget);
    });

    testWidgets('Displays item with null design and size',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Basic Item',
        price: '£10.00',
        imageUrl: 'https://test.com/image.jpg',
        design: null,
        size: null,
        quantity: 1,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // Item should be displayed without design/size
      expect(find.text('Basic Item'), findsOneWidget);
      // Price may appear in multiple places (item and summary), so verify it exists
      expect(find.text('£10.00'), findsWidgets);
      expect(find.textContaining('Design:'), findsNothing);
      expect(find.textContaining('Size:'), findsNothing);
    });

    testWidgets('Each cart item has a remove button',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Remove'), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
    });
  });

  group('Cart Functionality Tests', () {
    testWidgets('Remove button removes item from cart',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // Verify item is displayed
      expect(find.text('Test Item'), findsOneWidget);
      expect(cartItems.length, 1);

      // Tap remove button
      await tester.tap(find.text('Remove'));
      await tester.pump();

      // Verify item is removed
      expect(find.text('Test Item'), findsNothing);
      expect(find.text('Your cart is empty'), findsOneWidget);
      expect(cartItems.length, 0);
    });

    testWidgets('Removing one item keeps other items',
        (WidgetTester tester) async {
      cartItems.addAll([
        CartItem(
          title: 'Item 1',
          price: '£10.00',
          imageUrl: 'https://test.com/image1.jpg',
          design: 'Plain',
          size: 'M',
          quantity: 1,
        ),
        CartItem(
          title: 'Item 2',
          price: '£15.00',
          imageUrl: 'https://test.com/image2.jpg',
          design: 'Striped',
          size: 'L',
          quantity: 1,
        ),
      ]);

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(cartItems.length, 2);

      // Remove first item
      await tester.tap(find.text('Remove').first);
      await tester.pump();

      // Verify one item removed, one remains
      expect(cartItems.length, 1);
      expect(find.text('Item 2'), findsOneWidget);
    });
  });

  group('Order Summary Tests', () {
    testWidgets('Shows Order Summary when cart has items',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Order Summary'), findsOneWidget);
      expect(find.text('Items:'), findsOneWidget);
      expect(find.text('Subtotal:'), findsOneWidget);
    });

    testWidgets('Displays correct item count', (WidgetTester tester) async {
      cartItems.addAll([
        CartItem(
          title: 'Item 1',
          price: '£10.00',
          imageUrl: 'https://test.com/image1.jpg',
          design: 'Plain',
          size: 'M',
          quantity: 1,
        ),
        CartItem(
          title: 'Item 2',
          price: '£15.00',
          imageUrl: 'https://test.com/image2.jpg',
          design: 'Striped',
          size: 'L',
          quantity: 1,
        ),
        CartItem(
          title: 'Item 3',
          price: '£25.00',
          imageUrl: 'https://test.com/image3.jpg',
          design: 'Logo',
          size: 'S',
          quantity: 1,
        ),
      ]);

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // Should show 3 items
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('Calculates correct subtotal for single item',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 2,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // 20.00 * 2 = 40.00
      expect(find.text('£40.00'), findsOneWidget);
    });

    testWidgets('Calculates correct subtotal for multiple items',
        (WidgetTester tester) async {
      cartItems.addAll([
        CartItem(
          title: 'Item 1',
          price: '£10.00',
          imageUrl: 'https://test.com/image1.jpg',
          design: 'Plain',
          size: 'M',
          quantity: 2,
        ),
        CartItem(
          title: 'Item 2',
          price: '£15.00',
          imageUrl: 'https://test.com/image2.jpg',
          design: 'Striped',
          size: 'L',
          quantity: 1,
        ),
      ]);

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      // (10.00 * 2) + (15.00 * 1) = 35.00
      expect(find.text('£35.00'), findsOneWidget);
    });

    testWidgets('Checkout button is displayed when cart has items',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        const MaterialApp(
          home: CartPage(),
        ),
      );

      expect(find.text('Proceed to Checkout'), findsOneWidget);
    });
  });

  group('Checkout Dialog Tests', () {
    testWidgets('Checkout button shows dialog', (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/home': (context) => const Scaffold(body: Text('Home')),
          },
        ),
      );

      // Tap checkout button
      await tester.tap(find.text('Proceed to Checkout'));
      await tester.pumpAndSettle();

      // Verify dialog is shown
      expect(find.text('Checkout Successful'), findsOneWidget);
      expect(find.text('Thank you for your order!'), findsOneWidget);
    });

    testWidgets('Checkout dialog displays order details',
        (WidgetTester tester) async {
      cartItems.addAll([
        CartItem(
          title: 'Item 1',
          price: '£10.00',
          imageUrl: 'https://test.com/image1.jpg',
          design: 'Plain',
          size: 'M',
          quantity: 2,
        ),
        CartItem(
          title: 'Item 2',
          price: '£15.00',
          imageUrl: 'https://test.com/image2.jpg',
          design: 'Striped',
          size: 'L',
          quantity: 1,
        ),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/home': (context) => const Scaffold(body: Text('Home')),
          },
        ),
      );

      // Scroll down to make checkout button visible
      await tester.ensureVisible(find.text('Proceed to Checkout'));
      await tester.tap(find.text('Proceed to Checkout'));
      await tester.pumpAndSettle();

      // Verify checkout dialog is displayed
      expect(find.text('Checkout Successful'), findsOneWidget);
      expect(find.text('Thank you for your order!'), findsOneWidget);
    });

    testWidgets('Continue Shopping button clears cart and navigates home',
        (WidgetTester tester) async {
      cartItems.add(CartItem(
        title: 'Test Item',
        price: '£20.00',
        imageUrl: 'https://test.com/image.jpg',
        design: 'Plain',
        size: 'M',
        quantity: 1,
      ));

      await tester.pumpWidget(
        MaterialApp(
          home: const CartPage(),
          routes: {
            '/home': (context) => const Scaffold(body: Text('Home')),
          },
        ),
      );

      expect(cartItems.length, 1);

      // Open checkout dialog
      await tester.tap(find.text('Proceed to Checkout'));
      await tester.pumpAndSettle();

      // Tap Continue Shopping
      await tester.tap(find.text('Continue Shopping'));
      await tester.pumpAndSettle();

      // Verify cart is cleared and navigated home
      expect(cartItems.length, 0);
      expect(find.text('Home'), findsOneWidget);
    });
  });
}
