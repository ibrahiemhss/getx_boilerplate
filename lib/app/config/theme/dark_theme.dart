import 'package:flutter/material.dart';
import '../../shared/constants/colors.dart';
import 'app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DarkTheme {
  static themeData() {
    return  ThemeData(
        primaryColor: ColorConstants.primaryColorDark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ColorConstants.accentColorDark, // Your accent color
          background: ColorConstants.backgroundColorDark,
          onBackground: ColorConstants.backgroundColorDark,
          primary: ColorConstants.primaryColorDark,
          onPrimary: ColorConstants.primaryColorDark,
          brightness: Brightness.dark,
        ),
        focusColor:  ColorConstants.accentColorDark,
        // text theme
        textTheme: TextTheme(
          displayLarge: (AppFonts.headlineTextStyle).copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),
          displayMedium: (AppFonts.headlineTextStyle).copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),
          displaySmall: (AppFonts.headlineTextStyle).copyWith(
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),

          //--------------------------------------------//
          headlineLarge: (AppFonts.headlineTextStyle).copyWith(
              fontSize: AppFonts.headline1TextSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),
          headlineMedium: (AppFonts.headlineTextStyle).copyWith(
              fontSize: AppFonts.headline2TextSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),
          headlineSmall: (AppFonts.headlineTextStyle).copyWith(
              fontSize: AppFonts.headline3TextSize,
              fontWeight: FontWeight.bold,
              color: ColorConstants.largTxtDark),

          //--------------------------------------------//
          titleLarge: (AppFonts.titleTextStyle).copyWith(
              fontWeight: FontWeight.w800,
              fontSize: AppFonts.title1TextSize,
              color: ColorConstants.titleTxtDark),
          titleMedium: (AppFonts.titleTextStyle).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: AppFonts.title2TextSize,
              color: ColorConstants.titleTxtDark),
          titleSmall: (AppFonts.titleTextStyle).copyWith(
              fontSize: AppFonts.title3TextSize,
              color: ColorConstants.titleTxtDark),

          //--------------------------------------------//

          labelLarge: (AppFonts.labelTextStyle).copyWith(
              fontSize: AppFonts.labelLarg,
              color: ColorConstants.labelTxtDark),
          labelMedium: (AppFonts.labelTextStyle).copyWith(
              fontSize: AppFonts.labelMeduim,
              color: ColorConstants.labelTxtDark),
          labelSmall: (AppFonts.labelTextStyle).copyWith(
              fontSize: AppFonts.labelSmall,
              color: ColorConstants.labelTxtDark),
          //--------------------------------------------//

          bodyLarge: (AppFonts.bodyTextStyle).copyWith(
              fontSize: AppFonts.bodyLarg,
              color:  ColorConstants.bodyTxtDark),
          bodyMedium: (AppFonts.bodyTextStyle).copyWith(
              fontSize: AppFonts.bodyMeduim,
              color: ColorConstants.bodyTxtDark),
          bodySmall: (AppFonts.bodyTextStyle).copyWith(
              fontSize: AppFonts.bodySmall,
              color: ColorConstants.subTitleTxtDark),
        ),

        // color contrast (if the theme is dark text should be white for example)
        brightness: Brightness.dark,
        // card widget background color
        cardColor: ColorConstants.cardColorDark,
        // hint text color
        hintColor:ColorConstants.hintTxtDark,
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
                  ColorConstants.cardColorDark
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          surfaceTintColor: ColorConstants.cardColorDark
        ),
        menuButtonTheme: MenuButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color?>(
                ColorConstants.cardColorDark
            ),
          ),
        ),
        // divider color
        dividerColor: ColorConstants.dividerColorDark,
        // app background color
        backgroundColor: ColorConstants.backgroundColorDark,
        scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColorDark,

        // progress bar theme
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: ColorConstants.primaryColorDark,
        ),

        // appBar theme
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: AppFonts.appBarTittleSize,
          ),
          iconTheme: IconThemeData(
              color:ColorConstants.appBarIconsColorDark),
          backgroundColor: ColorConstants.appBarColorDark,
        ),

        // elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
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
            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return AppFonts.buttonTextStyle.copyWith(
                      fontWeight:  FontWeight.normal,
                      fontSize:AppFonts.buttonTextSize,
                      color:ColorConstants.buttonTextColor);
                } else if (states.contains(MaterialState.disabled)) {
                  return AppFonts.buttonTextStyle.copyWith(
                      fontSize: AppFonts.buttonTextSize,
                      fontWeight:  FontWeight.normal,
                      color: ColorConstants.buttonDisabledTextColor);
                }
                return AppFonts.buttonTextStyle.copyWith(
                    fontSize: AppFonts.buttonTextSize,
                    fontWeight:FontWeight.normal,
                    color: ColorConstants.buttonTextColor); // Use the component's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorConstants.buttonColor.withOpacity(0.5);
                } else if (states.contains(MaterialState.disabled)) {
                  return ColorConstants.buttonDisabledColor;
                }
                return ColorConstants.buttonColor; // Use the component's default.
              },
            ),
          ),
        ),

        // chip theme
        chipTheme: ChipThemeData(
            backgroundColor:  ColorConstants.chipBackgroundDark,
            brightness: Brightness.dark,
            labelStyle: TextStyle(fontSize: AppFonts.chipTextSize,
                color: ColorConstants.chipTextColorDark),
            secondaryLabelStyle:  TextStyle(fontSize: AppFonts.chipTextSize,
                color: ColorConstants.chipTextColorDark)),
        // icon theme
        iconTheme: IconThemeData(
          color:ColorConstants.iconColorDark,
        ),
        buttonTheme: ButtonThemeData(
            buttonColor:ColorConstants.buttonColorDark,
            shape: RoundedRectangleBorder(),
            textTheme: ButtonTextTheme.normal),
        snackBarTheme: SnackBarThemeData(
            contentTextStyle: (AppFonts.headlineTextStyle).copyWith(
                fontSize: AppFonts.headline3TextSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtDark)),
        cardTheme: CardTheme(color: ColorConstants.white),
        expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: ColorConstants.expansionTileBackGroundDark
    ),

        bannerTheme:MaterialBannerThemeData(
            backgroundColor:ColorConstants.bannerThemeDark
        ),
      drawerTheme: DrawerThemeData(
        backgroundColor: ColorConstants.greenDown5Dark,
          surfaceTintColor: ColorConstants.greenDown4Dark,
      )
    );
  }
}
