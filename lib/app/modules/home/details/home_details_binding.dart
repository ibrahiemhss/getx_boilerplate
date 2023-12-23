import 'package:get/get.dart';
import 'home_details_controller.dart';

class HomeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDetailsController>(
      () => HomeDetailsController(apiRepository: Get.find()),
    );
  }
}
