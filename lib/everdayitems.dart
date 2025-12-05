import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class Everdayitems extends StatefulWidget {
  const Everdayitems({super.key});

  @override
  State<Everdayitems> createState() => _EverdayitemsState();
}

class EverydayProduct {
  final String title;
  final String price;
  final String imageUrl;

  EverydayProduct(
      {required this.title, required this.price, required this.imageUrl});
}

class _EverdayitemsState extends State<Everdayitems> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String?
      _selectedSort; // 'featured', 'best-selling', 'alphabetically', 'price-high-low', 'price-low-high'

  final List<EverydayProduct> products = [
    EverydayProduct(
      title: 'Watch',
      price: '£40.00',
      imageUrl:
          'https://copilot.microsoft.com/th/id/BCO.a8d40398-6f22-43c0-b3df-43cdb0ed7c3f.png',
    ),
    EverydayProduct(
      title: 'Laptop',
      price: '£1000.00',
      imageUrl:
          'https://copilot.microsoft.com/th/id/BCO.12e8ae44-f76f-48ed-850a-3d45db08da85.png',
    ),
    EverydayProduct(
      title: 'Phone',
      price: '£500.00',
      imageUrl:
          'https://copilot.microsoft.com/th/id/BCO.f42b24c9-aed7-4c92-b6fe-a63ea4fc4eec.png',
    ),
    EverydayProduct(
      title: 'Headphone',
      price: '£100.00',
      imageUrl:
          'https://copilot.microsoft.com/th/id/BCO.d1e0fec4-9bfc-4f12-b3fa-3e9bcf9ced5b.png',
    ),
  ];

  List<EverydayProduct> get sortedProducts {
    List<EverydayProduct> result = List.from(products);

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
                            ],
                          ),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Everyday items Collection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
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
                  dropdownItems: ["Colour", "Price", "Popularity"],
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
                return ProductCard(
                  title: product.title,
                  price: product.price,
                  imageUrl: product.imageUrl,
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
