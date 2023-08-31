import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/chat/chat_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/core/enums/view_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final conversationListProvider = StateNotifierProvider.autoDispose<
    ConversationListVM, ConversationListViewState>(
  (ref) => ConversationListVM(ref.read),
);

class ConversationListVM extends StateNotifier<ConversationListViewState> {
  ConversationListVM(this._reader) : super(ConversationListViewState.initial());

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void initialize() async {
    await fetchConversationList();
  }

  Future<void> fetchConversationList() async {
    state = state.copyWith(viewState: ViewState.loading);
    try {
      final conversations = await _reader(chatRepository).getConversations();
      if (!mounted) return;
      state = state.copyWith(
          conversations: conversations, viewState: ViewState.idle);
    } on Failure catch (e) {
      state = state.copyWith(viewState: ViewState.error);
      _reader(navigationProvider).showErrorSnackbar(message: e.message);
      _log.e(e);
    }
  }

  void goToChatView(String patientID) {
    _reader(navigationProvider)
        .pushNamed('/chat', arguments: patientID)
        ?.then((value) async {
      final conversations = await _reader(chatRepository).getConversations();
      state = state.copyWith(
        conversations: conversations,
      );
    });
  }
}

class ConversationListViewState {
  final ViewState viewState;
  final List? conversations;

  const ConversationListViewState._({
    required this.viewState,
    required this.conversations,
  });

  factory ConversationListViewState.initial() =>
      const ConversationListViewState._(
        viewState: ViewState.idle,
        conversations: [],
      );

  ConversationListViewState copyWith(
          {ViewState? viewState, List? conversations}) =>
      ConversationListViewState._(
        viewState: viewState ?? this.viewState,
        conversations: conversations ?? this.conversations,
      );
}
