import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  Product({
    required this.productImagePath,
    required this.productTitle,
    required this.productDescription,
    required this.productPrice,
  }) : id = uuid.v4();
  final String id;
  final String productImagePath;
  final String productTitle;
  final List<String> productDescription;
  final double productPrice;
  bool isFavorite = false;
  int quantity = 1;
}
