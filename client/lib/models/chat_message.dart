class ChatMessage {
  final String sender;
  final String content;
  final Future<String> response;

  ChatMessage(
      {required this.sender, required this.content, required this.response});
}
