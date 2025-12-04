import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/product_page.dart';

class Hoodies extends StatefulWidget {
  const Hoodies({super.key});

  @override
  State<Hoodies> createState() => _HoodiesState();
}

class Hoodie {
  final String title;
  final String price;
  final String imageUrl;
  final List<String> thumbnailImages;
  final String description;
  final List<String> designOptions;
  final String colorCategory;

  Hoodie({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.thumbnailImages,
    required this.description,
    required this.designOptions,
    required this.colorCategory,
  });
}

class _HoodiesState extends State<Hoodies> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedFilter;
  String?
      _selectedSort; // 'featured', 'best-selling', 'alphabetically', 'price-high-low', 'price-low-high'

  List<Hoodie> get filteredHoodies {
    if (_selectedFilter == null) {
      return hoodies;
    } else if (_selectedFilter == 'dark') {
      // Filter for dark and grey hoodies
      return hoodies
          .where((hoodie) =>
              hoodie.colorCategory == 'dark' || hoodie.colorCategory == 'grey')
          .toList();
    } else if (_selectedFilter == 'bright') {
      // Filter for bright hoodies (white, blue, etc.)
      return hoodies
          .where((hoodie) =>
              hoodie.colorCategory != 'dark' && hoodie.colorCategory != 'grey')
          .toList();
    }
    return hoodies;
  }

  List<Hoodie> get sortedAndFilteredHoodies {
    List<Hoodie> result = List.from(filteredHoodies);

    if (_selectedSort == 'best-selling') {
      // Keep original order (assuming it's already sorted by best selling)
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

  final List<Hoodie> hoodies = [
    Hoodie(
      title: 'Dark Hoodies',
      price: '£40.00',
      imageUrl:
          'https://otheruk.com/cdn/shop/files/Hoodie-Black-Front_1000x1000_crop_center.jpg?v=1749416013',
      thumbnailImages: [
        'https://otheruk.com/cdn/shop/files/Hoodie-Black-Front_1000x1000_crop_center.jpg?v=1749416013',
        'https://m.media-amazon.com/images/I/51LMTCq4dWL._AC_SX569_.jpg',
        'https://theblackdog.com/cdn/shop/files/A197_Navy_5652.jpg?v=1760902238&width=416',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQfJT5-5bM8yfid47MSwLjXLX7fZSyL1Gnxg&s',
      ],
      description:
          'Comfortable dark hoodie perfect for any occasion. Made from high-quality materials for ultimate comfort and durability.',
      designOptions: ['Plain', 'Bird', 'Dog', 'Cat'],
      colorCategory: 'dark',
    ),
    Hoodie(
      title: 'White Hoodie',
      price: '£40.00',
      imageUrl:
          'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
      thumbnailImages: [
        'https://images.pexels.com/photos/8217544/pexels-photo-8217544.jpeg?cs=srgb&dl=pexels-mart-production-8217544.jpg&fm=jpg',
        'data:image/jpeg;base64,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',
        'https://www.insideoutpjt.com/cdn/shop/files/white_hoodie_-_mood_swing_1.jpg?v=1746365216&width=4032',
        'https://springmelt.co.uk/cdn/shop/files/unisex-premium-hoodie-white-front-67474590cfafe.jpg?v=1732724125&width=1920',
      ],
      description:
          'Comfortable White hoodie perfect for any occasion. Made from high-quality materials for ultimate comfort and durability.',
      designOptions: ['Plain', 'Marshmallow', 'Mood Swing', 'Spring Telt'],
      colorCategory: 'white',
    ),
    Hoodie(
      title: 'Grey hoodie',
      price: '£45.00',
      imageUrl:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
      thumbnailImages: [
        'https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQBiZ-RQY21Eg4z39ydcZLWhu1Wxud2_ybGw&s',
        'https://5.imimg.com/data5/SELLER/Default/2023/7/321888479/IA/VR/KN/192164160/8q5a0202-500x500.JPG',
        'https://customuniforms.co.uk/cdn/shop/products/SPORTGREYNEW_598c318a-3181-4a7c-a571-1779600a5360_1000x1500.png?v=1677586448',
      ],
      description:
          'Comfortable Grey hoodie perfect for any occasion. Made from high-quality materials for ultimate comfort and durability.',
      designOptions: ['Plain', 'Grafiti Art', 'Worry less', 'Your Logo'],
      colorCategory: 'grey',
    ),
    Hoodie(
      title: 'Blue Hoodie',
      price: '£35.00',
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
      thumbnailImages: [
        'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242458330-W4BUY02Q9KQM399WD7OP/JH001+COR+FRONT.jpg?format=1000w',
        'https://images.squarespace-cdn.com/content/v1/5967e798893fc01de25613bb/1546242737632-YV5V5665Z8STTCYL21FJ/JH001+ROY+FRONT.jpg?format=1000w',
        'https://customuniforms.co.uk/cdn/shop/products/NAVYNEW_adc822e6-73f8-440e-a614-5e85c2666ecb_1000x1500.png?v=1677586234',
        'https://bluepanda.co.uk/cdn/shop/files/panda-womens-hoodie-unisex-5147303_1200x.jpg?v=1760882291',
      ],
      description:
          'Comfortable Blue hoodie perfect for any occasion. Made from high-quality materials for ultimate comfort and durability.',
      designOptions: ['Plain', 'Royal Blue', 'Your image As', 'Panda Hoodie'],
      colorCategory: 'blue',
    ),
  ];

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
              child: Row(children: [
                const HomeButtonSections(
                  section: 'Filter',
                  disabled: true,
                ),
                PopupMenuButton<String>(
                  onSelected: (String value) {
                    setState(() {
                      if (value == 'All Products') {
                        _selectedFilter = null;
                      } else if (value == 'Dark Clothing') {
                        _selectedFilter = 'dark';
                      } else if (value == 'Bright Clothing') {
                        _selectedFilter = 'bright';
                      }
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          _selectedFilter == null
                              ? 'All Products'
                              : _selectedFilter == 'dark'
                                  ? 'Dark Clothing'
                                  : 'Bright Clothing',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Icon(Icons.arrow_drop_down, size: 20),
                      ],
                    ),
                  ),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'All Products',
                      child: Text('All Products'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Dark Clothing',
                      child: Text('Dark Clothing'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Bright Clothing',
                      child: Text('Bright Clothing'),
                    ),
                  ],
                ),
                const HomeButtonSections(
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
              itemCount: sortedAndFilteredHoodies.length,
              itemBuilder: (context, index) {
                final hoodie = sortedAndFilteredHoodies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductPage(
                          title: hoodie.title,
                          price: hoodie.price,
                          imageUrl: hoodie.imageUrl,
                          thumbnailImages: hoodie.thumbnailImages,
                          designOptions: hoodie.designOptions,
                          description: hoodie.description,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            hoodie.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(Icons.image_not_supported),
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
                              Text(
                                hoodie.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                hoodie.price,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
