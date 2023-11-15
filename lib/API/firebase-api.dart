// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:healthotech/main.dart';

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;
  // function to initialize notifications
  Future<void> initNotifications() async {
    // request user for notification permission
    await _firebaseMessaging.requestPermission();
    // fetch the FCM token for the device
    final fCMToken = await _firebaseMessaging.getToken();
    // printing the token
    log('Token $fCMToken');
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed('navigator-route', arguments: message);
  }

  // function to handle notifications when app is terminated and closed
  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
