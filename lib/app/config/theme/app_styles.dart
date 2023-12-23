import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/constants/colors.dart';
import 'app_fonts.dart';

class AppStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool light}) => IconThemeData(
        color: light
            ? ColorConstants.iconColorLight
            : ColorConstants.iconColorDark,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool light}) => AppBarTheme(
        elevation: 0,
        titleTextStyle: getTextTheme(light: light).bodyText1!.copyWith(
              color: Colors.white,
              fontSize: AppFonts.appBarTittleSize,
            ),
        iconTheme: IconThemeData(
            color: light
                ? ColorConstants.appBarIconsColorLight
                : ColorConstants.appBarIconsColorDark),
        backgroundColor: light
            ? ColorConstants.appBarColorLight
            : ColorConstants.appBarColorDark,
      );

  static ButtonThemeData getButtonTheme({required bool light}) =>
      ButtonThemeData(
          buttonColor: light
              ? ColorConstants.buttonColorLight
              : ColorConstants.backgroundColorDark,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.normal);

  static SnackBarThemeData getSnackBarThemeData({required bool light}) =>
      SnackBarThemeData(
          contentTextStyle: (AppFonts.headlineTextStyle).copyWith(
              fontSize: AppFonts.headline3TextSize,
              fontWeight: FontWeight.bold,
              color: light
                  ? ColorConstants.largTxtLight
                  : ColorConstants.largTxtDark));

  ///text theme
  static TextTheme getTextTheme({required bool light}) =>
      TextTheme(
        displayLarge: (AppFonts.headlineTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),
        displayMedium: (AppFonts.headlineTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),
        displaySmall: (AppFonts.headlineTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),

        //--------------------------------------------//
        headlineLarge: (AppFonts.headlineTextStyle).copyWith(
            fontSize: AppFonts.headline1TextSize,
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),
        headlineMedium: (AppFonts.headlineTextStyle).copyWith(
            fontSize: AppFonts.headline2TextSize,
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),
        headlineSmall: (AppFonts.headlineTextStyle).copyWith(
            fontSize: AppFonts.headline3TextSize,
            fontWeight: FontWeight.bold,
            color: light
                ? ColorConstants.largTxtLight
                : ColorConstants.largTxtDark),

        //--------------------------------------------//
        titleLarge: (AppFonts.titleTextStyle).copyWith(
            fontWeight: FontWeight.w800,
            fontSize: AppFonts.title1TextSize,
            color: light
                ? ColorConstants.titleTxtLight
                : ColorConstants.titleTxtDark),
        titleMedium: (AppFonts.titleTextStyle).copyWith(
            fontWeight: FontWeight.w600,
            fontSize: AppFonts.title2TextSize,
            color: light
                ? ColorConstants.titleTxtLight
                : ColorConstants.titleTxtDark),
        titleSmall: (AppFonts.titleTextStyle).copyWith(
            fontSize: AppFonts.title3TextSize,
            color: light
                ? ColorConstants.titleTxtLight
                : ColorConstants.titleTxtDark),

        //--------------------------------------------//

        labelLarge: (AppFonts.labelTextStyle).copyWith(
            fontSize: AppFonts.labelLarg,
            color: light
                ? ColorConstants.labelTxtLight
                : ColorConstants.labelTxtDark),
        labelMedium: (AppFonts.labelTextStyle).copyWith(
            fontSize: AppFonts.labelMeduim,
            color: light
                ? ColorConstants.labelTxtLight
                : ColorConstants.labelTxtDark),
        labelSmall: (AppFonts.labelTextStyle).copyWith(
            fontSize: AppFonts.labelSmall,
            color: light
                ? ColorConstants.labelTxtLight
                : ColorConstants.labelTxtDark),
        //--------------------------------------------//

        bodyLarge: (AppFonts.bodyTextStyle).copyWith(
            fontSize: AppFonts.bodyLarg,
            color: light
                ? ColorConstants.bodyTxtLight
                : ColorConstants.bodyTxtDark),
        bodyMedium: (AppFonts.bodyTextStyle).copyWith(
            fontSize: AppFonts.bodyMeduim,
            color: light
                ? ColorConstants.bodyTxtLight
                : ColorConstants.bodyTxtDark),
        bodySmall: (AppFonts.bodyTextStyle).copyWith(
            fontSize: AppFonts.bodySmall,
            color: light
                ? ColorConstants.subTitleTxtLight
                : ColorConstants.subTitleTxDark),
      );

  static ChipThemeData getChipTheme({required bool light}) {
    return ChipThemeData(
        backgroundColor: light
            ? ColorConstants.chipBackgroundLight
            : ColorConstants.chipBackgroundDark,
        brightness: Brightness.light,
        labelStyle: getChipTextStyle(light: light),
        secondaryLabelStyle: getChipTextStyle(light: light));
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool light}) {
    return AppFonts.chipTextStyle.copyWith(
      fontSize: AppFonts.chipTextSize,
      color: light
          ? ColorConstants.chipTextColorLight
          : ColorConstants.chipTextColorDark,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool light,
      {bool isBold = true,
      double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return AppFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? AppFonts.buttonTextSize,
              color: light
                  ? ColorConstants.buttonTextColor
                  : ColorConstants.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return AppFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? AppFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: light
                  ? ColorConstants.buttonDisabledTextColor
                  : ColorConstants.buttonDisabledTextColor);
        }
        return AppFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? AppFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: light
                ? ColorConstants.buttonTextColor
                : ColorConstants
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool light}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(light),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return light
                    ? ColorConstants.buttonColor.withOpacity(0.5)
                    : ColorConstants.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return light
                    ? ColorConstants.buttonDisabledColor
                    : ColorConstants.buttonDisabledColor;
              }
              return light
                  ? ColorConstants.buttonColor
                  : ColorConstants.buttonColor; // Use the component's default.
            },
          ),
        ),
      );

  static CardTheme getCardTheme({required bool light}) {
    return CardTheme(
      color: light
          ? ColorConstants.cardColorLight
          : ColorConstants.cardColorDark,
      // Add other card theme properties as needed
    );
  }

}
