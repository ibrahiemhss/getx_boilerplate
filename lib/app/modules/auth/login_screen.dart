import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';
import '../../shared/utils/app_keys.dart';
import '../../shared/utils/common_widget.dart';
import '../widgets/border_button.dart';
import '../widgets/gradient_background.dart';
import '../widgets/input_field.dart';
import 'auth_controller.dart';

class LoginScreen extends GetView<AuthController> {
  void gooBack() {
    Get.offAndToNamed(Routes.MAIN);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        GradientBackground(),
        Scaffold(
          key: AppKeys.authInKey,
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.appBar(
              context, Strings.adminLogIn.tr, Icons.arrow_back, Colors.white,
              callback: () {
            gooBack();
          }),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: AppKeys.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InputField(
              controller: controller.loginUserNameController,
              keyboardType: TextInputType.text,
              labelText: Strings.userName.tr,
              placeholder: Strings.enterUsername.tr,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.usernameIsRequired.tr;
                }
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              controller: controller.loginPasswordController,
              keyboardType: TextInputType.emailAddress,
              labelText: Strings.password.tr,
              placeholder: Strings.enterPassword.tr,
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return Strings.passwordIsRequired.tr;
                }

                if (value.length < 6 || value.length > 15) {
                  return Strings.passwordCharactersWarn.tr;
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(height: 80),
            BorderButton(
              text: Strings.signIn.tr,
              backgroundColor: Colors.white,
              callback: () {
                controller.loginAdmin(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
