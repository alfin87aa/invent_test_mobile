import '../index.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<PriceModel?> getPrice() async {
    final res = await apiProvider.getPrice();
    if (res.statusCode == 200 && res.body['status_code'] == 'ERR-00-000') {
      return PriceModel.fromJson(res.body);
    }
    return null;
  }

  Future<ProductModel?> getProduct() async {
    final res = await apiProvider.getProduct();
    if (res.statusCode == 200 && res.body['status_code'] == 'ERR-00-000') {
      return ProductModel.fromJson(res.body);
    }
    return null;
  }
}
