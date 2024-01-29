import 'package:flutter/material.dart';
import '../models/book.dart';

class BookItem extends StatelessWidget {
  const BookItem(this.openBookChat, {Key? key, required this.book})
      : super(key: key);

  final Book book;
  final void Function(int bookId, String bookName) openBookChat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 108,
      child: GestureDetector(
        onTap: () {
          openBookChat(book.bookId, book.bookName);
        },
        child: Card(
          child: ListTile(
            title: Text(book.bookName),
          ),
        ),
      ),
    );
  }
}
