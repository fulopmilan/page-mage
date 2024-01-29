import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'pages/book_chat.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const PageManager());
}

class PageManager extends StatefulWidget {
  const PageManager({super.key});

  @override
  State<PageManager> createState() => _PageManagerState();
}

enum PageTypes { home, bookChat }

class _PageManagerState extends State<PageManager> {
  Widget? currentPage;
  void openHome() {
    setState(() {
      currentPage = Home(openBookChat);
    });
  }

  void openBookChat(int bookId, String bookName) {
    setState(() {
      currentPage = BookChat(openHome, bookId, bookName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentPage ?? Home(openBookChat);
  }
}
