import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';
import '../local/app_hive.dart';
import '../local/app_shared_pref.dart';
import '../models/MainData/main_data.dart';
import 'firebase_provider.dart';

class FirebaseRepository {
  FirebaseRepository({required this.firebaseProvider});

  final FirebaseProvider firebaseProvider;

  //----------------------------------------------------------------------------
  loadAllMainData() async {
    EasyLoading.show(status: '${Strings.loading.tr}...');
    var _dataRef = FirebaseDatabase.instance.ref("allData");
    _dataRef.once().then((value) {
      var data = Map<dynamic, dynamic>.from(value.snapshot.value as Map);
      var mainData=MainData.fromJson(data);
      AppHive.saveMainDataToHive(mainData);
      EasyLoading.dismiss();
      AppSharedPref.setFirstEntering(false);
      AppSharedPref.setDataLoaded(true);
      AppSharedPref.setLastDataLoadedTime(DateTime.now().toIso8601String());
      Future.delayed(Duration(seconds: 5), () {
        Get.toNamed(Routes.MAIN);
      });
    });
  }
}
