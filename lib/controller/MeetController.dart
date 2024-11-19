import 'package:get/get.dart';

class MeetController extends GetxController {
  var isInCall = false.obs;
  var callRoom = ''.obs;

  void startCall(String room) {
    callRoom.value = room;
    isInCall.value = true;
  }

  void endCall() {
    callRoom.value = '';
    isInCall.value = false;
  }
}
