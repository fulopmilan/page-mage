import 'package:client/models/chat_message.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList(this.chatList, {Key? key}) : super(key: key);

  final List<ChatMessage> chatList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: chatList.map((message) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //USER
            Align(
              alignment: Alignment.topLeft,
              child: Text(message.sender),
            ),
            Text(message.content),
            const SizedBox(
              height: 12,
            ),

            //AI
            const Align(
              alignment: Alignment.topLeft,
              child: Text("AI"),
            ),
            FutureBuilder(
              future: message.response,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return const Text("Loading...");
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        );
      }).toList(),
    );
  }
}
