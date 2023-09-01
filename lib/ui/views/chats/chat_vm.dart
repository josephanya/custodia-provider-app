import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/models/chat_message_model.dart';
import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/models/user_model.dart';
import 'package:custodia_provider/repository/chat/chat_impl.dart';
import 'package:custodia_provider/repository/patient/patient_impl.dart';
import 'package:custodia_provider/repository/user/user_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/services/sockets/sockets.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final chatProvider = StateNotifierProvider.autoDispose<ChatVM, ChatViewState>(
  (ref) => ChatVM(ref.read),
);

class ChatVM extends StateNotifier<ChatViewState> {
  ChatVM(this._reader) : super(ChatViewState.initial());

  final Reader _reader;

  final _log = Logger(filter: DevelopmentFilter());

  late UserModel user;
  late PatientModel patient;
  late IO.Socket _socket;

  final TextEditingController chatFieldTEC = TextEditingController();
  final ScrollController scrollController = ScrollController();

  int currentPage = 1;

  final List<MessageModel> _chatMessages = [];

  void initialize({required String patientID}) async {
    await connectSocket(patientID);
    await getPatient(patientID);
    await getUser();
    await fetchOldMessages(patientID);
  }

  Future<void> connectSocket(String patientID) async {
    final socket = await _reader(socketsProvider).connect(patientID);
    _socket = socket;
    _socket.connect();
    _socket.onConnect((_) {
      _log.i('socket connected');
    });
    socket.on('message', (data) {
      addMessages(data);
    });
  }

  Future<void> getPatient(String patientID) async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final fetchedPatient =
          await _reader(patientRepository).getSinglePatient(patientID);
      patient = fetchedPatient;
      if (!mounted) return;
      state = state.copyWith(
        patient: patient,
        viewState: ViewState.idle,
      );
    } on Failure catch (e) {
      if (!mounted) return;
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      state = state.copyWith(viewState: ViewState.error);
      _log.e(e);
    }
  }

  Future<void> getUser() async {
    final fetchedUser = await _reader(userRepository).getUser();
    user = fetchedUser;
  }

  sendMessage({required String content}) async {
    final message = {
      'content': content,
      'sender_id': user.userID,
      'recipient_id': patient.patientID,
      'type': 'text',
    };
    _socket.emit('message', message);
    saveConversation(content, patient.patientID);
  }

  addMessages(List newMessages) {
    List<MessageModel> messages =
        newMessages.map((message) => MessageModel.fromJson(message)).toList();
    _chatMessages.insertAll(0, messages);
    state = state.copyWith(messages: _chatMessages);
  }

  disposeChat() {
    _chatMessages.clear();
    currentPage = 1;
    _socket.dispose();
  }

  navigateToPatientDetails() {
    _reader(navigationProvider)
        .pushNamed('/patient-profile', arguments: patient.patientID);
  }

  fetchOldMessages(String patientID) async {
    try {
      final messages = await _reader(chatRepository)
          .getOldMessages(page: currentPage, patientID: patientID);
      _chatMessages.addAll(messages);
      if (!mounted) return;
      state = state.copyWith(messages: _chatMessages);
      currentPage++;
    } on Failure catch (e) {
      debugPrint(e.message);
      if (!mounted) return;
      state = state.copyWith(viewState: ViewState.error);
    }
  }

  saveConversation(String message, String? patientID) async {
    final Map<String, dynamic> payload = {
      'message': message,
      'patient_id': patientID,
    };
    try {
      await _reader(chatRepository).saveConversation(payload: payload);
    } on Failure catch (e) {
      debugPrint(e.message);
    }
  }
}

class ChatViewState {
  final ViewState viewState;
  final PatientModel? patient;
  final List<MessageModel>? messages;

  const ChatViewState._({
    required this.viewState,
    required this.patient,
    required this.messages,
  });

  factory ChatViewState.initial() => const ChatViewState._(
        viewState: ViewState.idle,
        patient: null,
        messages: [],
      );

  ChatViewState copyWith({
    ViewState? viewState,
    PatientModel? patient,
    List<MessageModel>? messages,
  }) =>
      ChatViewState._(
          viewState: viewState ?? this.viewState,
          patient: patient ?? this.patient,
          messages: messages ?? this.messages);
}
