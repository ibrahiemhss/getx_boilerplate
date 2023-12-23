import 'package:flutter/material.dart';
import 'package:getx_boilerplate/app/modules/widgets/svg_image.dart';

class WidgetBtnBack extends StatelessWidget {
  EdgeInsets padding;

  WidgetBtnBack({this.padding = const EdgeInsets.only(left: 12, right: 10)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: padding,
        child: MySvgImage(
          width: 19,
          height: 16,
          path: 'assets/svgs/ic_back.svg',
        ),
      ),
    );
  }
}
