import '../../index.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();
  if (response.body['status_code'] != 'ERR-00-000') {
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  EasyLoading.dismiss();

  Get.snackbar(
    response.body['status_code'],
    response.body['status_message_ind'],
    margin: const EdgeInsets.only(top: 50.0),
    duration: const Duration(seconds: 1),
  );

  return;
}
