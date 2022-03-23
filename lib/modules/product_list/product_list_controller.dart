import '../../index.dart';

class ProductListController extends GetxController {
  final DbHelper dbHelper;
  final ApiRepository apiRepository;

  ProductListController({
    required this.dbHelper,
    required this.apiRepository,
  });

  final List<ValueProduct> _product = <ValueProduct>[];
  final searchController = TextEditingController();
  RxList<ValueProduct> productList = <ValueProduct>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt idSelectSortChoices = 0.obs;
  final sortChoices = <SortChoice>[
    SortChoice(1, 'by name asc'.tr),
    SortChoice(2, 'by name desc'.tr),
    SortChoice(3, 'by price asc'.tr),
    SortChoice(4, 'by price desc'.tr),
  ];

  @override
  void onInit() async {
    super.onInit();
    await dbHelper.getData(ProductQuery.TABLE_NAME).then((value) {
      if (value.isEmpty) {
        getProducts();
        getPrices();
      }
    });
    loadProducts();
  }

  void changeMenu(int index) {
    currentIndex.value = index;
  }

  Future<void> loadProducts() async {
    dbHelper.getProductPrice().then((items) {
      if (items.isNotEmpty) {
        for (var item in items) {
          _product.add(ValueProduct.fromJson(item));
        }
        productList.addAll(_product);
      }
    });
  }

  Future<void> getProducts() async {
    var _products = await apiRepository.getProduct();
    if (_products != null) {
      for (var _item in _products.valueProduct) {
        dbHelper.insert(ProductQuery.TABLE_NAME, _item.toJson());
      }
    }
  }

  Future<void> getPrices() async {
    var _prices = await apiRepository.getPrice();
    if (_prices != null) {
      for (var _price in _prices.valuePrice) {
        dbHelper.insert(PriceQuery.TABLE_NAME, _price.toJson());
      }
    }
  }

  Future<void> clearDB() async {
    dbHelper.delete(ProductQuery.TABLE_NAME);
    dbHelper.delete(PriceQuery.TABLE_NAME);

    _product.clear();
    productList.clear();
  }

  Future<void> refreshProduct() async {
    await clearDB();
    await getProducts();
    await getPrices();
    await loadProducts();
  }

  void searchProduct(String query) {
    if (query.isNotEmpty) {
      List<ValueProduct> _productListData = <ValueProduct>[];

      for (var element in _product) {
        if (element.productName.toLowerCase().contains(query) ||
            element.price.toLowerCase().contains(query)) {
          _productListData.add(element);
        }
      }
      productList.clear();
      productList.addAll(_productListData);
    } else {
      productList.clear();
      productList.addAll(_product);
    }
  }

  void sortProduct(int index) {
    idSelectSortChoices.value = index;

    switch (index) {
      case 1:
        productList.sort(((a, b) => a.productName
            .toLowerCase()
            .compareTo(b.productName.toLowerCase())));
        break;
      case 2:
        productList.sort(((a, b) => b.productName
            .toLowerCase()
            .compareTo(a.productName.toLowerCase())));
        break;
      case 3:
        productList
            .sort(((a, b) => int.parse(a.price).compareTo(int.parse(b.price))));
        break;
      case 4:
        productList
            .sort(((a, b) => int.parse(b.price).compareTo(int.parse(a.price))));
        break;
      default:
    }
  }
}
