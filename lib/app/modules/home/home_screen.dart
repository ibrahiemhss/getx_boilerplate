import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/models/home/about.dart';
import '../../data/models/home/tab_item.dart';
import '../../shared/utils/size_config.dart';
import '../widgets/app_header.dart';
import '../widgets/custom_xpansion_panel_list.dart';
import '../widgets/header_text_title.dart';
import '../widgets/responsive_text.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Center(
          child: Container(
           // key: Get.nestedKey(AppKeys.homeKey),
            height: SizeConfig().screenHeight,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Stack(
                  children: [
                    // GradientBackground(),
                    Container(
                      width: SizeConfig().screenWidth,
                      child: AppHeader(
                        showDrawer: true,
                        showSearch: false,
                        showBarBody: true,
                        elevation: 6,
                        bodyContent:
                            Container(child: HeaderText(txt: Strings.home.tr)),
                      ),
                    ),
                    Container(
                      height: SizeConfig().screenHeight,
                      margin: EdgeInsets.only(
                          top: SizeConfig().screenHeight * 0.09),
                      child: !controller.loading.value?
                      Column(
                        children: [
                           buildListAtricleContent(context),
                        ],
                      ):Center(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

/*
  Widget buildListContent(BuildContext context) => SingleChildScrollView(
      child: Container(
        height: SizeConfig().screenHeight * 0.84,
        child:  ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0,top: 50.0),
              child: Column(
                children: [
                  Label(
                    height:SizeConfig().screenHeight * 0.08,
                    onPress: (){
                      // Navigator.of(context).pushNamed(Routes.DAILY_DETAILS);
                      Get.offAndToNamed(Routes.HOME_DETAILS,parameters: {
                        "title":controller.homeData.value!.about.title,
                        "body":controller.homeData.value!.about.body,
                      });

                    } ,
                    child:  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          controller.homeData.value!.about.miniTitle,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 24,
                          ),
                        ),
                      ),
                    ),

                  ),
                  Label(
                    height:SizeConfig().screenHeight * 0.08,
                    onPress: (){
                      // Navigator.of(context).pushNamed(Routes.DAILY_DETAILS);
                      Get.offAndToNamed(Routes.HOME_DETAILS,parameters: {
                        "title":controller.homeData.value!.curriculum.title,
                        "body":controller.homeData.value!.curriculum.body,
                      });

                    } ,
                    child:  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          controller.homeData.value!.curriculum.miniTitle,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 24,
                          ),
                        ),
                      ),
                    ),

                  ),
                  Label(
                    height:SizeConfig().screenHeight * 0.08,
                    onPress: (){
                      // Navigator.of(context).pushNamed(Routes.DAILY_DETAILS);
                      Get.offAndToNamed(Routes.HOME_DETAILS,parameters: {
                        "title":controller.homeData.value!.sequence.title,
                        "body":controller.homeData.value!.sequence.body,
                      });

                    } ,
                    child:  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          controller.homeData.value!.sequence.miniTitle,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 24,
                          ),
                        ),
                      ),
                    ),

                  ),
                  Label(
                    onPress: (){
                      // Navigator.of(context).pushNamed(Routes.DAILY_DETAILS);
                      Get.offAndToNamed(Routes.HOME_DETAILS,parameters: {
                        "title":controller.homeData.value!.effect.title,
                        "body":controller.homeData.value!.effect.body,
                      });

                    } ,
                    child:  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          controller.homeData.value!.effect.miniTitle,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      ));
*/

/*
  Widget buildListContent(BuildContext context) => SingleChildScrollView(
          child: Container(
        height: SizeConfig().screenHeight * 0.84,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ListView(
            children: [
              AutoScrollText(),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(child: TitleText(txt: "اخر الفعاليات")),
                    Container(
                      margin:const EdgeInsets.only(left:16.0),
                        child: SubTitleText(txt: "مشاهدة الكل")),

                  ],
                ),
              ),
              Container(
                width: SizeConfig().screenWidth,
                height: SizeConfig().screenHeight * 0.8,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.events.value!.events.length,
                    itemBuilder: (BuildContext context, int index) => labelItem(
                        context,
                        controller.events.value!.events[index],
                        index)),
              ),
            ],
          ),
        ),
      ));
  Widget labelItem(BuildContext context, Event event, int index) {
    return  Label(
      height: SizeConfig().screenHeight * 0.15,
          child: Row(
              children: [
                CardLabel(
                  elevation: 24,
                  child: Container(
                    height: SizeConfig().screenHeight * 0.15,
                    width:  SizeConfig().screenWidth * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(event.videoUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width:  SizeConfig().screenWidth * 0.53,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            event.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'مشاهدات : ',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                event.views,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );


      */ /*Container(
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(event.title,
                    style: Theme.of(context).textTheme.copyWith(
                        bodyLarge: ArabicTextStyle(
                            arabicFont: ArabicFont.tajawal,
                            fontSize: 18
                        )
                    ).bodyLarge,
                    //style:AppTheme.getThemeData(isLight: controller.themeIsLight).textTheme,
                ),
              ),
          ),*/ /*
  }*/

  Widget buildListAtricleContent(BuildContext context) => SingleChildScrollView(
        child: Container(
          height: SizeConfig().screenHeight * 0.8,
          child:controller.homeData.value==null?Container(): ListView(
            children: [
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      mainItem(context, controller.homeData.value!.about),
                    ]),
              ),
            ],
          ),
        ),
      );

  Widget mainItem(BuildContext context, About about) {
    return Padding(
      padding: EdgeInsets.only(top:8.0,bottom: SizeConfig().screenHeight*.2),
      child: StatefulBuilder(
          // You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {

        return Container(
          margin: EdgeInsets.only(top: 4),
          child:

          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: SizeConfig().screenWidth * 0.70,
                  margin: EdgeInsets.only(
                      left: 2, right: 2, top: 8, bottom: 6),
                  child: Column(
                    children: [
                      ResponsiveText(
                        text: about.miniTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                            fontSize: 22,
                          //  fontFamily: ArabicFont.avenirArabic
                          //  fontFamily: ArabicFont.elMessiri
                          //  fontFamily: ArabicFont.tajawal
                           fontFamily: GoogleFonts.cairo().fontFamily
                          //  fontFamily: ArabicFont.narmattan
                          //  fontFamily: ArabicFont.mirza
                          // fontFamily: ArabicFont.markaziText
                        ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ReadMoreText(
                    about.mainContents.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: Strings.readMore.tr,
                    trimExpandedText: Strings.less.tr,
                    style: Theme.of(context).textTheme.bodySmall,
                    moreStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                    lessStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ),
                Container(
                  child: Container(
                      color:
                      Theme.of(context).cardColor.withOpacity(0.1),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                          about.mainContents.body.tabs.length,
                          itemBuilder: (context, i) {
                            return listTabsItem(context, i, about);
                          })),
                ),
              ],
            ),
          ],)
        );
      }),
    );
  }

  Widget listTabsItem(BuildContext context, tabeIndex, About about) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 8, right: 8),
      child: CustomExpansionPanelList(
        elevation: 1,
        iconPlaceHolder: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            !about.mainContents.body.tabs[tabeIndex].isExpanded
                ? Strings.showMore.tr
                : Strings.showLess.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey[500]),
          ),
        ),
        animationDuration: Duration(milliseconds: 100),
        headerContainerDirection: Directions.row,
        children: [
          CustomExpansionPanel(
              isExpanded: about.mainContents.body.tabs[tabeIndex].isExpanded,
              canTapOnHeader: true,
              backgroundColor:Theme.of(context).expansionTileTheme.backgroundColor,
              headerBuilder: (context, isExpanded) {
                return Container(
                  margin: EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ResponsiveText(
                            text: about.mainContents.body.tabs[tabeIndex].title,
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontSize: 16)),
                      ),
                    ],
                  ),
                );
              },
              body: Container(
                margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          about.mainContents.body.tabs[tabeIndex].summary ==
                                  null
                              ? Container()
                              : about.mainContents.body.tabs[tabeIndex]
                                          .summary ==
                                      ""
                                  ? Container()
                                  : ResponsiveText(
                                      text: about.mainContents.body
                                          .tabs[tabeIndex].summary!,
                                      textAlign: TextAlign.right,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                    ),
                          ReadMoreText(
                            about.mainContents.body.tabs[tabeIndex].description,
                            trimLines: 2,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: Strings.readMore.tr,
                            trimExpandedText: Strings.less.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                            moreStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.grey),
                            lessStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color:Theme.of(context).expansionTileTheme.backgroundColor!.withOpacity(0.1),
                      child: Container(
                          color: Theme.of(context).cardColor.withOpacity(0.2),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: about.mainContents.body.tabs[tabeIndex]
                                  .contents!.length,
                              itemBuilder: (context, i) {
                                return listContentsItem(context, tabeIndex, i,
                                    about.mainContents.body.tabs[tabeIndex]);
                              })),
                    ),
                  ],
                ),
              ))
        ],
        //dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          controller.onAboutTabExpanded(!isExpanded, tabeIndex);
        },
      ),
    );
  }

  Widget listContentsItem(
      BuildContext context, tabeIndex, contentIndex, TabItem tab) {
    return Container(
      margin: EdgeInsets.only(top: 4, left: 16, right: 16),
      child: CustomExpansionPanelList(
        elevation: 1,
        iconPlaceHolder: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            !tab.contents![contentIndex].isExpanded
                ? Strings.showMore.tr
                : Strings.showLess.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.grey[500]),
          ),
        ),
        animationDuration: Duration(milliseconds: 100),
        headerContainerDirection: Directions.row,
        children: [
          CustomExpansionPanel(
              isExpanded: tab.contents![contentIndex].isExpanded,
              canTapOnHeader: true,
              backgroundColor: Theme.of(context).expansionTileTheme.backgroundColor!.withOpacity(0.8),
              headerBuilder: (context, isExpanded) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig().screenWidth * 0.55,
                      margin:
                          EdgeInsets.only(left: 2, right: 2, top: 8, bottom: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ResponsiveText(
                              text: tab.contents![contentIndex].title,
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                );
              },
              body: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Theme.of(context).expansionTileTheme.backgroundColor!.withOpacity(0.1),
                  margin: EdgeInsets.only(left: 2, right: 2, bottom: 6),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ReadMoreText(
                          tab.contents![contentIndex].description,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: Strings.readMore.tr,
                          trimExpandedText: Strings.less.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                          moreStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color:Theme.of(context)
                              .textTheme
                              .bodySmall!.color),
                          lessStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color:Theme.of(context)
                              .textTheme
                              .bodySmall!.color),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
        //dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          controller.onAboutContentExpanded(
              !isExpanded, tabeIndex, contentIndex);
        },
      ),
    );
  }
}
