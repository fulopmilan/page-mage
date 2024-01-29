import 'dart:convert';

import 'package:client/models/book.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<List<Book>> getBookListData() async {
  var ipv4 = '${dotenv.get('IPV4')}:${dotenv.get('SERVER_PORT')}';
  print(ipv4);
  List<Book> parseBooks(String jsonData) {
    final parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();

    return parsed.map<Book>((json) => Book.fromJson(json)).toList();
  }

  Future<String> fetchData() async {
    var url = Uri.http(ipv4, '/api/getBookListData');
    var response = await http.post(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load book data');
    }
  }

  try {
    String jsonData = await fetchData();
    List<Book> books = parseBooks(jsonData);

    return books;
  } catch (e) {
    return [];
  }
}

Future<String> getAIAnswer(String userMessage, int bookId) async {
  var ipv4 = '${dotenv.get('IPV4')}:${dotenv.get('SERVER_PORT')}';
  Future<String> fetchData() async {
    var url = Uri.http(ipv4, '/api/getAIMessage');
    var response = await http.post(
      url,
      body: {'userMessage': userMessage, 'bookId': bookId.toString()},
    );

    if (response.statusCode == 200) {
      return response.body.trim();
    } else {
      throw Exception('Failed to load book data');
    }
  }

  try {
    String aiMessage = await fetchData();

    return aiMessage;
  } catch (e) {
    return "Error";
  }
}
