import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../config/translations/strings_enum.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/common.dart';
import '../local/app_hive.dart';
import '../local/app_shared_pref.dart';
import '../models/MainData/main_data.dart';
import '../models/home/home_data.dart';
import '../models/request/login_request.dart';
import '../models/request/register_request.dart';
import '../models/response/login_response.dart';
import '../models/response/register_response.dart';
import '../models/response/users_response.dart';
import 'api_provider.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  //----------------------------------------------------------------------------
  Future<void> loadAllMainData({String? loading}) async {
    EasyLoading.show(status: loading!=null?loading:'${Strings.loading.tr}...');
    var _dataRef = FirebaseDatabase.instance.ref("allData");
    _dataRef.once().then((value) {
      var data = Map<dynamic, dynamic>.from(value.snapshot.value as Map);
      var mainData=MainData.fromJson(data);
      AppHive.saveMainDataToHive(mainData);
      EasyLoading.dismiss();
      AppSharedPref.setFirstEntering(false);
      AppSharedPref.setDataLoaded(true);
      Get.toNamed(Routes.MAIN);
    });
  }
  //----------------------------------------------------------------------------

  Future<LoginResponse?> login(LoginRequest data) async {
    final res = await apiProvider.login('/api/login', data);
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(res.body);
    }
  }

  bool loginAdmin(LoginRequest data) {
    return data.password == CommonConstants.adminPassword &&
        data.username == CommonConstants.adminName;
  }

  Future<RegisterResponse?> register(RegisterRequest data) async {
    final res = await apiProvider.register('/api/register', data);
    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(res.body);
    }
  }

  Future<UsersResponse?> getUsers() async {
    try {
      // final res = await apiProvider.getUsers('/api/users?page=1&per_page=12');
      // if (res.statusCode == 200) {
      return null; //UsersResponse.fromJson(res.body);
      // }else{

      // }
    } catch (e) {}
  }

  Future<HomeData?> getHomeData() async {
    var res=null;
    return HomeData.fromJson(res);
  }
}
