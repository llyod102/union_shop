import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class Hoodies extends StatefulWidget {
  const Hoodies({super.key});

  @override
  State<Hoodies> createState() => _HoodiesState();
}

class _HoodiesState extends State<Hoodies> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
                              "Clothing",
                              "Merchandise",
                              "Halloween",
                              "Signature & Essentail Range",
                              "Portsmouth City Collection",
                              "Pride Collection",
                              "Graduation"
                            ],
                          ),
                          const HomeButtonSections(
                            section: "The Print Shack",
                            dropdownItems: ["About", "Personalization"],
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
                                onPressed: placeholderCallbackForButtons,
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
                                onPressed: placeholderCallbackForButtons,
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
                    'Hoodie Collection',
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
              child: const Row(children: [
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
                HomeButtonSections(
                  section: 'Featured',
                  dropdownItems: [
                    "Best Selling",
                    "Alphabetically",
                    "Price High to low",
                    "Price low to High"
                  ],
                  disabled: true,
                )
              ]),
            ),

            const SizedBox(height: 48),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              children: const [
                ProductCard(
                  title: 'Black Hoodie',
                  price: '£40.00',
                  imageUrl:
                      'https://otheruk.com/cdn/shop/files/Hoodie-Black-Front_1000x1000_crop_center.jpg?v=1749416013',
                  thumbnailImages: [
                    'https://otheruk.com/cdn/shop/files/Hoodie-Black-Front_1000x1000_crop_center.jpg?v=1749416013',
                    'https://api.deepai.org/job-view-file/c6787eb1-f266-4215-8f8c-b9eea009f4a7/outputs/output.jpg',
                    'https://api.deepai.org/job-view-file/be1637a0-203a-44b4-96c1-678fb64287d4/outputs/output.jpg',
                    'https://api.deepai.org/job-view-file/63d3113a-1964-4408-b57a-9cfb29a3918e/outputs/output.jpg',
                  ],
                ),
                ProductCard(
                  title: 'White Hoodie',
                  price: '£40.00',
                  imageUrl:
                      'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
                  thumbnailImages: [
                    'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
                    'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
                    'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
                    'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
                  ],
                ),
                ProductCard(
                  title: 'Grey hoodie',
                  price: '£45.00',
                  imageUrl:
                      'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
                  thumbnailImages: [
                    'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
                    'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
                    'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
                    'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
                  ],
                ),
                ProductCard(
                  title: 'Blue Hoodie',
                  price: '£35.00',
                  imageUrl:
                      'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
                  thumbnailImages: [
                    'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
                    'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
                    'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
                    'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
                  ],
                ),
              ],
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
                const Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Help & Information',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 75,
                        child: HomeButtonSections(section: 'Search'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 75,
                        child: HomeButtonSections(
                            section: 'Terms & Conditions of Sale Policy'),
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
