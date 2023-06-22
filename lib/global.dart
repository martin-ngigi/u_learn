import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:u_learn/common/service/storage_service.dart';

import 'firebase_options.dart';

class Global{
  static late StorageService storageService;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform /// This is optional
    );

    /// print fcm token
    final fcmToken = await FirebaseMessaging.instance.getToken();
    print(" ----------> [Global] FCM token $fcmToken");

    storageService = await StorageService().init();
  }
}