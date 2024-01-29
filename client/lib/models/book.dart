class Book {
  Book({required this.bookId, required this.bookName});

  final int bookId;
  final String bookName;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json['bookId'] as int,
      bookName: json['bookName'] as String,
    );
  }
}
