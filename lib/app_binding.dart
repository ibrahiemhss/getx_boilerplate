import 'package:get/get.dart';
import 'app/data/api/api_provider.dart';
import 'app/data/api/api_repository.dart';
import 'app/data/firebase/firebase_provider.dart';
import 'app/data/firebase/firebase_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(ApiProvider(), permanent: true);
    Get.put(FirebaseProvider(), permanent: true);
    Get.put(ApiRepository(apiProvider: Get.find()), permanent: true);
    Get.put(FirebaseRepository(firebaseProvider: Get.find()), permanent: true);
  }
}
