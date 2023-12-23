import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';
import '../../data/local/app_shared_pref.dart';
import '../../shared/constants/colors.dart';

class BlurryDialog extends StatelessWidget {
  String title;
  String? content;
  String? continueWarning;
  double blurSigmaX=6;
  double blurSigmaY=6;
  VoidCallback? continueCallBack;
  VoidCallback? cancelCallBack;
  VoidCallback? skipCallBack;

  BlurryDialog(
      {required this.title,
      this.content,
      this.continueWarning,
      this.continueCallBack,
      this.skipCallBack,
      this.titleTextStyle,
      this.contentTextStyle,
      this.continueTextStyle,
      this.listWidget,
        this.blurSigmaX=6,
        this.blurSigmaY=6,
      this.cancelCallBack});

  TextStyle? titleTextStyle;
  TextStyle? contentTextStyle;
  TextStyle? continueTextStyle;
  List<Widget>? listWidget;

  @override
  Widget build(BuildContext context) {
    bool isLight = AppSharedPref.getThemeIsLight();

    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
        child: SimpleDialog(
          backgroundColor: isLight
              ? ColorConstants.greenDown6Light
              : ColorConstants.greenDown6Dark,
          title: new Text(
            title,
            style: titleTextStyle==null?Theme.of(context).textTheme.titleMedium:titleTextStyle,
          ),
          children: listWidget!=null?listWidget!: <Widget>[

            content!=null? Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                content!,
                textAlign: TextAlign.right,
                style: contentTextStyle==null?Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 24):contentTextStyle,
              ),
            ):Container(),

            Row(
              children: [
                continueCallBack != null ? new TextButton(
                  child: new Text(
                    continueWarning == null
                        ? Strings.tocontinue.tr
                        : continueWarning!,
                    style:continueTextStyle==null? Theme.of(context).textTheme.bodyMedium:continueTextStyle,
                  ),
                  onPressed: () {
                    continueCallBack!();
                    Navigator.of(context).pop();
                  },
                ):Container(),
                new TextButton(
                  child: Text(Strings.cancel.tr,
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    if(cancelCallBack!=null){
                      cancelCallBack!();
                    }
                    Navigator.of(context).pop();
                  },
                ),
                skipCallBack != null
                    ? new TextButton(
                  child: Text(Strings.skip.tr,
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () {
                    skipCallBack!();
                    Navigator.of(context).pop();
                  },
                )
                    : Container()
              ],
            )
          ],
        ));
  }
}
