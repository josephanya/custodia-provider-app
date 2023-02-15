import 'package:custodia_provider/core/navigation.dart';
import 'package:custodia_provider/repository/auth/auth_impl.dart';
import 'package:custodia_provider/services/api/failure.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginVM(ref.read));

class LoginVM with ChangeNotifier {
  LoginVM(this._reader) : super();

  final Reader _reader;
  final _log = Logger(filter: DevelopmentFilter());

  final formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  bool _isLoading = false, _isButtonEnabled = false;

  bool get isLoading => _isLoading;
  bool get isButtonEnabled => _isButtonEnabled;

  void isValid() {
    _isButtonEnabled = (Validator.isPassword(passwordTEC.text)) &&
            (Validator.isEmail(emailTEC.text))
        ? true
        : false;
    notifyListeners();
  }

  void login() async {
    try {
      _isLoading = true;
      _log.d('login called');
      await _reader(authRepository).login(
        email: emailTEC.text,
        password: passwordTEC.text,
      );
      _log.d('login successful');
      _isLoading = false;
      _reader(navigationProvider)
          .pushNamedAndRemoveUntil('/bottom-navigation', (_) => false);
    } on Failure catch (e) {
      _isLoading = false;
      _log.e(e);
      _reader(navigationProvider).showCustomSnackbar(message: e.message);
    }
  }

  void logout() async {
    try {
      _log.d('logout called');
      await _reader(authRepository).logout();
      _log.d('logout successful');
      _reader(navigationProvider)
          .pushNamedAndRemoveUntil('/login', (_) => false);
    } on Failure catch (e) {
      _log.e(e);
      _reader(navigationProvider).showCustomSnackbar(message: e.message);
    }
  }
}
