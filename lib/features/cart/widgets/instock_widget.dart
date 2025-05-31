import 'package:flutter/material.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';

class InstockWidget extends StatelessWidget {
  const InstockWidget({
    super.key,
    required this.product,
    required this.increaseProductQuantity,
    required this.decreaseProductQuantity,
    required this.removefromCart,
  });

  final Product product;
  final void Function(String productId) increaseProductQuantity;
  final void Function(String productId) decreaseProductQuantity;
  final void Function(String productId) removefromCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 245, 248, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            product.productImagePath,
            scale: 2.2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(product.productTitle,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Color.fromRGBO(51, 65, 85, 1),
                        )),
              ),
              Text('\$${product.productPrice}0',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Color.fromRGBO(51, 65, 85, 1),
                      )),
              Text('In stock',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Color.fromRGBO(16, 185, 129, 1),
                      )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                        onPressed: () {
                          decreaseProductQuantity(product.id);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Color.fromRGBO(226, 232, 240, 1),
                          padding: EdgeInsets.all(6),
                          minimumSize: Size(35, 35),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: Image.asset(
                          'assets/images/minus-icon.png',
                          scale: 2,
                        )),
                    Text(product.quantity.toString(),
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Color.fromRGBO(51, 65, 85, 1),
                                )),
                    IconButton.filled(
                        onPressed: () {
                          increaseProductQuantity(product.id);
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.all(6),
                            minimumSize: Size(35, 35),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            side: BorderSide(
                              width: 1,
                              color: Color.fromRGBO(226, 232, 240, 1),
                            )),
                        icon: Image.asset(
                          'assets/images/add-icon.png',
                          scale: 2,
                        )),
                    IconButton.filled(
                        onPressed: () {
                          removefromCart(product.id);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.all(6),
                          minimumSize: Size(35, 35),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        icon: Image.asset(
                          'assets/images/trash-icon.png',
                          scale: 2,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
