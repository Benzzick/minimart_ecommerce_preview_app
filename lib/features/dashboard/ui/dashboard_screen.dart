import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minimart_ecommerce_preview_app/core/global_providers/cart_products_provider.dart';
import 'package:minimart_ecommerce_preview_app/features/cart/ui/cart_screen.dart';
import 'package:minimart_ecommerce_preview_app/features/dashboard/providers/screen_provider.dart';
import 'package:minimart_ecommerce_preview_app/features/favorites/ui/favorites_screen.dart';
import 'package:minimart_ecommerce_preview_app/features/home/ui/home_screen.dart';
import 'package:minimart_ecommerce_preview_app/features/profile/ui/profile_screen.dart';
import 'package:minimart_ecommerce_preview_app/models/screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Screen> tabs = [
      Screen(
          icon: Image.asset(
            'assets/images/home-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.shadow,
          ),
          activeIcon: Image.asset(
            'assets/images/home-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Home',
          screen: HomeScreen()),
      Screen(
          icon: Image.asset(
            'assets/images/cart-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.shadow,
          ),
          activeIcon: Image.asset(
            'assets/images/cart-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Cart',
          screen: CartScreen()),
      Screen(
          icon: Image.asset(
            'assets/images/favorites-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.shadow,
          ),
          activeIcon: Image.asset(
            'assets/images/favorites-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Favorites',
          screen: FavoritesScreen()),
      Screen(
          icon: Image.asset(
            'assets/images/profile-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.shadow,
          ),
          activeIcon: Image.asset(
            'assets/images/profile-icon.png',
            scale: 2,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Profile',
          screen: ProfileScreen()),
    ];

    final tabIndex = ref.watch(screenProvider);

    final productsCount = ref.watch(cartProductsProvider).length;

    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: tabs.map(
          (tab) {
            return tab.screen;
          },
        ).toList(),
      ),
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.white.withAlpha(5),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BottomNavigationBar(
                  elevation: 0,
                  landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
                  currentIndex: tabIndex,
                  onTap: (value) {
                    ref.read(screenProvider.notifier).state = value;
                  },
                  backgroundColor: Colors.white.withAlpha(10),
                  unselectedLabelStyle:
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                  selectedLabelStyle:
                      Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                  selectedItemColor: Theme.of(context).colorScheme.secondary,
                  unselectedItemColor:
                      Theme.of(context).colorScheme.inverseSurface,
                  type: BottomNavigationBarType.fixed,
                  items: tabs.map(
                    (tab) {
                      return BottomNavigationBarItem(
                        icon: tab.label == 'Cart' && productsCount > 0
                            ? Stack(
                                clipBehavior:
                                    Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: tab.icon,
                                      ),
                                      const SizedBox(height: 6),
                                    ],
                                  ),
                                  Positioned(
                                    top: 3,
                                    right: -4,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color.fromRGBO(60, 72, 86, 1),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 18,
                                        minHeight: 18,
                                      ),
                                      child: Center(
                                        child: Text(
                                          productsCount.toString(),
                                          style: const TextStyle(
                                            fontSize: 8,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  tab.icon,
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                        label: tab.label,
                        activeIcon: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 4),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: tab.activeIcon,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
