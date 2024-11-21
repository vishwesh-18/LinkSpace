import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:logger/logger.dart';

class MeetController extends GetxController {
  var isInCall = false.obs;
  var callRoom = ''.obs;
  var fcmToken = ''.obs;
  var username = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final jitsiMeet = JitsiMeet();
  Logger logger = Logger();

  // Function to retrieve token and name from Firestore using email ID
  Future<void> getUserDetailsByEmail(String email) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(email).get();

      if (userDoc.exists) {
        print("getting");
        final data = userDoc.data() as Map<String, dynamic>?;
        if (data != null) {
          final token = data['token'] as String?;
          final name = data['name'] as String?;

          if (token != null && name != null) {
            fcmToken.value = token;
            username.value = name;
          }
        }
      } else {
        print("No user found with email: $email");
      }
    } catch (e) {
      // Handle any errors
      print("Error fetching user details: $e");
    }
  }

  Future<void> startCall(String room) async {
    logger.i(room);
    callRoom.value = room;
    isInCall.value = true;

    try {
      JitsiMeetConferenceOptions options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.ffmuc.net/",
        room: room, // The room name
        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject": "LinkSpace",
          "enableLobby": false,
        },

        featureFlags: {
          "unsaferoomwarning.enabled": false,
          "security-options.enabled": false
        },
        userInfo: JitsiMeetUserInfo(
          displayName: room,
          email: room,
        ),
      );

      // Join the meeting
      await jitsiMeet.join(options);

      // await jitsiMeet.join(
      //   JitsiMeetConferenceOptions(
      //     serverURL: "https://meet.jit.si",
      //     room: callRoom.value,
      //     userInfo: JitsiMeetUserInfo(displayName: "User"),
      //   ),
      // );
    } catch (e) {
      print("Error starting the call: $e");
    }
  }

  void endCall() {
    callRoom.value = '';
    isInCall.value = false;
  }
}
