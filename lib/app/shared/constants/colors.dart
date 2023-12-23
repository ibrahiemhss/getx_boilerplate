import 'package:flutter/material.dart';

class ColorConstants {
  static const Color white = Color(0xFFFFFFFF);
  static const Color white2 = Color(0xFFF8F8F8);
  static const Color white3 = Color(0xFFF5F5F5);
  static const Color white4 = Color(0xFFF3F3F3);

  static const Color grey = Color(0Xff00000017);
  static const Color grey2 = Color(0XffEFEFEF);
  static const Color black = Color(0Xff000000);

  static const Color primaryColorLight = Colors.white;
  static const Color primaryColorDark = Colors.black;
  static const Color green = Color(0xff2CB52C);
  static const Color greenDark = Color(0xFF004700);
  static const Color greenDarkTxt = Color(0xFF006006);
  static const Color greyTxt = Color(0xFF707070);
  static const Color greyTxt2 = Color(0xFF0000001A);

  static const Color accentColorLight = green;
  static const Color accentColorDark = greenDown6Light;

  static const Color focusColorLight = green;
  static const Color focusColorDark = Colors.white;

  static const Color greenAccentLight = Color(0xFF70FF70);
  static const Color greenDownLight = Color(0xFF9CCC9C);
  static const Color greenDown1Light = Color(0xFFA7D2A7);
  static const Color greenDown2Light = Color(0xFFB6D5B6);
  static const Color greenDown3Light = Color(0xFFBDDABD);
  static const Color greenDown4Light = Color(0xFFD8ECD8);
  static const Color greenDown5Light = Color(0xFFE7F6E7);
  static const Color greenDown6Light = Color(0xFFEFFAEF);
  static const Color greenDown7Light = Color(0xFFF3FAF3);
  static const Color greenDown8Light = Color(0xFFFAFDFA);

  static const Color greenAccentDark = Color(0xFF529A52);
  static const Color greenDownDark = Color(0xFF6D8A6D);
  static const Color greenDown1Dark = Color(0xFF637A63);
  static const Color greenDown2Dark = Color(0xFF5A695A);
  static const Color greenDown3Dark = Color(0xFF637263);
  static const Color greenDown4Dark = Color(0xFF616561);
  static const Color greenDown5Dark = Color(0xFF4C504C);
  static const Color greenDown6Dark = Color(0xFF454945);
  static const Color greenDown7Dark = Color(0xFF3C3D3C);
  static const Color greenDown8Dark = Color(0xFF383A38);
  //APPBAR
  static const Color appBarColorLight = primaryColorLight;
  static const Color appBarColorDark = primaryColorDark;

  //SCAFFOLD
  static const Color scaffoldBackgroundColorLight = Colors.white;
  static const Color backgroundColorLight = greenDown6Light;
  static const Color dividerColorLight = Color(0xff686868);
  static const Color cardColorLight = greenDown5Light;

  static const Color scaffoldBackgroundColorDark = Color(0xff171d2d);
  static const Color backgroundColorDark = greenDown6Dark;
  static const Color dividerColorDark = Color(0xffffffff);
  static const Color cardColorDark = greenDown5Dark;

  static const Color buttonColor = Color(0xFF3DC15F);
  static const Color buttonTextColor = Color(0xFF3DC15F);
  static const Color buttonDisabledColor = Colors.grey;
  static const Color buttonDisabledTextColor = Colors.black;

  //TEXT
  static const Color largTxtLight = green;
  static const Color mediumTxtLight = greenDarkTxt;
  static const Color titleTxtLight = greenDarkTxt;
  static const Color bodyTxtLight = black;
  static const Color labelTxtLight = green;
  static const Color subTitleTxtLight = Color(0xff686868);
  static const Color subTitleTxtDark = Color(0xfff1f1f1);

  static const Color hintTxtLight = greyTxt;

  static const Color largTxtDark = white;
  static const Color mediumTxtDark = white2;
  static const Color titleTxtDark = white3;
  static const Color bodyTxtDark = white4;
  static const Color labelTxtDark = white2;
  static const Color subTitleTxDark = white3;
  static const Color hintTxtDark = greyTxt;

  //ICONS
  static const Color appBarIconsColorLight = green;
  static const Color iconColorLight = greenDark;

  static const Color appBarIconsColorDark = Colors.white;
  static const Color iconColorDark = white4;

  //BUTTON
  static const Color buttonColorLight = Color(0xFF3DC15F);
  static const Color buttonTextColorLight = Color(0xFF3DC15F);
  static const Color buttonDisabledColorLight = Colors.grey;
  static const Color buttonDisabledTextColorLight = Colors.black;

  static const Color buttonColorDark = primaryColorDark;
  static const Color buttonTextColorDark = white;
  static const Color buttonDisabledColorDark = Colors.grey;
  static const Color buttonDisabledTextColorDark = Colors.black;

  //chip
  static const Color chipBackgroundLight = primaryColorLight;
  static const Color chipTextColorLight = Colors.black87;

  static const Color chipBackgroundDark = primaryColorDark;
  static const Color chipTextColorDark = Colors.white;

//expansionTileTheme
  static const Color expansionTileBackGroundLight = greenDown5Light;
  static const Color expansionTileBackGroundDark = greenDown5Dark;
//bannerTheme
  static const Color bannerThemeLight = greenDown7Light;
  static const Color bannerThemeDark = greenDown7Dark;


  // progress bar indicator
  static const Color progressIndicatorColorLight = Color(0xFF40A76A);
  static List<Color> gradientLight = [
    ColorConstants.greenDown8Light,
    ColorConstants.greenDown7Light,
    ColorConstants.greenDown6Light,
    ColorConstants.greenDown5Light
  ];
  static final List<Color> gradientBackgroundLight = [
    ColorConstants.greenDown5Light,
    ColorConstants.greenDown5Light,
  ];
  static List<Color> gradientBackgroundDark = [
    ColorConstants.greenDown5Dark,
    ColorConstants.greenDown5Dark,
  ];
  static List<List<Color>> customGradientBackGroundLight = [
    [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
    [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
    [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
    [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
  ];

  static List<List<Color>> customGradientCardLight = [
    [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
    [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
    [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
    [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
  ];

  static List<Color> gradientRed = [
    Colors.red,
    Colors.redAccent,
  ];

  // progress bar indicator
  static const Color progressIndicatorColorDark = Color(0xFF40A76A);

  static List<List<Color>> customGradientBackGroundDark = [
    [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
    [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
    [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
    [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
  ];

  static List<List<Color>> customGradientCardDark = [
    [hexToColor('#2BA99F'), hexToColor('#22CC9E')],
    [hexToColor('#2BA99F'), hexToColor('#3BCDAD')],
    [hexToColor('#3CC8AE'), hexToColor('#22C69E')],
    [hexToColor('#55D5B1'), hexToColor('#54D9B1')]
  ];

  static List<Color> gradientDark = [
    ColorConstants.greenDown5Dark,
    ColorConstants.greenDown4Dark,
    ColorConstants.greenDown3Dark,
    ColorConstants.greenDown2Dark
  ];

  static Color hexToColor(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
        'hex color must be #rrggbb or #rrggbbaa');

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }
}
