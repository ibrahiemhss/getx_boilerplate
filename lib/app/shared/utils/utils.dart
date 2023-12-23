import 'dart:math';

import 'package:get/get.dart';
import '../../data/local/app_shared_pref.dart';
class Utils {

  static bool isLocalAr() {
    return AppSharedPref.getCurrentLocal().languageCode=='ar';
  }
  static String string(String txt,int length) {
    if (txt.length >= length) {
      return "${txt.substring(0, max(txt.length - (txt.length / 4).toInt(), 0)).trim()} .. ";
    } else {
      return txt;
      // return whatever you want
    }
  }

  static void navigateToScreen(
      {required  title,
      required String route,
      Map<String, String>? parameters,
      dynamic arguments}) {
    Get.toNamed(route,
        parameters:parameters,
        arguments: arguments);

  }
}
