import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/theme/app_theme.dart';
import '../../config/translations/localization_service.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/api/api_repository.dart';
import '../../data/app_connectivity_checker.dart';
import '../../data/local/app_hive.dart';
import '../../data/local/app_shared_pref.dart';
import '../../data/models/MainData/main_data.dart';
import '../../data/models/response/users_response.dart';
import '../../routes/app_pages.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/utils/navigator_helper.dart';
import '../../shared/utils/size_config.dart';
import '../../shared/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home_screen.dart';
import '../widgets/blurry_dalog.dart';

enum MainTabs { main, home, s1, s2, s3 }

class MainController extends GetxController {
  final ApiRepository apiRepository;

  MainController({required this.apiRepository});


  List<dynamic>? searchList = [];
  var openListSearch = false.obs;
  var openedSearch = false.obs;
  var screenTitle = Strings.home.tr.obs;

  var currentTab = MainTabs.home.obs;
  var currentHeader = MainTabs.main.obs;
  var users = Rxn<UsersResponse>();
  var user = Rxn<Datum>();
  var isLight = Rxn<bool>();
  var showLegaDoc = Rxn<bool>();
  late HomeScreen homeScreen;

  TextEditingController searchController = new TextEditingController();


  @override
  void onInit() async {
    super.onInit();
    homeScreen = HomeScreen();
  }

  //----------------------------------------------------------------------------
  onSearchTextChanged(String text) async {
    searchList!.clear();
    if (text.isEmpty) {
      refresh();
      return;
    }
    refresh();
  }

  //----------------------------------------------------------------------------
  void setTheme() {
    AppTheme.changeTheme();
  }

  //----------------------------------------------------------------------------
  bool getIsLight() {
    isLight.value = AppSharedPref.getThemeIsLight();
    return isLight.value!;
  }

  //----------------------------------------------------------------------------
  onOpenSearch(bool isOpened) {
    openedSearch(isOpened);
    if (!isOpened) {
      openListSearch(isOpened);
      searchController.text = "";
    }
    refresh();
  }

  //----------------------------------------------------------------------------
  showLanguageDialog() {
    BlurryDialog alert = BlurryDialog(
      title: Strings.changeLanguage.tr,
      listWidget:  LocalizationService
          .supportedLanguages.entries.map((entry) {
        return TextButton(
          child: Text(entry.value.languageCode=='ar'?Strings.arabic.tr:Strings.english.tr,
              style: Theme.of(Get.context!).textTheme.headlineSmall),
          onPressed: () {
            AppSharedPref.setCurrentLanguage(entry.value.languageCode);
            AppSharedPref.setIsReloadDataLaguage(true);
            //Get.toNamed(Routes.SPLASH);
            Navigator.of(Get.context!).pop();
            Phoenix.rebirth(Get.context!);
            refreshData();
          },
        );
      }).toList());
    showDialog(
        context: Get.context!,
        builder: (BuildContext dialogContext) {
          return alert;
        });
  }

  //----------------------------------------------------------------------------
  refreshData() async{
    bool isConnected = await AppConnectivityChecker.isConnected();
    AppSharedPref.setIsReloadDataLaguage(false);
    BlurryDialog alert = BlurryDialog(
      title: Strings.noInternetConnection.tr,
      content: "${Strings.tryToLoadDataAgain.tr} ${Strings.or.tr} ${Strings.skip.tr}",
      continueWarning:Strings.reLoad.tr,
      continueCallBack: () async{
        refresh();
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
    if(!isConnected){
      showDialog(
          context: Get.context!,
          builder: (BuildContext dialogContext) {
            return alert;
          });
    }else{
      String laoding="${AppSharedPref.getCurrentLocal().languageCode=='ar'?'${Strings.loading.tr} ${Strings.data.tr} ${Strings.arabic.tr}...':'${Strings.loading.tr} ${Strings.english.tr} ${Strings.data.tr}...'}";
      apiRepository.loadAllMainData(loading:laoding).then((value) =>{
       //todo load data
      });
    }
  }

  //----------------------------------------------------------------------------
  Widget buildListLanguage() => SingleChildScrollView(
        child: Container(
          height: 20,
          width: 200,
          color: Colors.red,
          child:
                      ListView(
                        shrinkWrap: true,
                        children: [
                          Container(
                              color: Theme.of(Get.context!)
                                  .cardColor
                                  .withOpacity(0.1),
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: LocalizationService
                                      .supportedLanguages.length,
                                  itemBuilder: (context, i) {
                                    return Text(
                                      "AR",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.grey[500]),
                                    );
                                  })),
                        ],
          ),
        ),
      );


  //----------------------------------------------------------------------------
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  //----------------------------------------------------------------------------
  void signout() {
    var prefs = Get.find<SharedPreferences>();
    prefs.clear();
    // Get.back();
    NavigatorHelper.popLastScreens(popCount: 2);
  }

  //----------------------------------------------------------------------------
  void switchTab(index, key) {
    // key.currentState!.setState(() {});
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  //----------------------------------------------------------------------------
  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.s1:
        return 1;
      case MainTabs.s2:
        return 2;
        //  case MainTabs.men_memory:
        return 3;
      case MainTabs.s3:
        return 3;
      default:
        return 0;
    }
  }

  //----------------------------------------------------------------------------
  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        screenTitle.value = Strings.home.tr;
        return MainTabs.home;
      case 1:
        screenTitle.value = "2";
        return MainTabs.s1;
      case 2:
        screenTitle.value = "3";

        return MainTabs.s2;
      // case 3:
      //  return MainTabs.men_memory;
      case 3:
        screenTitle.value = "4";

        return MainTabs.s3;
      default:
        screenTitle.value = Strings.home.tr;

        return MainTabs.home;
    }
  }

  //----------------------------------------------------------------------------
  @override
  void onReady() {
    super.onReady();
  }

  //----------------------------------------------------------------------------
  @override
  void onClose() {
    super.onClose();
  }
}
