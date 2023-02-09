import 'dart:async';
import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/auth/auth_impl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startupProvider = Provider.autoDispose<StartupVM>(
  (ref) => StartupVM(ref.read),
);

class StartupVM extends ChangeNotifier {
  StartupVM(this._reader) : super();

  final Reader _reader;

  void initialize() async {
    await checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    bool isAuthorized = await _reader(authRepository).hasAuthToken();
    if (isAuthorized) {
      goToHome();
    } else {
      goToLogin();
    }
  }

  void goToHome() {
    _reader(navigationProvider)
        .pushNamedAndRemoveUntil('/bottom-navigation', (_) => false);
  }

  void goToLogin() {
    _reader(navigationProvider).pushNamedAndRemoveUntil('/login', (_) => false);
  }
}
