import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/chat_message_model.dart';
import 'package:custodia_provider/models/conversation_model.dart';
import 'package:custodia_provider/repository/chat/chat.dart';
import 'package:custodia_provider/services/api/api.dart';
import 'package:custodia_provider/services/api/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatRepository = Provider<Chat>(
  (ref) => ChatImpl(ref.read(apiProvider)),
);

class ChatImpl implements Chat {
  ChatImpl(this._api);

  final Api _api;

  @override
  Future getOldMessages({required int page, required String patientID}) async {
    final response = await _api.get(ApiBase.chatBase('/messages/$patientID'),
        queryParameters: {"page": page});
    final messagesList =
        List<Map<String, dynamic>>.from(response['data']['messages']);
    List<MessageModel> messages =
        messagesList.map((message) => MessageModel.fromJson(message)).toList();
    return messages;
  }

  @override
  Future saveConversation({required Map<String, dynamic> payload}) async {
    await _api.post(
      ApiBase.conversation,
      body: payload,
    );
  }

  @override
  Future<List<ConversationModel>> getConversations() async {
    final response = await _api.get(ApiBase.conversation);
    final conversations =
        List<Map<String, dynamic>>.from(response['data']['conversations']);
    return conversations
        .map((conversation) => ConversationModel.fromJson(conversation))
        .toList();
  }

  @override
  Future markConversationAsRead({required String conversationID}) async {
    await _api.get(ApiBase.chatBase('/conversation/$conversationID'));
  }
}
