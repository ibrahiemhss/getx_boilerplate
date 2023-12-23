import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/local/app_shared_pref.dart';
import '../../shared/constants/colors.dart';
import 'dark_theme.dart';
import 'light_theme.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static getThemeData({required bool isLight}) {

    if(!isLight){
      return DarkTheme.themeData();
    }else{
      return LightTheme.themeData();
    }
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme(){
    bool themeIsLight = AppSharedPref.getThemeIsLight();

    AppSharedPref.setThemeIsLight(!themeIsLight);
    Get.changeTheme( AppTheme.getThemeData(isLight: !themeIsLight));

    // *) let GetX change theme
    if(!AppSharedPref.getThemeIsLight()){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: ColorConstants.primaryColorDark, // navigation bar color
        statusBarColor: ColorConstants.primaryColorDark, // status bar color
      ));
    }else{
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: ColorConstants.greenAccentDark, // navigation bar color
        statusBarColor: ColorConstants.green, // status bar color
      ));
    }
   // Get.changeThemeMode(!light ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => AppSharedPref.getThemeIsLight();

  static customGradientBackGround() {
    bool isLight = AppSharedPref.getThemeIsLight();
    return isLight
        ? ColorConstants.customGradientBackGroundLight
        : ColorConstants.customGradientBackGroundDark;
  }

  static customGradientCard() {
    bool isLight = AppSharedPref.getThemeIsLight();
    return isLight
        ? ColorConstants.customGradientCardLight
        : ColorConstants.customGradientCardDark;
  }

  static gradient() {
    bool isLight = AppSharedPref.getThemeIsLight();
    return isLight ? ColorConstants.gradientLight : ColorConstants.gradientDark;
  }
}
