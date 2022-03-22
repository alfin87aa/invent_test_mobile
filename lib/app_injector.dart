import 'index.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    final DbHelper _helper = DbHelper();
    _helper.openDB();
    Get.lazyPut(() => _helper);
  }
}
