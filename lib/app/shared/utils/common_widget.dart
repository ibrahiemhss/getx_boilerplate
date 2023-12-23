import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routes/app_pages.dart';
import '../constants/colors.dart';

class CommonWidget {
  static AppBar appBar(
      BuildContext context, String title, IconData? backIcon, Color color,
      {void Function()? callback}) {
    return AppBar(
      leading: backIcon == null
          ? null
          : IconButton(
              icon: Icon(backIcon),
              onPressed: () {
                if (callback != null) {
                  callback();
                } else {
                  Get.offAndToNamed(Routes.HOME);
                }
              },
            ),
      title: Text(
        title,
        style:
            Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 22),
      ),
      backgroundColor: Theme.of(context).hoverColor,
      elevation: 0.0,
    );
  }

  static SizedBox rowHeight({double height = 30}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static void toast(String msg, BuildContext? context) async {
    FToast fToast = FToast();
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(
            msg,
            style: context != null
                ? Theme.of(context).textTheme.titleSmall
                : TextStyle(
                    fontFamily: GoogleFonts.tajawal().fontFamily,
                    fontSize: 18,
                    color: ColorConstants.greenDark),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
      content: toast,
    ));
  }
}
