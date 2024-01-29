import 'package:flutter/material.dart';
import '../models/book.dart';
import '../requests.dart';
import 'book_item.dart';

class BookList extends StatelessWidget {
  const BookList(this.openBookChat, {super.key});

  final void Function(int bookId, String bookName) openBookChat;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: getBookListData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<Book> books = snapshot.data ?? [];

          return SizedBox(
            height: 192,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookItem(openBookChat, book: books[index]);
              },
            ),
          );
        }
      },
    );
  }
}
