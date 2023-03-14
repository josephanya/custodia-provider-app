import 'dart:io';
import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/auth/auth_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
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
    if (Platform.isAndroid) {
      messaging.getToken().then(
        (token) {
          storeToken(token!);
        },
      );
    }
    // else if (Platform.isIOS) {
    //   messaging.getAPNSToken().then(
    //     (token) {
    //       storeToken(token!);
    //     },
    //   );
    // }
  }

  void setupInteractedMessage() async {
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _reader(navigationProvider)
            .showCustomSnackbar(message: message.notification?.body ?? '');
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {
      // navigate to chat
    }
  }
}
