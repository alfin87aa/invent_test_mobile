import '../../index.dart';

class ProductListController extends GetxController {
  final DbHelper dbHelper;

  ProductListController({
    required this.dbHelper,
  });

  RxList<ProductModel> productModel = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    dbHelper.getData(ProductQuery.TABLE_NAME).then((value) {
      if (value.isNotEmpty) {
        value.forEach((element) {
          productModel.add(element);
        });
      }
    });
  }
}
