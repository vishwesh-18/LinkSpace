import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/Service/FcmService.dart';
import 'package:linkspace/Service/NotificationService.dart';
import 'package:linkspace/controller/MeetController.dart';
import 'package:linkspace/utils/AppColors.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MeetController meetController = Get.put(MeetController());

  final roomController = TextEditingController();
  final emailController = TextEditingController();
  NotificationService notificationService = NotificationService();

  Logger logger = Logger();

  @override
  void initState() {
    notificationService.requestPermission();
    FcmService.firebaseinit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryTextColor,
          centerTitle: true,
          title: Text(
            'LinkSpace',
            style: TextStyle(color: AppColors.primaryBackground),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFF9900), width: 2),
                ),
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            // TextField(
            //   controller: roomController,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(color: Color(0xFFFF9900), width: 2),
            //     ),
            //     labelText: 'Enter Room Name',
            //   ),
            // ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor),
              onPressed: () {
                final room = roomController.text.trim();
                final email = emailController.text.trim();
                if (room.isNotEmpty||email.isNotEmpty) {
                  meetController.startCall(email);
                  meetController.getUserDetailsByEmail(email);
                  logger.i(meetController.fcmToken.value);
                  logger.i(meetController.username.value);
                 // Get.toNamed('/call');
                }
              },
              child: Text(
                'Start Call',
                style: TextStyle(color: AppColors.primaryTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
