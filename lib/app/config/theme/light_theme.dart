import 'package:flutter/material.dart';
import '../../shared/constants/colors.dart';
import 'app_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightTheme {
  static themeData() {
      return  ThemeData(
          primaryColor: ColorConstants.primaryColorLight,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: ColorConstants.accentColorLight, // Your accent color
            background: ColorConstants.backgroundColorLight,
            onBackground: ColorConstants.backgroundColorLight,
            primary: ColorConstants.primaryColorLight,
            onPrimary: ColorConstants.primaryColorLight,
            brightness: Brightness.light,
          ),
          focusColor:  ColorConstants.accentColorLight,
          // text theme
          textTheme: TextTheme(
            displayLarge: (AppFonts.headlineTextStyle).copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),
            displayMedium: (AppFonts.headlineTextStyle).copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),
            displaySmall: (AppFonts.headlineTextStyle).copyWith(
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),

            //--------------------------------------------//
            headlineLarge: (AppFonts.headlineTextStyle).copyWith(
                fontSize: AppFonts.headline1TextSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),
            headlineMedium: (AppFonts.headlineTextStyle).copyWith(
                fontSize: AppFonts.headline2TextSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),
            headlineSmall: (AppFonts.headlineTextStyle).copyWith(
                fontSize: AppFonts.headline3TextSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.largTxtLight),

            //--------------------------------------------//
            titleLarge: (AppFonts.titleTextStyle).copyWith(
                fontWeight: FontWeight.w800,
                fontSize: AppFonts.title1TextSize,
                color: ColorConstants.titleTxtLight),
            titleMedium: (AppFonts.titleTextStyle).copyWith(
                fontWeight: FontWeight.w600,
                fontSize: AppFonts.title2TextSize,
                color: ColorConstants.titleTxtLight),
            titleSmall: (AppFonts.titleTextStyle).copyWith(
                fontSize: AppFonts.title3TextSize,
                color: ColorConstants.titleTxtLight),

            //--------------------------------------------//

            labelLarge: (AppFonts.labelTextStyle).copyWith(
                fontSize: AppFonts.labelLarg,
                color: ColorConstants.labelTxtLight),
            labelMedium: (AppFonts.labelTextStyle).copyWith(
                fontSize: AppFonts.labelMeduim,
                color: ColorConstants.labelTxtLight),
            labelSmall: (AppFonts.labelTextStyle).copyWith(
                fontSize: AppFonts.labelSmall,
                color: ColorConstants.labelTxtLight),
            //--------------------------------------------//

            bodyLarge: (AppFonts.bodyTextStyle).copyWith(
                fontSize: AppFonts.bodyLarg,
                color:  ColorConstants.bodyTxtLight),
            bodyMedium: (AppFonts.bodyTextStyle).copyWith(
                fontSize: AppFonts.bodyMeduim,
                color: ColorConstants.bodyTxtLight),
            bodySmall: (AppFonts.bodyTextStyle).copyWith(
                fontSize: AppFonts.bodySmall,
                color: ColorConstants.subTitleTxtLight),
          ),

          // color contrast (if the theme is dark text should be white for example)
          brightness: Brightness.light,
          // card widget background color
          cardColor: ColorConstants.cardColorLight,

          menuTheme: MenuThemeData(
            style: MenuStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                  ColorConstants.cardColorLight
              ),
            ),
          ),
          popupMenuTheme: PopupMenuThemeData(
              surfaceTintColor: ColorConstants.cardColorLight
          ),
          menuButtonTheme: MenuButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color?>(
                  ColorConstants.cardColorLight
              ),
            ),
          ),
          // hint text color
          hintColor:ColorConstants.hintTxtLight,
          // divider color
          dividerColor: ColorConstants.dividerColorLight,
          // app background color
          backgroundColor: ColorConstants.backgroundColorLight,
          scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColorLight,

          // progress bar theme
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: ColorConstants.primaryColorLight,
          ),

          // appBar theme
          appBarTheme: AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: AppFonts.appBarTittleSize,
            ),
            iconTheme: IconThemeData(
                color:ColorConstants.appBarIconsColorLight),
            backgroundColor: ColorConstants.appBarColorLight,
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
              backgroundColor:  ColorConstants.chipBackgroundLight,
              brightness: Brightness.light,
              labelStyle: TextStyle(fontSize: AppFonts.chipTextSize,
                  color: ColorConstants.chipTextColorLight),
              secondaryLabelStyle:  TextStyle(fontSize: AppFonts.chipTextSize,
                  color: ColorConstants.chipTextColorLight)),
          // icon theme
          iconTheme: IconThemeData(
            color:ColorConstants.iconColorLight,
          ),
          buttonTheme: ButtonThemeData(
              buttonColor:ColorConstants.buttonColorLight,
              shape: RoundedRectangleBorder(),
              textTheme: ButtonTextTheme.normal),
          snackBarTheme: SnackBarThemeData(
              contentTextStyle: (AppFonts.headlineTextStyle).copyWith(
                  fontSize: AppFonts.headline3TextSize,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.largTxtLight)),
          cardTheme: CardTheme(color: ColorConstants.white),
        expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: ColorConstants.expansionTileBackGroundLight
        ),

          bannerTheme:MaterialBannerThemeData(
            backgroundColor:ColorConstants.bannerThemeLight
        ),
          drawerTheme: DrawerThemeData(
          backgroundColor: ColorConstants.greenDown5Light,
            surfaceTintColor: ColorConstants.greenDown4Light,

          )
      );
  }
}
