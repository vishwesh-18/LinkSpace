import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/HomeScreen.dart';
import 'package:linkspace/MeetScreen.dart';

void main() async {

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
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/call', page: () => MeetScreen()),
      ],
    );
  }
}
