import 'package:flutter/material.dart';

void main() {
  runApp(const ChatroomApp());
}

class ChatroomApp extends StatelessWidget {
  const ChatroomApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primaryColor: Colors.grey[800], // Grey
        hintColor: Colors.orange[900], // Orange
        scaffoldBackgroundColor: Colors.orange[900], // Light Orange
      ),
      home: ChatPage(
        groupId: 'your_group_id',
        groupName: 'Chatroom',
        userName: 'User ${DateTime.now().millisecond}',
      ),
    );
  }
}

class ChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  const ChatPage({
    Key? key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> messages = [];
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        //title:Text(widget.groupName),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                // Implement your back button functionality here
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            Text(widget.groupName),
          ],
        ),
        backgroundColor:
            Colors.orange[900], // Change the background color to orange
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white, // White background for chat area
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isSentByCurrentUser =
                      message.startsWith("${widget.userName}:");

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 25),
                    decoration: BoxDecoration(
                      color: isSentByCurrentUser
                          ? Colors.orange[500]
                          : Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black87),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[800], // Grey background for input area
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Send a message...",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    sendMessage();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange[900], // Grey button
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                  child:
                      const Text('Send', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
    ));
  }


  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add("${widget.userName}: ${messageController.text}");
        messageController.clear();
      });
    }
  }
}
