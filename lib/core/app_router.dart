import 'package:go_router/go_router.dart';
import 'package:minimart_ecommerce_preview_app/features/dashboard/ui/dashboard_screen.dart';
import 'package:minimart_ecommerce_preview_app/features/product_details/ui/product_details_screen.dart';
import 'package:minimart_ecommerce_preview_app/models/product.dart';

class AppRouter {
  static final GoRouter goRouter =
      GoRouter(initialLocation: '/dashboard', routes: [
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        return DashboardScreen();
      },
    ),
    GoRoute(
      path: '/p-details',
      builder: (context, state) {
        return ProductDetailsScreen(product: state.extra as Product);
      },
    ),
  ]);
}
