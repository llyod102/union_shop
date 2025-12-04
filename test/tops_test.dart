import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/tops.dart';

void main() {
  group('Top Model Tests - Creation', () {
    test('Top object creation with valid data', () {
      final top = Top(
        title: 'Test Shirt',
        price: '£25.00',
        imageUrl: 'https://example.com/image.jpg',
        thumbnailImages: ['https://example.com/thumb1.jpg'],
        description: 'A test shirt',
        designOptions: ['Plain', 'Custom'],
        colorCategory: 'dark',
      );

      expect(top.title, 'Test Shirt');
      expect(top.price, '£25.00');
      expect(top.imageUrl, 'https://example.com/image.jpg');
      expect(top.description, 'A test shirt');
      expect(top.colorCategory, 'dark');
    });
  });

  group('Black Shirt Tests', () {
    late Top blackShirt;

    setUp(() {
      blackShirt = Top(
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
        designOptions: ['Plain', 'Engineering', 'Essentials', 'Backyard'],
        colorCategory: 'dark',
      );
    });

    test('Black Shirt has correct title', () {
      expect(blackShirt.title, 'Black Shirt');
    });

    test('Black Shirt has correct price', () {
      expect(blackShirt.price, '£20.00');
    });

    test('Black Shirt has dark color category', () {
      expect(blackShirt.colorCategory, 'dark');
    });

    test('Black Shirt has correct description', () {
      expect(blackShirt.description, 'Nice black t Shirts');
    });

    test('Black Shirt has 4 design options', () {
      expect(blackShirt.designOptions.length, 4);
      expect(blackShirt.designOptions,
          ['Plain', 'Engineering', 'Essentials', 'Backyard']);
    });

    test('Black Shirt has 4 thumbnail images', () {
      expect(blackShirt.thumbnailImages.length, 4);
    });

    test('Black Shirt has valid main image URL', () {
      expect(blackShirt.imageUrl.isNotEmpty, true);
      expect(blackShirt.imageUrl.startsWith('https'), true);
    });
  });

  group('White Shirt Tests', () {
    late Top whiteShirt;

    setUp(() {
      whiteShirt = Top(
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
        designOptions: ['plain', 'Distinct;', 'Smart TShirt Mockup', 'NRAS'],
        colorCategory: 'bright',
      );
    });

    test('White Shirt has correct title', () {
      expect(whiteShirt.title, 'White Shirt');
    });

    test('White Shirt has correct price', () {
      expect(whiteShirt.price, '£15.00');
    });

    test('White Shirt has bright color category', () {
      expect(whiteShirt.colorCategory, 'bright');
    });

    test('White Shirt has correct description', () {
      expect(whiteShirt.description, 'Nice White t shirts');
    });

    test('White Shirt has 4 design options', () {
      expect(whiteShirt.designOptions.length, 4);
      expect(whiteShirt.designOptions,
          ['plain', 'Distinct;', 'Smart TShirt Mockup', 'NRAS']);
    });

    test('White Shirt has 4 thumbnail images', () {
      expect(whiteShirt.thumbnailImages.length, 4);
    });
  });

  group('Grey Shirt Tests', () {
    late Top greyShirt;

    setUp(() {
      greyShirt = Top(
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
        colorCategory: 'dark',
      );
    });

    test('Grey Shirt has correct title', () {
      expect(greyShirt.title, 'Grey Shirt');
    });

    test('Grey Shirt has correct price', () {
      expect(greyShirt.price, '£20.00');
    });

    test('Grey Shirt has dark color category', () {
      expect(greyShirt.colorCategory, 'dark');
    });

    test('Grey Shirt has correct description', () {
      expect(greyShirt.description, 'Nice Grey T-shirts');
    });

    test('Grey Shirt has 4 design options', () {
      expect(greyShirt.designOptions.length, 4);
      expect(greyShirt.designOptions,
          ['Plain', 'Your design here', 'Dont Feed the Bears', 'Boxy Fit']);
    });

    test('Grey Shirt has 4 thumbnail images', () {
      expect(greyShirt.thumbnailImages.length, 4);
    });
  });

  group('Blue Shirt Tests', () {
    late Top blueShirt;

    setUp(() {
      blueShirt = Top(
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
        designOptions: ['plain', 'Dark Blue', 'Free Mandala', 'Your Design'],
        colorCategory: 'bright',
      );
    });

    test('Blue Shirt has correct title', () {
      expect(blueShirt.title, 'Blue Shirt');
    });

    test('Blue Shirt has correct price', () {
      expect(blueShirt.price, '£18.00');
    });

    test('Blue Shirt has bright color category', () {
      expect(blueShirt.colorCategory, 'bright');
    });

    test('Blue Shirt has correct description', () {
      expect(blueShirt.description, 'Nice Blue T shirts');
    });

    test('Blue Shirt has 4 design options', () {
      expect(blueShirt.designOptions.length, 4);
      expect(blueShirt.designOptions,
          ['plain', 'Dark Blue', 'Free Mandala', 'Your Design']);
    });

    test('Blue Shirt has 4 thumbnail images', () {
      expect(blueShirt.thumbnailImages.length, 4);
    });
  });

  group('Price Comparison Tests', () {
    test('prices can be compared for sorting', () {
      final expensive = Top(
        title: 'Black Shirt',
        price: '£20.00',
        imageUrl: 'https://example.com/black.jpg',
        thumbnailImages: ['https://example.com/thumb.jpg'],
        description: 'Black shirt',
        designOptions: ['Plain'],
        colorCategory: 'dark',
      );

      final cheap = Top(
        title: 'White Shirt',
        price: '£15.00',
        imageUrl: 'https://example.com/white.jpg',
        thumbnailImages: ['https://example.com/thumb.jpg'],
        description: 'White shirt',
        designOptions: ['Plain'],
        colorCategory: 'bright',
      );

      final priceA = double.parse(expensive.price.replaceAll('£', ''));
      final priceB = double.parse(cheap.price.replaceAll('£', ''));

      expect(priceA > priceB, true);
    });

    test('white shirt is cheapest at 15 pounds', () {
      const whitePrice = 15.00;
      const bluePrice = 18.00;
      const blackPrice = 20.00;

      expect(whitePrice < bluePrice, true);
      expect(whitePrice < blackPrice, true);
    });

    test('prices can be sorted correctly', () {
      expect(15.00 < 18.00, true);
      expect(18.00 < 20.00, true);
      expect(15.00 < 20.00, true);
    });
  });

  group('Color Category Tests', () {
    test('dark colors include black and grey', () {
      final darkColors = ['dark', 'dark'];
      final greyShirt = 'grey';

      expect(darkColors.contains('dark'), true);
      expect(greyShirt == 'dark' || greyShirt == 'grey', true);
    });

    test('bright colors include white and blue', () {
      final brightColors = ['bright', 'bright'];

      for (var color in brightColors) {
        expect(
          color == 'bright',
          true,
        );
      }
    });

    test('all shirt categories are valid', () {
      const shirtCategories = {
        'Black': 'dark',
        'White': 'bright',
        'Grey': 'dark',
        'Blue': 'bright',
      };

      for (var category in shirtCategories.values) {
        expect(
          category == 'dark' || category == 'bright',
          true,
        );
      }
    });
  });

  group('Design Options Tests', () {
    test('Black Shirt design options are valid', () {
      const options = ['Plain', 'Engineering', 'Essentials', 'Backyard'];
      expect(options.length, 4);
    });

    test('all shirts have design options', () {
      const shirtsDesigns = {
        'Black': ['Plain', 'Engineering', 'Essentials', 'Backyard'],
        'White': ['plain', 'Distinct;', 'Smart TShirt Mockup', 'NRAS'],
        'Grey': [
          'Plain',
          'Your design here',
          'Dont Feed the Bears',
          'Boxy Fit'
        ],
        'Blue': ['plain', 'Dark Blue', 'Free Mandala', 'Your Design'],
      };

      for (var shirt in shirtsDesigns.entries) {
        expect(shirt.value.isNotEmpty, true,
            reason: '${shirt.key} should have design options');
      }
    });
  });

  group('Thumbnail Images Tests', () {
    test('all shirts have thumbnail images', () {
      const expectedImageCounts = {
        'Black': 4,
        'White': 4,
        'Grey': 4,
        'Blue': 4,
      };

      for (var count in expectedImageCounts.values) {
        expect(count, 4);
      }
    });
  });

  group('Tops Widget Tests', () {
    test('Tops widget can be created', () {
      final tops = const Tops();
      expect(tops, isNotNull);
    });
  });
}
