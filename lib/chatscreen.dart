import 'package:dummy_app/ble_service.dart';
import 'package:dummy_app/db.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final BleService bleService = BleService();
  List<Message> _messages = [];

  void initstate() {
    super.initState();
    bleService.onReceiveMessage((message) {
      setState(() {
        _messages.add(message);
      });
    });
  }

  void _sendMessage() {
    String content = _messageController.text;
    if (content.isNotEmpty) {
      String senderID = "sender123";
      String receiverID = " receiver 456";
      bleService.sendMessage(senderID, receiverID, content);
      _messageController.clear();
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bluetoothapp"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index].content),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    maxLength: 140,
                    decoration: InputDecoration(hintText: "enter your text"),
                  ),
                ),
                IconButton(
                  onPressed: _sendMessage,
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
