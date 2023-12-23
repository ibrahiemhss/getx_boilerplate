import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/app_connectivity_checker.dart';
import '../../data/firebase/firebase_repository.dart';
import '../../data/local/app_hive.dart';
import '../../data/local/app_shared_pref.dart';
import '../../data/models/MainData/main_data.dart';
import '../../routes/app_pages.dart';
import '../../shared/utils/common_widget.dart';
import '../widgets/blurry_dalog.dart';

class SplashController extends GetxController {
  static SplashController get find => Get.find();

  final FirebaseRepository firebaseRepository;
  SplashController({required this.firebaseRepository}) {
  }
  RxBool animate = false.obs;
  RxBool connected = false.obs;
  var lastTimeLoaded = Rxn<DateTime>();

  @override
  void onInit() async {
    startGetData();
    super.onInit();
  }
  @override
  void onReady() async {
    super.onReady();
    startGetData();
  }
  //----------------------------------------------------------------------------
  BlurryDialog alertRefresh() {
    BlurryDialog alert = BlurryDialog(
      title: Strings.noInternetConnection.tr,
      content: "${Strings.tryToLoadDataAgain.tr} ${Strings.or.tr} ${Strings.skip.tr}",
      continueWarning:Strings.reLoad.tr,
      continueCallBack: () async{
        startGetData();
      },
      cancelCallBack: () {
        refresh();
      },
      skipCallBack: (){
        MainData? mainData=AppHive.getMainData();
        if(mainData==null){
          CommonWidget.toast(Strings.dataHasNotBeenDownloadedCompletely.tr, Get.context!);

        }else{
          Future.delayed(Duration(seconds: 1), () {
            Get.toNamed(Routes.MAIN);
          });
        }
      },
    );
    return alert;
  }
  //----------------------------------------------------------------------------

  startGetData() async{
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    AppSharedPref.setIsReloadDataLaguage(false);
    if(AppSharedPref.isFirstEntering()){
      loadData();
    }else{
      if(getTimeLoadedDef(AppSharedPref.getLastDataLoadedTime()) > 1){
        loadData();
      }else{
        await  Future.delayed(Duration(seconds: 60), () {
          Get.toNamed(Routes.MAIN);
        });
      }
    }
    //await Future.delayed(Duration(seconds: 30));
    //await Future.delayed(const Duration(milliseconds: 5000));
  }

  loadData() async{
    bool isConnected = await AppConnectivityChecker.isConnected();
    if(!isConnected){
      showDialog(
          context: Get.context!,
          builder: (BuildContext dialogContext) {
            return alertRefresh();
          });
    }else{
      firebaseRepository.loadAllMainData();
    }
  }
 int getTimeLoadedDef(String loadedTime){
    DateTime b = DateTime.now();
    Duration difference = b.difference(DateTime.parse(loadedTime));

    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    print("---loadedTimeDifferencesValues------- $days day(s) $hours hour(s) $minutes minute(s) $seconds second(s).");

    return minutes;
  }
}
