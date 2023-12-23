import 'package:get/get.dart';
import '../home/home_controller.dart';
import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainController(apiRepository: Get.find()), permanent: true);
    Get.lazyPut<MainController>(
      () => MainController(apiRepository: Get.find()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(apiRepository: Get.find()),
    );
  }
}
