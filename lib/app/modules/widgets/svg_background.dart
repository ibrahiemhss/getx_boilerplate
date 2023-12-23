import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/local/app_shared_pref.dart';

class SvgBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        AppSharedPref.getThemeIsLight()?'assets/svgs/background.svg':
        'assets/svgs/darkBackground.svg',
        fit: BoxFit.fitHeight,
        semanticsLabel: 'Image',
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
