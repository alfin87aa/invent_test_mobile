import '../../index.dart';

FutureOr<Request> requestInterceptor(request) async {
  // final box = Get.find<GetStorage>();
  // final token = box.read(StorageConstants.token);

  request.headers['X-Requested-With'] = 'XMLHttpRequest';
  request.headers['Accept'] = '*/*';
  request.headers['Accept-Encoding'] = 'gzip, deflate, br';
  request.headers['Connection'] = 'keep-alive';
  // request.headers['Accept'] = '*/*';
  // request.headers['Authorization'] = 'Bearer $token';

  EasyLoading.show(status: 'loading...');
  return request;
}
