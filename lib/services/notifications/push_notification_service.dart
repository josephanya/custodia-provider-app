import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/auth/auth_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:custodia_provider/ui/views/bottom_navigation/bottom_navigation_vm.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list_vm.dart';
// import 'package:custodia_provider/ui/core/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final pushNotificationsProvider =
    Provider((ref) => PushNotificationService(ref.read));

class PushNotificationService {
  PushNotificationService(this._reader) : super();

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  void storeToken(String token) async {
    try {
      await _reader(authRepository).saveDeviceToken(deviceToken: token);
    } on Failure catch (e) {
      _log.e(e);
    }
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestPermission() async {
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  void saveDeviceToken() async {
    String? token = await messaging.getToken();
    storeToken(token!);
    messaging.onTokenRefresh.listen(storeToken);
  }

  void setupInteractedMessage() async {
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        if (message.data['type'] == 'chat') {
          final activeTabIndex = _reader(activeTabProvider);
          if (activeTabIndex != 1) {
            _reader(unreadMessagesProvider.notifier)
                .updateUnreadMessagesCount(1);
            _reader(navigationProvider).showCustomMessageSnackbar(
                sender: message.notification?.title ?? '',
                message: message.notification?.body ?? '');
          } else {
            _reader(conversationListProvider.notifier).initialize();
          }
        } else {
          _reader(navigationProvider).showCustomMessageSnackbar(
              sender: message.notification?.title ?? '',
              message: message.notification?.body ?? '');
        }
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      final activeTabIndex = _reader(activeTabProvider);
      if (activeTabIndex != 1) {
        _reader(unreadMessagesProvider.notifier).updateUnreadMessagesCount(1);
      } else {
        _reader(conversationListProvider.notifier).initialize();
      }
    }
  }
}
