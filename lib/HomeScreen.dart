import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkspace/controller/MeetController.dart';
import 'package:linkspace/utils/AppColors.dart';

class HomeScreen extends StatelessWidget {
  final MeetController meetController = Get.put(MeetController());
  final roomController = TextEditingController();

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
              controller: roomController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Room Name',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonColor),
              onPressed: () {
                final room = roomController.text.trim();
                if (room.isNotEmpty) {
                  meetController.startCall(room);
                  Get.toNamed('/call');
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
