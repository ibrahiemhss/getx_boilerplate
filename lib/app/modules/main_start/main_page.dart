import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/local/app_hive.dart';
import '../../shared/utils/app_keys.dart';
import '../../shared/utils/size_config.dart';
import '../widgets/drawer.dart';
import '../widgets/gradient_background.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  //final homeKey=  LabeledGlobalKey<ScaffoldState>( 'GlobalKey #home ');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return PopScope(
      onPopInvoked: (v) => false,
      child: Obx(() => _buildWidget(context)),
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackground(),
          _buildContent(controller.currentTab.value),
        ],
      ),
      drawer: AppDrawer(controller: controller,),
      bottomNavigationBar: BottomNavigationBar(
            items: [
              _buildNavigationBarItem(
                  Strings.home.tr, Icon(MaterialCommunityIcons.home)),
              _buildNavigationBarItem("2",
                  Icon(MaterialCommunityIcons.book_open_page_variant)),
              _buildNavigationBarItem("3",
                  Icon(FontAwesome5Solid.praying_hands)),
              _buildNavigationBarItem(
                  "4", Icon(FontAwesome5Solid.book_reader))
            ],
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Theme.of(context).disabledColor,
            currentIndex:
                controller.getCurrentIndex(controller.currentTab.value),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 8, fontWeight: FontWeight.w900),
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
            onTap: (index) => controller.switchTab(index, AppKeys.mainKey),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    print(tab);
    switch (tab) {
      case MainTabs.home:
        return controller.homeScreen;
      case MainTabs.s1:
        return Container();
      case MainTabs.s2:
        return Container();
        // case MainTabs.men_memory:
       // return controller.memoryScreen;
      case MainTabs.s3:
        return Container();
      default:
        return controller.homeScreen;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
  }

}
