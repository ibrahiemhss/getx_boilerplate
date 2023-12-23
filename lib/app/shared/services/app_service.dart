import 'package:get/get.dart';
import '../../data/app_connectivity_checker.dart';
import '../../data/firebase/app_firebase_core.dart';
import '../../data/local/app_hive.dart';
import '../../data/local/app_shared_pref.dart';

class AppService extends GetxService {
  Future<AppSharedPref> initSharedPref() async {
    return await AppSharedPref.init();
  }

  Future<void> initHive() async {
    return await AppHive.init();
  }

  Future<AppFirebaseCore> initFirebaseCore() async {
    return await AppFirebaseCore.init();
  }

  Future<AppConnectivityChecker> initConnectivityChecker() async {
    return await AppConnectivityChecker.init();
  }
}
