import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:get/get.dart';
import 'package:linkspace/controller/MeetController.dart';
import 'package:linkspace/utils/AppColors.dart';
class MeetScreen extends StatelessWidget {
  final MeetController meetController =Get.put(MeetController());

  @override
  Widget build(BuildContext context) {
    final jitsiMeet = JitsiMeet();

    jitsiMeet.join(
      JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: meetController.callRoom.value,
        userInfo: JitsiMeetUserInfo(displayName: "User"),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryTextColor,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor),
          onPressed: () {
            meetController.endCall();
            Get.offAllNamed('/');
          },
          child: Text('End Call',style: TextStyle(color: AppColors.primaryTextColor),),
        ),
      ),
    );
  }
}
