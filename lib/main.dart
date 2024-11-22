import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/LoginScreen.dart';
import 'package:linkspace/MeetScreen.dart';
import 'package:linkspace/SignupScreen.dart';
import 'package:linkspace/firebase_options.dart';



@pragma('vm:entry-point')

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
 FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jitsi Meet App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),

      ],
    );
  }
}
