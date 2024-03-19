import 'package:custodia_provider/models/conversation_model.dart';

abstract class Chat {
  Future getOldMessages({required int page, required String patientID});

  Future saveConversation({required Map<String, dynamic> payload});

  Future<List<ConversationModel>> getConversations();

  Future markConversationAsRead({required String conversationID});
}
