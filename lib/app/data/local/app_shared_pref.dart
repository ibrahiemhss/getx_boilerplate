import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../config/translations/localization_service.dart';
import '../../shared/constants/fonts.dart';
import '../api/constants.dart';

class AppSharedPref {
  // get storage
  static late final GetStorage _storage;

  // STORING KEYS
  static const String _api_type = 'api_type';
  static const String _firebase_database_initalized =
      '_firebase_database_initalized';
  static const String _first_enter = 'first_enter';
  static const String _last_data_loaded_time = 'last_data_loaded_time';
  static const String _data_loaded = 'data_loaded';

  static const String _admin = 'admin_access';
  static const String _mainDatd = 'admin_access';

  static const String _fcmTokenKey = 'fcm_token';
  static const String _currentLocalKey = 'current_local';
  static const String _reloadDataLaguage = '_reload_data_laguage';

  static const String _currentFontKey = 'current_font';
  static const String _lightThemeKey = 'is_theme_light';

  /// init get storage services
  static init() async {
    await GetStorage.init();
    _storage = GetStorage();
  }


  static void setFirstEntering(bool isFirstEntering) => _storage.write(_first_enter, isFirstEntering);

  static bool isFirstEntering() => _storage.read(_first_enter) ?? true;

  static void setDataLoaded(bool value) => _storage.write(_data_loaded, value);

  static bool isDataLoaded() => _storage.read(_data_loaded) ?? true;

  static void setApiType(int type) => _storage.write(_api_type, type);

  static int getApiType() => _storage.read(_api_type) ?? Constants.baseApi;

  static void setAdminAccess(bool isAdmin) => _storage.write(_admin, isAdmin);

  static bool isAdminAccess() => _storage.read(_admin) ?? false;

  static void setLastDataLoadedTime(String time) => _storage.write(_last_data_loaded_time, time);

  static String getLastDataLoadedTime() => _storage.read(_last_data_loaded_time) ?? DateTime.now().toIso8601String();

  static void setFirebaseDatabaseInitalized(bool v) =>
      _storage.write(_firebase_database_initalized, v);

  static bool isFirebaseDatabaseInitalized() =>
      _storage.read(_firebase_database_initalized) ?? false;

  static void setThemeIsLight(bool lightTheme) =>
      _storage.write(_lightThemeKey, lightTheme);

  static bool getThemeIsLight() => _storage.read(_lightThemeKey) ?? true;

  static void setFonts(String font) => _storage.write(_currentFontKey, font);

  static TextStyle getHeaderTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.headerTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.headerTextFont,
    );
  }

  static TextStyle getTitleTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.titleTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.titleTextFont,
    );
  }

  static TextStyle getBodyTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.bodyTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.bodyTextFont,
    );
  }

  static TextStyle getLabelTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.labelTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.labelTextFont,
    );
  }

  static TextStyle getButtonTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.buttonTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.buttonTextFont,
    );
  }

  static TextStyle getChipTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.chipTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.chipTextFont,
    );
  }

  static TextStyle getAppBarTextFont() {
    String? langCode = _storage.read(_currentLocalKey);

    if (langCode == null) {
      return TextStyle(
        fontFamily: FontsConstants.appBarTextFont,
      );
    }
    return TextStyle(
      fontFamily: FontsConstants.appBarTextFont,
    );
  }


  static void setIsReloadDataLaguage(bool load) =>
      _storage.write(_reloadDataLaguage, load);

  static bool getIsReloadDataLaguage() {
    bool? isReload = _storage.read(_reloadDataLaguage);
    // default language is english
    if (isReload == null) {
      return false;
    }
    return isReload;
  }
  static void setCurrentLanguage(String languageCode) =>
      _storage.write(_currentLocalKey, languageCode);

  static Locale getCurrentLocal() {
    String? langCode = _storage.read(_currentLocalKey);
    // default language is english
    if (langCode == null) {
      return LocalizationService.defaultLanguage;
    }
    return LocalizationService.supportedLanguages[langCode]!;
  }

  static void setFcmToken(String token) => _storage.write(_fcmTokenKey, token);

  static String? getFcmToken() => _storage.read(_fcmTokenKey);

  static void serverToken(String token) => _storage.write(_fcmTokenKey, token);

  static String? getServerToken() => _storage.read(_fcmTokenKey);
}
