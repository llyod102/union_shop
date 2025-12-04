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
                  description: 'Nice Blue T shirts',
                  thumbnailImages: [
                    'https://www.militarykit.com/cdn/shop/products/royal-blue-cotton-tshirt-rear.jpg?v=1568719107&width=1200',
                    'data:image/jpeg;base64,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',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTunyqvOMOpAPZ39lEelMrkeAqAEqxlppNvmA&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZ0Mb0rbvym_mKNNzTp1UpLfLa-o3SXUprSw&s'
                  ],
                  designOptions: [
                    'plain',
                    'Dark Blue',
                    'Free Mandala',
                    'Your Design'
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
