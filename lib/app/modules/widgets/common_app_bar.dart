import 'package:flutter/material.dart';
import '../../shared/utils/app_bar_height_calc.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final String? route;

  const CommonAppBar({
    Key? key,
    this.title,
    this.leading,
    this.leftWidget,
    this.rightWidget,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = AppBarHeightCalc(
        title: title == null ? "" : title!, width: screenWidth);

    return AppBar(
        titleTextStyle:
            Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        elevation: 1,
        title: Padding(
          padding: EdgeInsets.only(top:title == null?4:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              rightWidget == null ? Container():rightWidget!,
              Text(
                title == null ? "" : title!,
              ),
              leftWidget == null ? Container():leftWidget!,
            ],
          ),
        ),
        toolbarHeight: appBarHeight.calculateHeight(),
        backgroundColor: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: leading != null ? leading : Container());
  }

  static final _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
