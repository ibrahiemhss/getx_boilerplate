import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../shared/utils/size_config.dart';
import '../../widgets/app_header.dart';
import '../../widgets/gradient_background.dart';
import 'home_details_controller.dart';

class HomeDetailsScreen extends GetView<HomeDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Container(
           // key: Get.nestedKey(AppKeys.homeDetailsKey),
            height: SizeConfig().screenHeight,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Stack(
                  children: [
                    GradientBackground(),
                    controller.homeData.value == null
                        ? Container()
                        : Padding(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                controller.homeData.value == null
                                    ? Center()
                                    : _buildContent(context),
                              ],
                            ),
                          ),
                    AppHeader(
                      showDrawer: false,
                      showSearch: false,
                      showBarBody: false,
                      showBack: true,
                      elevation: 6,
                      backCallback: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildContent(BuildContext context) {
    return Container(
        height: SizeConfig().screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 72, top: 24),
              child: _content(context),
            )
          ],
        ));
  }

  Widget _content(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Text(
              Get.parameters['title']!,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontFamily: GoogleFonts.lato().fontFamily
                      //  fontFamily: ArabicFont.elMessiri
                      //  fontFamily: ArabicFont.tajawal
                      // fontFamily: ArabicFont.scheherazade
                      //  fontFamily: ArabicFont.narmattan
                      //  fontFamily: ArabicFont.mirza
                      // fontFamily: ArabicFont.markaziText
                      ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Text(
            Get.parameters['body']!,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                // fontFamily: ArabicFont.elMessiri
                //  fontFamily: ArabicFont.tajawal
                // fontFamily: ArabicFont.scheherazade
                //  fontFamily: ArabicFont.narmattan
                //  fontFamily: ArabicFont.mirza
                // fontFamily: ArabicFont.markaziText
                ),
          ),
        ],
      ),
    );
  }
}
