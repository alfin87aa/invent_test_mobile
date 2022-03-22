import 'index.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    final DbHelper _helper = DbHelper();
    await Get.putAsync(() => _helper.openDB());
  }
}
