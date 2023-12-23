import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/local/app_shared_pref.dart';

class AppFonts {
  // return the right font depending on app language
  static TextStyle get getHeaderTextStyle => AppSharedPref.getHeaderTextFont();

  static TextStyle get getTitleTextStyle => AppSharedPref.getTitleTextFont();

  static TextStyle get getBodyTextStyle => AppSharedPref.getBodyTextFont();

  static TextStyle get getChipTextStyle => AppSharedPref.getChipTextFont();

  static TextStyle get getAppBarTextStyle => AppSharedPref.getAppBarTextFont();

  // headlines text font
  static TextStyle get headlineTextStyle => AppSharedPref.getHeaderTextFont();

  static TextStyle get titleTextStyle => AppSharedPref.getTitleTextFont();

  // body text font
  static TextStyle get bodyTextStyle => AppSharedPref.getBodyTextFont();

  // body text font
  static TextStyle get labelTextStyle => AppSharedPref.getLabelTextFont();

  // button text font
  static TextStyle get buttonTextStyle => AppSharedPref.getButtonTextFont();

  // app bar text font
  static TextStyle get appBarTextStyle => AppSharedPref.getAppBarTextFont();

  // chips text font
  static TextStyle get chipTextStyle => AppSharedPref.getChipTextFont();

  // appbar font size
  static double get appBarTittleSize => 18.sp;

  // body font size
  static double get body1TextSize => 13.sp;

  static double get body2TextSize => 13.sp;

  // headlines font size
  static double get headline1TextSize => 50.sp;

  static double get headline2TextSize => 40.sp;

  static double get headline3TextSize => 30.sp;

  static double get title1TextSize => 24.sp;

  static double get title2TextSize => 18.sp;

  static double get title3TextSize => 14.sp;

  // body font size
  static double get bodyLarg => 16.sp;

  static double get bodyMeduim => 15.sp;

  static double get bodySmall => 14.sp;

  // label font size
  static double get labelLarg => 16.sp;

  static double get labelMeduim => 15.sp;

  static double get labelSmall => 14.sp;

  //button font size
  static double get buttonTextSize => 16.sp;

  //caption font size
  static double get captionTextSize => 13.sp;

  //chip font size
  static double get chipTextSize => 10.sp;
}
