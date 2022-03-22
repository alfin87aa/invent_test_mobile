import '../../index.dart';

FutureOr<Request> authInterceptor(request) async {
  // final box = Get.find<GetStorage>();
  // final token = box.read(StorageConstants.token);

  // request.headers['X-Requested-With'] = 'XMLHttpRequest';
  // request.headers['Authorization'] = 'Bearer $token';

  return request;
}
