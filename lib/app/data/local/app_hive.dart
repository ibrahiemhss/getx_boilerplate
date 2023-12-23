import 'package:hive_flutter/hive_flutter.dart';
import '../models/MainData/main_data.dart';
import '../models/home/body_home.dart';
import '../models/home/home_data.dart';
import '../models/home/main_contents.dart';
import '../models/home/tab_content.dart';
import '../models/home/tab_item.dart';
import '../models/user/user_model.dart';

class AppHive {

  // hive box to store user data
  static late Box<UserModel> userBox;
  static late Box<MainData> mainDataBox;
  // box name its like table name
  static const String mainDataBoxName = 'mainData';
  static const String favoritesBoxName = 'favorites';
  static const String userBoxName = 'user';

  // store current user as (key => value)
  static const String currentUserKey = 'local_user';
  static const String currentMainDataKey = 'mainData';
  static const String currentFavoritesKey = 'favorites';

  /// initialize local db (HIVE)
  static Future<void> init({Function(HiveInterface)? registerAdapters}) async {
    await Hive.initFlutter();
    await registerAdapters?.call(Hive);
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(HomeDataAdapter());
    Hive.registerAdapter(BodyHomeAdapter());
    Hive.registerAdapter(MainContentsAdapter());
    Hive.registerAdapter(TabItemAdapter());
    Hive.registerAdapter(TabContentAdapter());
  }
  /// initialize main box
  //----------------------------------------------------------------------------
  static Future<void> _initMainDataBox() async {
    mainDataBox = await Hive.openBox(mainDataBoxName);
  }
  /// save all remote data to database
  //----------------------------------------------------------------------------
  static Future<bool> saveMainDataToHive(MainData mainData) async {
    try {
      await mainDataBox.put(currentMainDataKey, mainData);
      return true;
    } catch (error) {
      return false;
    }
  }
  /// get current saved data
  //----------------------------------------------------------------------------
  static MainData? getMainData() {
    try {
      MainData dd=mainDataBox.get(currentMainDataKey)!;
      return dd;
    } catch (error) {
      return null;
    }
  }
}
