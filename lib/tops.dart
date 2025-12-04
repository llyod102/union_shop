import 'package:flutter/material.dart';
import 'package:union_shop/main.dart';

class Tops extends StatefulWidget {
  const Tops({super.key});

  @override
  State<Tops> createState() => _TopsState();
}

class _TopsState extends State<Tops> {
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
                    'Tops Collection',
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
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              children: const [
                ProductCard(
                  title: 'Black Shirt',
                  price: '£20.00',
                  imageUrl:
                      'https://copilot.microsoft.com/th/id/BCO.02f7f730-06eb-4613-a1ca-8c516e7e3112.png',
                  thumbnailImages: [
                    'https://copilot.microsoft.com/th/id/BCO.02f7f730-06eb-4613-a1ca-8c516e7e3112.png',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFIZtOL1TneWY8D6-LX9SiSYOMivBFFjtbnA&s',
                    'https://images-platform.99static.com//4kB4IRSK3O3Q2t2tO_LKVAxT3dM=/0x65:918x983/fit-in/500x500/99designs-contests-attachments/56/56970/attachment_56970114',
                    'https://backyarddesign.co.uk/wp-content/uploads/2021/10/BYD-T-BATCH-BLACK-Front-1024x683.jpg'
                  ],
                  description: "Nice black t Shirts",
                  designOptions: [
                    'Plain',
                    'Engineering',
                    'Essentials',
                    'Backyard'
                  ],
                ),
                ProductCard(
                    title: 'White Shirt',
                    price: '£15.00',
                    imageUrl:
                        'https://cdn11.bigcommerce.com/s-jank4pe/images/stencil/1280w/products/676/7573/J180M_White_FT__51579.1460542956.jpg?c=2',
                    thumbnailImages: [
                      'https://cdn11.bigcommerce.com/s-jank4pe/images/stencil/1280w/products/676/7573/J180M_White_FT__51579.1460542956.jpg?c=2',
                      'https://www.weareoi.com/cdn/shop/files/HorizonT-Shirt-1_2048x.jpg?v=1753991299',
                      'https://cdn.dribbble.com/userupload/39855993/file/original-3971290b7a813156b86298f9a0350411.jpg?format=webp&resize=400x300&vertical=center',
                      'https://nras.org.uk/wp-content/uploads/sites/2/2024/10/White-Tee-1.jpg'
                    ],
                    description: "Nice White t shirts",
                    designOptions: [
                      'plain',
                      'Distinct;',
                      'Smart TShirt Mockup',
                      'NRAS'
                    ]),
                ProductCard(
                  title: 'Grey Shirt',
                  price: '£20.00',
                  imageUrl:
                      'https://www.urbanindustry.co.uk/cdn/shop/products/UrbanIndustry_Organic_TShirt_Grey_01.jpg?v=1755864422',
                  description: "Nice Grey T-shirts",
                  thumbnailImages: [
                    'https://www.urbanindustry.co.uk/cdn/shop/products/UrbanIndustry_Organic_TShirt_Grey_01.jpg?v=1755864422',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdN5F5_KEXap4jD-eC79tsZKrbyP-mXHxo2Q&s',
                    'https://www.dontfeedthebears.co.uk/cdn/shop/files/mountains-grey-tee-2.jpg?v=1760883315&width=1080',
                    'https://sites.create-cdn.net/siteimages/64/6/3/646370/21/1/7/21171785/853x1000.png?1725269398'
                  ],
                  designOptions: [
                    'Plain',
                    'Your design here',
                    'Dont Feed the Bears',
                    'Boxy Fit'
                  ],
                ),
                ProductCard(
                  title: 'Blue Shirt',
                  price: '£18.00',
                  imageUrl:
                      'https://www.militarykit.com/cdn/shop/products/royal-blue-cotton-tshirt-rear.jpg?v=1568719107&width=1200',
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
