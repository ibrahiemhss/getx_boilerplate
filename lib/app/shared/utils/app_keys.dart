import 'package:flutter/material.dart';

class AppKeys {
  static Key splashKey = const Key('__SPLASH_KEY__');
  static final List<GlobalObjectKey<FormState>> formKeyList = List.generate(10, (index) => GlobalObjectKey<FormState>(index));

  static GlobalKey<ScaffoldState> mainKey = GlobalKey<ScaffoldState>();

  static LabeledGlobalKey<FormState> authInKey =
      LabeledGlobalKey<FormState>('GlobalKey #SignIn ');
  static  LabeledGlobalKey<FormState> loginFormKey =
      LabeledGlobalKey<FormState>('GlobalFormKey #SignIn ');
  static final homeKey = const Key('__HOME_KEY__');
  static final homeDetailsKey =const Key('__HOME_DEIALS_KEY__');
  static final diwanKey = const Key('__DIWAN_KEY__');
  static final poetKey = const Key('__POETKEY__');
  static final dailyKey = const Key('__DIALY_KEY__');
  static final dailyDetailsKey = const Key('__DIALY_DEIALS_KEY__');
  static final moreKey = const Key('__MORE_KEY__');
  static final libraryKey = const Key('__LIBRARY_KEY__');
  static final moreDetailsKey = const Key('__LIBRARY_DEIALS_KEY__');
  static final booksKey = const Key('__BOOKS_KEY__');
  static final booksDetailsKey = const Key('__BOOKS_DEIALS_KEY__');
  static final memoryKey = const Key('__SPLASH_KEY__');
  static final mediaKey = const Key('__SPLASH_KEY__');

  static final riKey1 = const Key('__RIKEY1__');
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}
