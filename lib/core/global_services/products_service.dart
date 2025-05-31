import 'package:minimart_ecommerce_preview_app/models/product.dart';

class ProductsService {
  static List<Product> products = [
    Product(
        productImagePath: 'assets/images/products/image1.png',
        productTitle: 'M4 Macbook Air 13” 256GB|Sky blue',
        productDescription: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
        ],
        productPrice: 1000),
    Product(
      productImagePath: 'assets/images/products/image2.png',
      productTitle: 'Apple Airpods 4 Active Noise Cancellation|Teal',
      productDescription: [
        'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
        'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
      ],
      productPrice: 129,
    ),
    Product(
        productImagePath: 'assets/images/products/Image3.png',
        productTitle: 'Apple iPhone 16 128GB|Teal',
        productDescription: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
        ],
        productPrice: 700),
    Product(
        productImagePath: 'assets/images/products/Image4.png',
        productTitle: 'Google Pixel 9A 128GB|Iris',
        productDescription: [
          'This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.',
          'There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.'
        ],
        productPrice: 499)
  ];

  static List<Product> get getProducts {
    List<Product> moreProducts = [...products, ...products, ...products];
    return moreProducts;
  }
}
