import '../index.dart';
part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.LIST,
      page: () => const ProductListScreen(),
      binding: ProductListBinding(),
    ),
  ];
}
