import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'my_app.dart';

bool enableUseAPI=false;
Future main() async {
  WidgetsBinding widgetsBinding =WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final FirebaseOptions firebaseOptions = (Platform.isIOS || Platform.isMacOS)
      ? const FirebaseOptions(
        appId: '1:792369039500:ios:8871b8024994295da793a9',
        apiKey: 'AIzaSyCIQmx_l-wlyX1ozpbC0H_WuAU5_P8cdOk',
        messagingSenderId: "792369039500",
        projectId: 'fir-golang-test'
      )
      : const FirebaseOptions(
      apiKey: "AIzaSyD4RH36G7TDZnrzqhTVWKYoHrSwUaPhwYE",
      appId: "1:792369039500:android:7011f4666b415a37a793a9",
      messagingSenderId: "792369039500",
      projectId: "fir-golang-test");
  await Firebase.initializeApp(
      name: 'Final-project',
      options: firebaseOptions).whenComplete(() async {
    String token = await FirebaseMessaging.instance.getToken()??'';
    debugPrint('FCM KEY: $token');
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundMessageHandler);
    FlutterNativeSplash.remove();
  });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> firebaseBackgroundMessageHandler(RemoteMessage message) async {
  int t=1;
}