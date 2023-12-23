import 'package:get/get.dart';
import 'app/shared/services/app_service.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => AppService().initSharedPref());
    await Get.putAsync(() => AppService().initFirebaseCore());
    await Get.putAsync(() => AppService().initHive());
    await Get.putAsync(() => AppService().initConnectivityChecker());
  }
}
