import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final activeTabProvider = StateNotifierProvider<ActiveTabNotifier, int>((ref) {
  return ActiveTabNotifier();
});

class ActiveTabNotifier extends StateNotifier<int> {
  ActiveTabNotifier() : super(0); // Assuming the first tab is the default

  void updateActiveTab(int index) {
    state = index;
  }
}

final unreadMessagesProvider =
    StateNotifierProvider<UnreadMessagesNotifier, int>((ref) {
  final activeTabIndex = ref.watch(activeTabProvider);
  return UnreadMessagesNotifier(activeTabIndex: activeTabIndex, ref: ref);
});

class UnreadMessagesNotifier extends StateNotifier<int> {
  final _unreadMessagesCountController = StreamController<int>.broadcast();
  final int activeTabIndex;
  final Ref ref;

  Stream<int> get unreadMessagesCountStream =>
      _unreadMessagesCountController.stream;

  UnreadMessagesNotifier({
    required this.activeTabIndex,
    required this.ref,
  }) : super(0);

  void updateUnreadMessagesCount(int count) {
    final isOnChatTab = activeTabIndex ==
        1; // Update this line if the chat tab index is different
    if (!isOnChatTab) {
      state = count;
      _unreadMessagesCountController.sink.add(count);
    }
  }

  void resetUnreadMessagesCount() {
    if (state > 0) {
      _unreadMessagesCountController.sink.add(0);
      state = 0;
    }
  }

  @override
  void dispose() {
    _unreadMessagesCountController.close();
    super.dispose();
  }
}
