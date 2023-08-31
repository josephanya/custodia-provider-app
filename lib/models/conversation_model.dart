class ConversationModel {
  String firstName, lastName, conversationID, lastMessage, patientID;
  DateTime lastMessageTime;

  ConversationModel({
    required this.conversationID,
    required this.firstName,
    required this.lastName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.patientID,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      conversationID: json['_id'],
      firstName: json['patient_first_name'],
      lastName: json['patient_last_name'],
      lastMessage: json['last_message'],
      lastMessageTime: DateTime.parse(json['last_message_time']),
      patientID: json['patient_id'],
    );
  }
}
