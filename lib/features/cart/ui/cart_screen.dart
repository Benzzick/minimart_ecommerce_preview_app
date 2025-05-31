import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart_ecommerce_preview_app/core/global_providers/cart_products_provider.dart';
import 'package:minimart_ecommerce_preview_app/features/cart/widgets/instock_widget.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/back_button_bar.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/top_bar.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  void removefromCart(String id) {
    ref.read(cartProductsProvider.notifier).removefromCart(id);
  }

  void increaseProductQuantity(String id) {
    setState(() {
      ref.read(cartProductsProvider.notifier).increaseProductQuantity(id);
    });
  }

  void decreaseProductQuantity(String id) {
    setState(() {
      ref.read(cartProductsProvider.notifier).decreaseProductQuantity(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProductsProvider);

    final calculatedTotal =
        ref.watch(cartProductsProvider.notifier).calculateTotal;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopBar(),
          BackButtonBar(
            onPressed: () {},
            title: 'Your Cart',
          ),
          Expanded(
            child: Container(
              color: Color.fromRGBO(251, 250, 252, 1),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 20,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ...cartProducts.map(
                        (product) {
                          return InstockWidget(
                            product: product,
                            increaseProductQuantity: increaseProductQuantity,
                            decreaseProductQuantity: decreaseProductQuantity,
                            removefromCart: removefromCart,
                          );
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(
                            'Order Info',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.shadow,
                                ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                              Text(
                                '\$$calculatedTotal',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                              Text(
                                '\$10',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                              Text(
                                '\$${calculatedTotal + 10}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Theme.of(context).colorScheme.shadow,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            thickness: 1,
            height: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Checkout(\$${calculatedTotal + 10})',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.surface,
                        )),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
