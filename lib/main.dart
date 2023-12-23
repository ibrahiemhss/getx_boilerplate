import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/config/theme/app_theme.dart';
import 'app/config/translations/localization_service.dart';
import 'app/config/translations/strings_enum.dart';
import 'app/data/app_connectivity_checker.dart';
import 'app/data/firebase/app_firebase_core.dart';
import 'app/data/local/app_hive.dart';
import 'app/data/local/app_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/constants/colors.dart';
import 'app_binding.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ColorConstants.greenDark, // navigation bar color
    statusBarColor: ColorConstants.green, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPref.init();
  await AppHive.init();
  await AppConnectivityChecker.init();
  await AppFirebaseCore.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(Phoenix(
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool themeIsLight = AppSharedPref.getThemeIsLight();
    configLoading(context,themeIsLight);

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, widget) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            enableLog: true,
            initialRoute: Routes.SPLASH,
            defaultTransition: Transition.fade,
            getPages: AppPages.routes,
            initialBinding: AppBinding(),
            smartManagement: SmartManagement.keepFactory,
            title: Strings.appName.tr,
            useInheritedMediaQuery: true,
            theme: AppTheme.getThemeData(isLight: themeIsLight),
            locale: AppSharedPref.getCurrentLocal(),
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            // localization services in app (controller app language)
            builder: EasyLoading.init(),
          );
        });
  }
}

void configLoading(BuildContext context,bool themeIsLight) {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = themeIsLight?EasyLoadingStyle.light:EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..indicatorColor = ColorConstants.green
    ..textColor = themeIsLight?ColorConstants.titleTxtLight:ColorConstants.titleTxtDark
    ..textStyle = Theme.of(context).textTheme.titleLarge!.copyWith(
      color: themeIsLight?ColorConstants.titleTxtLight:ColorConstants.titleTxtDark,
      fontFamily: GoogleFonts.cairo().fontFamily
    )
    ..userInteractions = true
    ..dismissOnTap = false;
}
