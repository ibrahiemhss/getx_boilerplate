import 'package:get/get.dart';
import '../../../data/api/api_repository.dart';
import '../../../data/local/app_shared_pref.dart';
import '../../../data/models/home/home_data.dart';
import '../../../routes/app_pages.dart';

class HomeDetailsController extends GetxController {
  final ApiRepository apiRepository;

  HomeDetailsController({required this.apiRepository});

  var homeData = Rxn<HomeData>();

  // api call status
  late bool themeIsLight;
  var loading = true.obs;

  @override
  void onInit() {
    themeIsLight = AppSharedPref.getThemeIsLight();
    loadData();
    super.onInit();
  }

  @override
  void onReady() {
    loadData();
    super.onReady();
  }

  void gooBack() {
    Get.offAndToNamed(Routes.MAIN);
  }

  Future<void> loadData() async {
    loading.value = true;
    homeData.value = await apiRepository.getHomeData();
    loading.value = false;
    homeData.refresh();
    refresh();
  }

  void setState(Function() fun) {
    fun();
    refresh();
  }

  getSaved() async {
    themeIsLight = AppSharedPref.getThemeIsLight();
  }
}
