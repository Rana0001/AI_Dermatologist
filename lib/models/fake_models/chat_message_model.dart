class FakeChatMessageModel {
  bool isMyMessage;
  String message;
  String dateTimeText;
  String? audioUrl;
  FakeChatMessageModel({
    required this.isMyMessage,
    required this.message,
    required this.dateTimeText,
    this.audioUrl,
  });
}
