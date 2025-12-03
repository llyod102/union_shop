import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/about_page.dart';
import 'package:union_shop/personilsation_page.dart';
import 'package:union_shop/clothing_collections.dart';
import 'package:union_shop/tops.dart';
import 'package:union_shop/hoodies.dart';
import 'package:union_shop/everdayitems.dart';
import 'package:union_shop/merchandise.dart';

import 'dart:async';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      // By default, the app starts at the '/' route, which is the HomeScreen
      initialRoute: '/',
      // When navigating to '/product', build and return the ProductPage
      // In your browser, try this link: http://localhost:49856/#/product
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutPage(),
        '/personalisation': (context) => const PersonilsationPage(),
        '/clothing_collections': (context) => const ClothingCollections(),
        '/everdayitems': (context) => const Everdayitems(),
        '/hoodies': (context) => const Hoodies(),
        '/tops': (context) => const Tops(),
        '/merchandise': (context) => const Merchandise(),
      },
    );
  }
}

class SlideData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;

  SlideData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
}

class HomeButtonSections extends StatefulWidget {
  final String section;
  final String? functionname;
  final List<String>? dropdownItems;
  final bool disabled;
  const HomeButtonSections(
      {super.key,
      required this.section,
      this.functionname,
      this.dropdownItems,
      this.disabled = false});

  @override
  State<HomeButtonSections> createState() => _HomeButtonSectionsState();
}

class _HomeButtonSectionsState extends State<HomeButtonSections> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dropdownItems == null) {
      return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: widget.disabled
                  ? null
                  : () {
                      if (widget.section.toLowerCase() == 'home') {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      } else if (widget.section.toLowerCase() == 'about') {
                        Navigator.pushNamed(context, '/about');
                      }
                    },
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.white)),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  widget.section,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )),
      );
    } else {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownMenu<String>(
          controller: _controller,
          requestFocusOnTap: false,
          initialSelection: null,
          hintText: widget.section,
          textStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          onSelected: widget.disabled
              ? null
              : (String? value) {
                  if (value == null) return;
                  // Route based on selected dropdown item
                  final lower = value.toLowerCase();
                  if (lower == 'clothing') {
                    Navigator.pushNamed(context, '/clothing_collections');
                  } else {
                    Navigator.pushNamed(context, '/product');
                  }
                  // Clear selection after navigation
                  Future.delayed(Duration.zero, () {
                    _controller.clear();
                  });
                },
          dropdownMenuEntries: widget.dropdownItems!
              .map(
                (item) => DropdownMenuEntry<String>(
                  value: item,
                  label: item,
                ),
              )
              .toList(),
        ),
      ));
    }
  }
}

class HeroSlider extends StatefulWidget {
  const HeroSlider({super.key});

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? timer;

  final List<SlideData> slides = [
    SlideData(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/03/25/09/04/t-shirt-1278404_640.jpg",
        title: "Essential Range - Over 20% OFF! ",
        subtitle:
            "Over 20% off our Essentail Range. Come and grab yours while tock lasts!",
        buttonText: "Browse Collection"),
    SlideData(
        imageUrl:
            "https://images.unsplash.com/photo-1556821840-3a63f95609a7?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG9vZGllfGVufDB8fDB8fHww",
        title: "The Print Shack",
        subtitle: "Let's Create something unique",
        buttonText: "Find Out more"),
    SlideData(
        imageUrl:
            "https://images.unsplash.com/photo-1534308983496-4fabb1a015ee?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGl6emF8ZW58MHx8MHx8fDA%3D",
        title: "Hungry?",
        subtitle: "We Got this!",
        buttonText: "Order Now"),
    SlideData(
        imageUrl:
            "https://images.pexels.com/photos/1454806/pexels-photo-1454806.jpeg?cs=srgb&dl=pexels-jvdm-1454806.jpg&fm=jpg",
        title: "What's your next move...",
        subtitle: "Are you with us?",
        buttonText: "Find your Student Accomodation!")
  ];

  @override
  void dispose() {
    timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < slides.length - 1) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;
    return SizedBox(
      height: isMobile ? 250 : 400,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return _buildSlide(slides[index]);
            },
          ),
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 30),
                onPressed: () {
                  if (_currentPage > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 30),
                onPressed: () {
                  if (_currentPage < 3) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
              ),
            ),
          ),
          Positioned(
              bottom: 16,
              right: 0,
              left: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    slides.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.white : Colors.grey,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _buildSlide(SlideData slide) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(slide.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.7)),
            ),
          ),
        ),
        Positioned(
          left: 24,
          right: 24,
          top: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                slide.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                slide.subtitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  if (slide.buttonText.toLowerCase() == 'order now') {
                    const url = 'https://www.dominos.co.uk/';
                    await launchUrlString(url,
                        mode: LaunchMode.platformDefault);
                    return;
                  } else if (slide.buttonText.toLowerCase() ==
                      "find your student accomodation!") {
                    const url = 'https://www.unitestudents.com';
                    await launchUrlString(url,
                        mode: LaunchMode.platformDefault);
                    return;
                  } else if (slide.buttonText.toLowerCase() ==
                      "browse collection") {
                    Navigator.pushNamed(context, '/clothing_collections');
                    return;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4d2963),
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  slide.buttonText,
                  style: const TextStyle(fontSize: 14, letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void navigateToProduct(BuildContext context) {
    Navigator.pushNamed(context, '/product');
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

            // Hero Section
            const HeroSlider(),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'Essential Range - Over 20% OFF!',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Grey Hoodie',
                          price: '£1̶0̶.̶0̶0̶  £7.99',
                          imageUrl:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT_xau7L0-dEIKkCD-lhxccRDhqP7qht3mYg&s',
                        ),
                        ProductCard(
                          title: 'T-Shirt',
                          price: '£1̶0̶.̶0̶0̶  £5.99',
                          imageUrl:
                              'https://www.shutterstock.com/image-photo/white-crew-neck-tshirt-highly-600nw-2590672403.jpg',
                        ),
                        ProductCard(
                          title: 'Watch',
                          price: '£20.00',
                          imageUrl:
                              'data:image/jpeg;base64,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',
                        ),
                        ProductCard(
                          title: 'PostCard',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Footer
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
                      )
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

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String? route;
  final List<String>? thumbnailImages;
  final List<String>? designOptions;
  final String? description;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.route,
    this.thumbnailImages,
    this.designOptions,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          Navigator.pushNamed(context, route!);
        } else {
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
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.width > 400 ? 300 : 200,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
