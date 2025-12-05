import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/product_page.dart';

class SaleProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final List<String> thumbnailImages;
  final List<String> designOptions;
  final String description;

  const SaleProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.thumbnailImages,
    required this.designOptions,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              title: title,
              price: price,
              imageUrl: imageUrl,
              thumbnailImages: thumbnailImages,
              designOptions: designOptions,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child:
                          Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        originalPrice,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class SaleProduct {
  final String title;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final List<String>? thumbnailImages;
  final List<String>? designOptions;
  final String? description;

  SaleProduct({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    this.thumbnailImages,
    this.designOptions,
    this.description,
  });
}

class _SalesState extends State<Sales> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String?
      _selectedSort; // 'featured', 'best-selling', 'alphabetically', 'price-high-low', 'price-low-high'

  final List<SaleProduct> products = [
    SaleProduct(
      title: 'Classic Sweat Shirts',
      price: '£20.00',
      originalPrice: '£35.00',
      imageUrl:
          'https://s.alicdn.com/@sc04/kf/U4bb4ddac6e314a1a98bfde968cecd69fh/No-Brand-Name-Clothes-Men-Hoodies-Sweater-Hoodie-Sweat-shirt-Unique-Unbranded-Comfy-Cozy-Hoodies-Sweat-Shirt-for-Men.jpg_300x300.jpg',
      thumbnailImages: [
        'https://s.alicdn.com/@sc04/kf/U4bb4ddac6e314a1a98bfde968cecd69fh/No-Brand-Name-Clothes-Men-Hoodies-Sweater-Hoodie-Sweat-shirt-Unique-Unbranded-Comfy-Cozy-Hoodies-Sweat-Shirt-for-Men.jpg_300x300.jpg',
        'https://www.ariashop.co.uk/cdn/shop/files/white.jpg?v=1692631506&width=800',
        'https://ml.thcdn.com/images/v2/productimg/original/14314656-2445257485007254.jpg?width=924&height=1294',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvexA5LiaB1LtMrPJi1tow24yFBheErqzrGA&s',
      ],
      designOptions: ['Grey', 'White', 'Black', 'Yellow'],
      description:
          'Comfortable dark hoodie perfect for any occasion. Made from high-quality materials for ultimate comfort and durability.',
    ),
    SaleProduct(
      title: 'White Hoodie',
      price: '£18.00',
      originalPrice: '£35.00',
      imageUrl:
          'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
      thumbnailImages: [
        'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
      ],
    ),
    SaleProduct(
      title: 'Grey hoodie',
      price: '£10.00',
      originalPrice: '£35.00',
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
      thumbnailImages: [
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
      ],
    ),
    SaleProduct(
      title: 'Blue Hoodie',
      price: '£25.00',
      originalPrice: '£35.00',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
      thumbnailImages: [
        'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
      ],
    ),
  ];

  List<SaleProduct> get sortedProducts {
    List<SaleProduct> result = List.from(products);

    if (_selectedSort == 'best-selling') {
      return result;
    } else if (_selectedSort == 'alphabetically') {
      result.sort((a, b) => a.title.compareTo(b.title));
    } else if (_selectedSort == 'price-high-low') {
      result.sort((a, b) {
        double priceA = double.parse(a.price.replaceAll('£', ''));
        double priceB = double.parse(b.price.replaceAll('£', ''));
        return priceB.compareTo(priceA);
      });
    } else if (_selectedSort == 'price-low-high') {
      result.sort((a, b) {
        double priceA = double.parse(a.price.replaceAll('£', ''));
        double priceB = double.parse(b.price.replaceAll('£', ''));
        return priceA.compareTo(priceB);
      });
    }

    return result;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              color: Colors.white,
              child: Column(
                children: [
                  // Top banner
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: const Color(0xFF4d2963),
                    child: const Text(
                      'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  // Main header
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {
                            navigateToHome(context);
                          },
                          child: Image.network(
                            'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                            height: 18,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                width: 18,
                                height: 18,
                                child: const Center(
                                  child: Icon(Icons.image_not_supported,
                                      color: Colors.grey),
                                ),
                              );
                            },
                          ),
                        ),
                        if (!_isSearching) ...[
                          const HomeButtonSections(
                            section: "Home",
                          ),
                          const HomeButtonSections(
                              section: "Shop",
                              dropdownItems: [
                                "Clothing Collection",
                              ]),
                          const HomeButtonSections(
                            section: "The Print Shack",
                            dropdownItems: ["Personalization"],
                          ),
                          const HomeButtonSections(
                            section: "SALE!",
                          ),
                          const HomeButtonSections(
                            section: "About",
                          ),
                        ],
                        const Spacer(),
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 600),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_isSearching) ...[
                                SizedBox(
                                  width: 180,
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: const InputDecoration(
                                      hintText: 'Search...',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.0,
                                      )),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                    ),
                                  ),
                                ),
                              ],
                              IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isSearching = !_isSearching;
                                      if (!_isSearching) {
                                        _searchController.clear();
                                      }
                                    });
                                  }),
                              IconButton(
                                icon: const Icon(
                                  Icons.person_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/authentication');
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/cart');
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                padding: const EdgeInsets.all(8),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: placeholderCallbackForButtons,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            // Sale section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              color: Colors.white,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SALE',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Don\'t miss out! Get yours before they\'re all gone!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'All prices shown are inclusive of the discount 🛒',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                HomeButtonSections(
                  section: 'Filter',
                  disabled: true,
                ),
                HomeButtonSections(
                  section: 'All Products',
                  dropdownItems: ["Clothing", "Merchandise", "Popularity"],
                  disabled: true,
                ),
                HomeButtonSections(
                  section: 'Sort By',
                  disabled: true,
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      _selectedSort = value;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          _selectedSort == null
                              ? 'Featured'
                              : _selectedSort == 'best-selling'
                                  ? 'Best Selling'
                                  : _selectedSort == 'alphabetically'
                                      ? 'Alphabetically'
                                      : _selectedSort == 'price-high-low'
                                          ? 'Price High to Low'
                                          : 'Price Low to High',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Icon(Icons.arrow_drop_down, size: 20),
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'best-selling',
                      child: Text('Best Selling'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'alphabetically',
                      child: Text('Alphabetically'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'price-high-low',
                      child: Text('Price High to Low'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'price-low-high',
                      child: Text('Price Low to High'),
                    ),
                  ],
                ),
              ]),
            ),
            const SizedBox(height: 48),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 24,
                mainAxisSpacing: 48,
                childAspectRatio: 0.7,
              ),
              itemCount: sortedProducts.length,
              itemBuilder: (context, index) {
                final product = sortedProducts[index];
                return SaleProductCard(
                  title: product.title,
                  price: product.price,
                  originalPrice: product.originalPrice,
                  imageUrl: product.imageUrl,
                  thumbnailImages: product.thumbnailImages ?? [],
                  designOptions: product.designOptions ?? [],
                  description: product.description ?? '',
                );
              },
            ),

            Container(
              width: double.infinity,
              color: const Color.fromARGB(29, 250, 250, 250),
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Opening hours',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '❄️ Winter Break Closure Dates ❄️',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Closing 4pm 19/12/2025',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Reopening 10am 05/01/2026',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '----------------------------',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '(Term Time)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Monday - Friday 10am - 4pm',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '(Outside of Term Time/ Consolidation weeks)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Monday - Friday 10am - 3pm',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Purchase Online 24/7',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Help & Information',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white)),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white)),
                          child: const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Terms & Conditions of Sale Policy',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Lastest Offers',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                  hintText: "Enter your email",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8)),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('Subscribe'))
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
