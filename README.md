# Union Shop

A comprehensive e-commerce Flutter application for a student union shop, featuring product browsing, personalization services, and a complete shopping cart system.

## Features

### Product Catalog
- **Multiple Product Categories**: Browse clothing collections including hoodies, tops, everyday items, and merchandise
- **Sales Section**: Special discounted products with clear original and sale pricing
- **Filter & Sort**: Filter products by category and sort by price (low to high, high to low) or alphabetically
- **Responsive Grid Layout**: Products displayed in a clean grid with images, titles, and prices

### Shopping Cart
- **Add to Cart**: Add products with selected design options, sizes, and quantities
- **Cart Management**: View all cart items with images, designs, sizes, and quantities
- **Remove Items**: Delete individual items from the cart
- **Order Summary**: Real-time subtotal calculation
- **Mock Checkout**: Simulated checkout process with order confirmation

### Personalization Service
- **Custom Design Options**:
  - One line of text (£25.00)
  - Two lines of text (£27.00)
  - Three lines of text (£29.00)
  - Four lines of text (£31.00)
  - Small logo (£28.00)
- **Dynamic Pricing**: Price updates automatically based on selected design type
- **Size Selection**: Choose from XS, S, M, L,
- **Quantity Control**: Specify desired quantity

### Navigation
- **Home Page**: Featured carousel with promotional slides
- **Shop Dropdown**: Quick access to clothing collections
- **Print Shack**: About and personalization services
- **Search Functionality**: Search bar for product discovery
- **User Account**: Account access button
- **Cart Icon**: Quick navigation to shopping cart

### UI/UX
- **Consistent Styling**: Purple theme (Color: #4d2963) throughout the application
- **Card Elevation**: Modern card design with shadow effects
- **Responsive Images**: High-quality product images with proper error handling
- **Mobile-Optimized**: Designed for mobile and desktop viewing
- **Promotional Banner**: Top banner for sales and announcements

## Technical Implementation

### Built With
- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **Material Design**: UI component library

### Key Components
- **Global State Management**: Cart items managed globally across the app
- **Custom Models**: CartItem class for product data structure
- **Reusable Widgets**: HomeButtonSections, ProductCard for consistency
- **Dynamic Routing**: Named routes for navigation
- **External Links**: Integration with external services (Domino's, Unite Students)

### Project Structure
```
lib/
├── main.dart                    # App entry point, routes, global state
├── clothing_collections.dart    # Main collection page
├── hoodies.dart                 # Hoodies category
├── tops.dart                    # Tops category
├── everdayitems.dart           # Everyday items category
├── merchandise.dart             # Merchandise category
├── sales.dart                   # Sale products
├── product_page.dart            # Individual product details
├── personilsation_page.dart    # Custom personalization service
├── cart_page.dart              # Shopping cart
├── about_page.dart             # About page
└── authentication.dart          # User authentication
```

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/llyod102/union_shop.git
cd union_shop
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

### Supported Platforms
- Android
- iOS
- Web
- Windows
- macOS
- Linux

## Features Breakdown

### Filter & Sort System
All product pages include:
- Category filters (All, Hoodies, Tops, etc.)
- Price sorting (Low to High, High to Low)
- Alphabetical sorting (A-Z, Z-A)
- Real-time grid updates

### Cart System
The CartItem model includes:
- Product title
- Price
- Image URL
- Selected design
- Selected size
- Quantity

### Personalization Pricing Logic
Base price: £25.00
- Each additional line of text: +£2.00
- Small logo: +£3.00

## External Integrations
- **Domino's Pizza**: Food ordering link
- **Unite Students**: Student accommodation link
- **Product Images**: Unsplash and Pixabay image hosting

## Known Limitations
- **Product Data**: Currently, only the Hoodies and Tops categories contain a full range of different products. The Everyday Items, Merchandise, and Sales sections display the same placeholder products across their respective categories.
- **Mock Data**: Product inventory is hardcoded for demonstration purposes and not connected to a backend database.
- **No Payment Processing**: The checkout process is simulated only - no real money transactions or payment gateway integration is implemented.
- **Registration Not Functional**: User registration and authentication systems are not currently operational and not connected to any external authentication services (e.g., Firebase, Auth0).
- **Footer Widgets**: Interactive elements in the footer section are placeholder buttons and do not perform any actions.
- **Cart Item Grouping**: Duplicate items (same product, size, and design) are displayed as separate entries in the cart rather than being consolidated with updated quantities.
- **No Cart Editing**: Once items are added to the cart, quantity, size, and design cannot be edited. Items can only be removed entirely.
- **Remove Button Behavior**: If an item in the cart has a quantity greater than 1, clicking the remove button removes all units of that item at once rather than decreasing the quantity by one.
- **Search Not Functional**: The search bar is a UI placeholder and does not perform any product search functionality.
- **Filter Functionality**: Category filtering only works on the Hoodies and Tops pages, as these were the only categories with multiple product types implemented at the time. Sort functionality (by price and alphabetically) works across all product pages.


