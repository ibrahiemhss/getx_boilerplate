import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';
import '../../shared/utils/app_keys.dart';
import '../../shared/utils/size_config.dart';

class AppHeader extends StatelessWidget {
  const AppHeader(
      {Key? key,
      this.onOpenSearch,
      this.onSearchTextChanged,
      this.searchController,
      this.openedSearch,
      this.showSearch = false,
      this.showBarBody = false,
      this.showBack = false,
      this.bodyContent,
      this.elevation = 10,
      this.backCallback,
      this.showDrawer = false})
      : super(key: key);
  final Function(bool?)? onOpenSearch;
  final Function(String?)? onSearchTextChanged;
  final TextEditingController? searchController;
  final bool? openedSearch;
  final bool? showBack;
  final bool? showSearch;
  final Function()? backCallback;
  final bool? showBarBody;
  final double? elevation;
  final Widget? bodyContent;
  final bool? showDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig().screenWidth,
      child: Container(
        height: SizeConfig().screenHeight * 0.08,
        width: SizeConfig().screenWidth * 0.1,
        margin: EdgeInsets.only(left: 2, right: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            showDrawer!
                ? InkWell(
                    onTap: () {
                        Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      child: Container(
                        alignment: Alignment.center,
                        height: SizeConfig().screenHeight * 0.062,
                        width: SizeConfig().screenWidth * 0.080,
                        child: Icon(
                          AntDesign.menu_unfold,
                          size: 32,
                        ),
                      ),
                    ),
                  )
                : showBack!
                    ? InkWell(
                        onTap: () {
                          if (backCallback != null) {
                            backCallback!();
                          } else {
                            Get.offAndToNamed(Routes.HOME);
                          }
                        },
                        child: Container(
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig().screenHeight * 0.062,
                            width: SizeConfig().screenWidth * 0.080,
                            child: Icon(
                              MaterialIcons.arrow_forward_ios,
                            ),
                          ),
                        ),
                      )
                    : Container(),
            showSearch! && !showBarBody!
                ? Center(
                    child: Container(
                        color: Theme.of(context).hoverColor,
                        height: SizeConfig().screenHeight * 0.062,
                        width: showDrawer! || showBack!
                            ? SizeConfig().screenWidth * 0.85
                            : SizeConfig().screenWidth * 0.98,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: TextField(
                              cursorColor: Theme.of(context).focusColor,
                              controller: searchController,
                              onChanged: onSearchTextChanged,
                              decoration: InputDecoration(
                                  prefixIcon: !openedSearch!
                                      ? IconButton(
                                          icon: const Icon(Icons.search),
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          onPressed: () {
                                            onOpenSearch!(true);
                                          },
                                        )
                                      : IconButton(
                                          icon: const Icon(Icons.clear),
                                          color:
                                              Theme.of(context).iconTheme.color,
                                          onPressed: () {
                                            onOpenSearch!(false);
                                          },
                                        ),
                                  hintText:
                                      !openedSearch! ? Strings.search.tr : "",
                                  border: InputBorder.none),
                            ))),
                  )
                : !showBarBody!
                    ? Container(
                        color: Colors.transparent,
                        width: showDrawer! || showBack!
                            ? SizeConfig().screenWidth * 0.85
                            : SizeConfig().screenWidth * 0.95,
                      )
                    : Container(
                        height: SizeConfig().screenHeight * 0.062,
                        width: showDrawer! || showBack!
                            ? SizeConfig().screenWidth * 0.85
                            : SizeConfig().screenWidth * 0.95,
                        decoration: BoxDecoration(
                            color: Theme.of(context).hoverColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: bodyContent == null
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, right: 8),
                                child: bodyContent,
                              )),
          ],
        ),
      ),
    );
  }
}
