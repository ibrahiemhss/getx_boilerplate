import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config/translations/strings_enum.dart';
import '../../data/api/api_repository.dart';
import '../../data/local/app_shared_pref.dart';
import '../../data/models/request/login_request.dart';
import '../../data/models/request/register_request.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/storage.dart';
import '../../shared/utils/app_keys.dart';
import '../../shared/utils/common_widget.dart';
import '../../shared/utils/focus.dart';

class AuthController extends GetxController {
  final ApiRepository apiRepository;

  AuthController({required this.apiRepository});

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final registerEmailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();
  bool registerTermsChecked = false;

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginUserNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void register(BuildContext context) async {
    AppFocus.unfocus(context);
    if (registerFormKey.currentState!.validate()) {
      if (!registerTermsChecked) {
        CommonWidget.toast('Please check the terms first.', context);
        return;
      }

      final res = await apiRepository.register(
        RegisterRequest(
          email: registerEmailController.text,
          password: registerPasswordController.text,
        ),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        print('Go to Home screen>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      }
    }
  }

  void login(BuildContext context) async {
    AppFocus.unfocus(context);
    if (AppKeys.loginFormKey.currentState!.validate()) {
      final res = await apiRepository.login(
        LoginRequest(
            email: loginEmailController.text,
            password: loginPasswordController.text,
            username: loginUserNameController.text),
      );

      final prefs = Get.find<SharedPreferences>();
      if (res!.token.isNotEmpty) {
        prefs.setString(StorageConstants.token, res.token);
        Get.toNamed(Routes.HOME);
      }
    }
  }

  void loginAdmin(BuildContext context) {
    AppFocus.unfocus(context);
    if (AppKeys.loginFormKey.currentState!.validate()) {
      final isAdmin = apiRepository.loginAdmin(
        LoginRequest(
            email: loginEmailController.text,
            password: loginPasswordController.text,
            username: loginUserNameController.text),
      );
      AppSharedPref.setAdminAccess(isAdmin);

      if (isAdmin) {
        CommonWidget.toast(Strings.loginSucceeded.tr, context);
        /*       final snackBar = SnackBar(
          content: const Text('Yay! A SnackBar!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
      } else {
        CommonWidget.toast(Strings.loginFailed.tr, context);
      }
      Get.offAndToNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
    print("-------------- onClose AUTH");

    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
