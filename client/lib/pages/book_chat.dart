import 'package:client/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client/requests.dart';
import '../models/chat_message.dart';

class BookChat extends StatefulWidget {
  const BookChat(this.openHome, this.bookId, this.bookName, {super.key});

  final void Function() openHome;
  final String bookName;
  final int bookId;

  @override
  State<BookChat> createState() => _BookChatState();
}

class _BookChatState extends State<BookChat> {
  final _userMessageController = TextEditingController();
  List<ChatMessage> chatList = [];

  void submit(String message) {
    if (message.isNotEmpty) {
      var answer = getAIAnswer(message, widget.bookId);
      setState(() {
        chatList.add(
          ChatMessage(sender: "User", content: message, response: answer),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: GestureDetector(
        onHorizontalDragUpdate: (details) => {
          if (details.delta.dx > 4) {widget.openHome()}
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.bookName),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ChatList(chatList),
                ),
                TextField(
                  controller: _userMessageController,
                  onSubmitted: (text) =>
                      {submit(text), _userMessageController.clear()},
                  decoration: const InputDecoration(hintText: "Your text here"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
