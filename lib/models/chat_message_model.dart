class MessageModel {
  String content, type, senderID, recipientID;

  MessageModel({
    required this.content,
    required this.type,
    required this.senderID,
    required this.recipientID,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      type: json['type'],
      senderID: json['sender_id'],
      recipientID: json['recipient_id'],
    );
  }
}
