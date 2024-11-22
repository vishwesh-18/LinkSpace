import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:get/get.dart';
import 'package:linkspace/controller/MeetController.dart';
import 'package:linkspace/utils/AppColors.dart';
class MeetScreen extends StatefulWidget {
  final String meetingId;
  MeetScreen({required this.meetingId});
  @override
  State<MeetScreen> createState() => _MeetScreenState();
}

class _MeetScreenState extends State<MeetScreen> {
  final MeetController meetController =Get.put(MeetController());

  @override
  void initState() {
    meetController.startCall(widget.meetingId);
    super.initState();
  }
  @override
   build(BuildContext context)  {
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
