import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';
import '../../shared/utils/enums.dart';

class AppFontPopupMenu extends StatelessWidget {
  final ValueChanged<TextMenuItem>? onSelectedCallback;

  AppFontPopupMenu({
    this.onSelectedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return  PopupMenuButton<TextMenuItem>(
        onSelected: onSelectedCallback,
        surfaceTintColor: Colors.black,
        itemBuilder: (BuildContext context) {
          return
            <PopupMenuEntry<TextMenuItem>>[
              PopupMenuItem<TextMenuItem>(
                value: TextMenuItem.fontSize,
                child: Container(
                  color: Colors.transparent,
                  child: Text(
                    Strings.fontSize.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              PopupMenuItem<TextMenuItem>(
                value: TextMenuItem.fontType,
                child: Container(
                  color: Colors.transparent,
                  child: Text(
                    Strings.fontType.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ];
        }

    );
  }
}
