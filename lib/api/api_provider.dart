import '../index.dart';
import 'base_provider.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getPrice() {
    final result = get(Endpoint.price);

    return result;
  }

  Future<Response> getProduct() {
    return get(Endpoint.product);
  }
}
