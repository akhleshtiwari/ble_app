import "package:flutter_blue/flutter_blue.dart";

import "db.dart";

class BleService {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  void sendMessage(String senderID, String receiverID, String content) {}

  void onReceiveMessage(Function(Message) callback) {}
}
