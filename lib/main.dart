import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/services/notifications/local_notifications_service.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:custodia_provider/ui/core/routes.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  LocalNotificationsService().initNotifications();
  runApp(const ProviderScope(
    child: CustodiaProvider(),
  ));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

class CustodiaProvider extends ConsumerWidget {
  const CustodiaProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => OverlaySupport.global(
        child: MaterialApp(
          title: 'Custodia Provider',
          theme: themeData(context),
          initialRoute: '/',
          onGenerateRoute: Routes.generateRoute,
          navigatorKey: ref.read(navigationProvider).navigatorKey,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
