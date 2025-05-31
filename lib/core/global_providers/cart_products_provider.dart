import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';

final cartProductsProvider =
    StateNotifierProvider<CartProductsNotifier, List<Product>>(
        (ref) => CartProductsNotifier());

class CartProductsNotifier extends StateNotifier<List<Product>> {
  CartProductsNotifier() : super([]);
  void addProduct(Product product) {
    product.quantity = 1;
    state = [...state, product];
  }

  void removefromCart(String id) {
    state = state.where((product) => product.id != id).toList();
  }

  void increaseProductQuantity(String id) {
    final products = state;
    for (var product in products) {
      if (product.id == id) {
        product.quantity += 1;
      }
    }
    state = products;
  }

  void decreaseProductQuantity(String id) {
    final products = state;
    for (var product in products) {
      if (product.id == id && product.quantity > 1) {
        product.quantity -= 1;
      }
    }
    state = products;
  }

  int get calculateTotal {
    int total = 0;
    for (var product in state) {
      total += (product.productPrice * product.quantity).toInt();
    }
    return total;
  }
}
