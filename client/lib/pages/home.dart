import 'package:client/widgets/book_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home(this.openBookChat, {super.key});

  final void Function(int bookId, String bookName) openBookChat;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("PageMage"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Books"),
              BookList(openBookChat),
            ],
          ),
        ),
      ),
    );
  }
}
