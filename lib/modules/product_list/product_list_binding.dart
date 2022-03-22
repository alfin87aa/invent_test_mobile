import '../../index.dart';

class ProductListBinding extends Bindings {
  @override
  void dependencies() {
    DbHelper _localData = Get.find();
    Get.lazyPut<ProductListController>(
        (() => ProductListController(dbHelper: _localData)));
  }
}
