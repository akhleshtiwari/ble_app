import 'package:objectbox/objectbox.dart';

@Entity()
class Message {
  String senderID;
  String receiverID;
  String content;
  DateTime timestamp;

  Message(
      {required this.senderID,
      required this.receiverID,
      required this.content,
      required this.timestamp});
}
