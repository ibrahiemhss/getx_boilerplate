import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/api/api_repository.dart';
import '../../data/local/app_hive.dart';
import '../../data/local/app_shared_pref.dart';
import '../../data/models/MainData/main_data.dart';
import '../../data/models/home/home_data.dart';
import '../../shared/utils/utils.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;

  HomeController({required this.apiRepository});

  TextEditingController searchController = new TextEditingController();
  var homeData = Rxn<HomeData>();

  // api call status
  late bool themeIsLight;
  var loading = true.obs;

  @override
  void onInit() {
    themeIsLight = AppSharedPref.getThemeIsLight();
    loadHomeData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  //----------------------------------------------------------------------------
  onAboutMainContentsExpanded(bool expanded) {
    homeData.value!.about.isExpanded = expanded;
    homeData.refresh();
    refresh();
  }

  //----------------------------------------------------------------------------
  onAboutTabExpanded(bool expanded, int index) {
    homeData.value!.about.mainContents.body.tabs[index].isExpanded = expanded;
    homeData.refresh();
    refresh();
  }

  onAboutContentExpanded(
    bool expanded,
    int tabeIndex,
    int contenIndex,
  ) {
    homeData.value!.about.mainContents.body.tabs[tabeIndex]
        .contents![contenIndex].isExpanded = expanded;
    homeData.refresh();
    refresh();
  }

  //----------------------------------------------------------------------------
  void loadHomeData() async {
    loading.value = true;
    loading.refresh();

    AppHive.mainDataBox.watch(key: AppHive.currentMainDataKey).listen((event) {
      MainData mainData = event.value;
      if(Utils.isLocalAr()){
        homeData.value = AppHive.getMainData()!.homeData;

      }else{
        homeData.value = AppHive.getMainData()!.homeData;

      }
      homeData.refresh();
      loading.value = false;
      loading.refresh();
      refresh();
    });

    if(homeData.value==null){
      if(Utils.isLocalAr()){
        homeData.value = AppHive.getMainData()!.homeData;

      }else{
        homeData.value = AppHive.getMainData()!.homeData;

      }
      homeData.refresh();
      loading.value = false;
      loading.refresh();
      refresh();
    }
  }
  //----------------------------------------------------------------------------
  void setState(Function() fun) {
    fun();
    refresh();
  }

  getSaved() async {
    themeIsLight = AppSharedPref.getThemeIsLight();
  }
}
