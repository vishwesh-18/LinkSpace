import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:linkspace/HomeScreen.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Logger logger = Logger();
  // Get the FCM token
  Future<String?> getFCMToken() async {
    try {
      // Get the device's FCM token
      String? token = await _firebaseMessaging.getToken();
      logger.i("FCM Token: $token");

      // Return the token (you can use this token to send notifications)
      return token;
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }

  // Request notification permission
  Future<void> requestPermission() async {
    print("Requesting notification permission");

    // Check permission status
    PermissionStatus status = await Permission.notification.status;

    if (status.isGranted) {
      print("Permission already granted");
    } else {
      await Future.delayed(Duration(seconds: 1));
      await Permission.notification.request();

      // Check again after requesting permission
      PermissionStatus newStatus = await Permission.notification.status;
      if (newStatus.isGranted) {
        print("Permission granted");
      } else {
        print("Permission denied");
      }
    }

    // Request permission via Firebase Messaging for iOS
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      sound: true,
    );

    // You can check the result if needed
    print("Notification permission status: ${settings.authorizationStatus}");
  }

  Future<void> initlocalNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_luncher");
    var initilizationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(initilizationSettings,
        onDidReceiveNotificationResponse: (payload) {
      handleMessage(context, message);
        });
  }

  void firebaseInit(
    BuildContext context,
  ) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (kDebugMode) {
        print(notification?.title);
        print(notification?.body);
      }

      initlocalNotification(context, message);
    shownotification(message);
    });
  }

  //background and terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && message.data != null) {
        handleMessage(context, message);
      }
    });
  }

  Future<void> handleMessage(BuildContext context, RemoteMessage) async {
    Get.offAll(HomeScreen());
  }

  Future<void> shownotification(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.high,
      playSound: true,
    );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString()
        ,channelDescription: "chanel Description",
        importance: Importance.high,
        playSound: true,
        );
    // Future.delayed(Duration.zero,(){
    //   _flutterLocalNotificationsPlugin.show(0, message.notification!.title, message.notification!.body, notificationDetails,payload: "mydata")
    // });



  }
}
