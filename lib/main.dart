import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:custodia_provider/services/notifications_service.dart';
import 'package:custodia_provider/ui/core/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService().initNotifications();
  runApp(const ProviderScope(
    child: CustodiaProvider(),
  ));
}

class CustodiaProvider extends ConsumerWidget {
  const CustodiaProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Custodia Provider',
        theme: themeData(context),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: ref.read(navigationProvider).navigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
