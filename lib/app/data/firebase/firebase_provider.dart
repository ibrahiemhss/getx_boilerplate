import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb;

import '../local/app_shared_pref.dart';

class FirebaseProvider {
  late DatabaseReference diwanRef = FirebaseDatabase.instance.ref('diwan');
  late StreamSubscription<DatabaseEvent> diwanSubscription;

  Future<void> init() async {
    final database = FirebaseDatabase.instance;
    database.setLoggingEnabled(false);
    if (!kIsWeb) {
      database.setPersistenceEnabled(true);
      database.setPersistenceCacheSizeBytes(10000000);
    }
    if (!kIsWeb) {
      await diwanRef.keepSynced(true);
    }
    AppSharedPref.setFirebaseDatabaseInitalized(true);
  }
}
