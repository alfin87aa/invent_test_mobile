import '../../index.dart';

class ProductListController extends GetxController {
  final DbHelper dbHelper;
  final ApiRepository apiRepository;

  ProductListController({
    required this.dbHelper,
    required this.apiRepository,
  });

  RxList<ValueProduct> productList = <ValueProduct>[].obs;
  RxList<ValuePrice> priceList = <ValuePrice>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await clearDB();
    dbHelper.getData(ProductQuery.TABLE_NAME).then((value) {
      if (value.isNotEmpty) {
        for (var element in value) {
          productList.add(ValueProduct.fromJson(element));
        }
      } else {
        getProducts();
        getPrices();
      }
    });
  }

  Future<void> getProducts() async {
    var _products = await apiRepository.getProduct();
    if (_products != null) {
      productList.value = _products.valueProduct;
      productList.refresh();

      for (var _product in _products.valueProduct) {
        dbHelper.insert(ProductQuery.TABLE_NAME, _product.toJson());
      }
    }
  }

  Future<void> getPrices() async {
    var _prices = await apiRepository.getPrice();
    if (_prices != null) {
      priceList.value = _prices.valuePrice;
      priceList.refresh();

      for (var _price in _prices.valuePrice) {
        dbHelper.insert(PriceQuery.TABLE_NAME, _price.toJson());
      }
    }
  }

  Future<void> clearDB() async {
    dbHelper.delete(ProductQuery.TABLE_NAME);
    dbHelper.delete(PriceQuery.TABLE_NAME);

    productList.value = [];
    priceList.value = [];

    productList.refresh();
    priceList.refresh();
  }
}
