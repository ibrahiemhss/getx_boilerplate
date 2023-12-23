import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../modules/auth/auth_binding.dart';
import '../modules/auth/login_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/main_start/main_binding.dart';
import '../modules/main_start/main_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_screen.dart';


part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.MAIN,
        page: () => MainPage(),
        binding: MainBinding(),
        children: [
          GetPage(name: Routes.HOME, page: () => HomeScreen()),
        ]),
  ];
}
