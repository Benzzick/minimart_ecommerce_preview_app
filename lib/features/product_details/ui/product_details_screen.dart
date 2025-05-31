import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart_ecommerce_preview_app/core/global_providers/cart_products_provider.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/back_button_bar.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/top_bar.dart';
import 'package:minimart_ecommerce_preview_app/features/product_details/widgets/success_toast.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  void addToCart() {
    ref.read(cartProductsProvider.notifier).addProduct(widget.product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SuccessToast(message: 'Item added to cart'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void likeProduct() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProductsProvider);

    final isInCart =
        cartProducts.any((product) => product.id == widget.product.id);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopBar(),
          BackButtonBar(
            onPressed: () {
              Navigator.pop(context);
            },
            title: 'Go Back',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color.fromRGBO(251, 250, 252, 1),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          widget.product.productImagePath,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton.filled(
                            style: IconButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(255, 255, 255, 1),
                                padding: EdgeInsets.all(10)),
                            onPressed: likeProduct,
                            icon: Image.asset(
                              widget.product.isFavorite
                                  ? 'assets/images/like_filled.png'
                                  : 'assets/images/like.png',
                              scale: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Text(widget.product.productTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).colorScheme.shadow,
                                  )),
                          Text(
                            '\$${widget.product.productPrice}0',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.shadow,
                                ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About this item',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                    ),
                              ),
                              ...widget.product.productDescription.map(
                                (description) {
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '• ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromRGBO(
                                                      153, 153, 153, 1),
                                                ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.83,
                                            child: Text(
                                              description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    color: Color.fromRGBO(
                                                        153, 153, 153, 1),
                                                  ),
                                            ),
                                          )
                                        ],
                                      ));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: !isInCart
                ? SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: addToCart,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Add To Cart',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.surface,
                              )),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(226, 232, 240, 1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Added to cart',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(100, 116, 139, 1),
                                  )),
                    ),
                  ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
