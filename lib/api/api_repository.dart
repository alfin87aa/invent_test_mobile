import '../index.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<PriceModel?> getPrice() async {
    final res = await apiProvider.getPrice();
    if (res.statusCode == 200 && res.body['status_code'] == 'ERR-00-000') {
      return priceModelFromJson(res.bodyString!);
    }
    return null;
  }

  Future<ProductModel?> getProduct() async {
    final res = await apiProvider.getProduct();
    if (res.statusCode == 200 && res.body['status_code'] == 'ERR-00-000') {
      return productModelFromJson(res.bodyString!);
    }
    return null;
  }
}
