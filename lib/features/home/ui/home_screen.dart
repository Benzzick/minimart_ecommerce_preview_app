import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minimart_ecommerce_preview_app/core/global_services/products_service.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/back_button_bar.dart';
import 'package:minimart_ecommerce_preview_app/shared/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        spacing: 0,
        children: [
          TopBar(
            child: SearchBar(
              elevation: WidgetStatePropertyAll(0),
              leading: Image.asset('assets/images/search-icon.png', scale: 2),
              padding: WidgetStatePropertyAll(
                  const EdgeInsets.symmetric(horizontal: 15)),
              hintText: 'Search...',
              hintStyle: WidgetStatePropertyAll(Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface)),
              side: WidgetStatePropertyAll(
                BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          BackButtonBar(onPressed: () {}, title: 'Technology'),
          Container(
            color: Color.fromRGBO(251, 250, 252, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                'Smartphones, Laptops & Assecories',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.shadow,
                    ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio:
                      0.65, // 👈 This gives enough space for image + text + price
                ),
                itemCount: ProductsService.getProducts.length,
                itemBuilder: (context, index) {
                  final product = ProductsService.getProducts[index];
                  return InkWell(
                    onTap: () {
                      context.push(
                        '/p-details',
                        extra: product,
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              product.productImagePath,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 160,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.productTitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).colorScheme.shadow,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${product.productPrice}0',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
