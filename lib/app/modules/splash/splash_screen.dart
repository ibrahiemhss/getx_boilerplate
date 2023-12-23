import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_boilerplate/app/modules/splash/splash_controller.dart';
import '../../../generated/assets.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/local/app_shared_pref.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/size_config.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppSharedPref.getThemeIsLight()?ColorConstants.scaffoldBackgroundColorLight:ColorConstants.scaffoldBackgroundColorDark,
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: controller.animate.value ?  SizeConfig().screenHeight*0.5 : SizeConfig().screenHeight ,
              left: controller.animate.value ? SizeConfig().screenWidth*0.5 : SizeConfig().screenWidth*0.5,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: controller.animate.value ? 1 : 0,
                child: ClipOval(
                    child: Image(
                        height: SizeConfig().screenWidth * 0.4,
                        width: SizeConfig().screenWidth * 0.4,
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.imagesLogo))),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: controller.animate.value ? 18 : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: controller.animate.value ? 1 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.appName,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
