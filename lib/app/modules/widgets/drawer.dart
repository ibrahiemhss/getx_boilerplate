import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';
import '../../shared/utils/app_keys.dart';
import '../../shared/utils/size_config.dart';
import '../main_start/main_controller.dart';
import 'drawer-tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, required this.controller}) : super(key: key);
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: Theme.of(context).drawerTheme.surfaceTintColor,
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).drawerTheme.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).drawerTheme.backgroundColor,
                    ),
                    child: Container(
                      width: SizeConfig().screenWidth,
                      height: SizeConfig().screenWidth / 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox.fromSize(
                              size: Size.fromRadius(20),
                              child: Image.asset(
                                "assets/images/app_icon.png",
                                fit: BoxFit.contain,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            /*  DrawerTile(
                title: Strings.language.tr,
                icon: MaterialIcons.language,
                onTap: () {
                  if (AppKeys.mainKey.currentState != null) {
                    AppKeys.mainKey.currentState!.closeDrawer();
                  }
                  controller.showLanguageDialog();
                },
              ),*/

              DrawerTile(
                title: Strings.theme.tr,
                icon: MaterialCommunityIcons.theme_light_dark,
                onTap: () {
                  if (AppKeys.mainKey.currentState != null) {
                    AppKeys.mainKey.currentState!.closeDrawer();
                  }
                  controller.setTheme();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                child: Text('${Strings.version.tr}${" : 0.0.1"}'),
              )
              // Divider(),
              // DrawerTile(
              //   title: "Logout",
              //   icon: Icons.logout,
              //   onTap: () {
              //     Navigator.of(context).pushNamed(Routes.initRoute);
              //   },
              // ),
            ])));
  }
}
