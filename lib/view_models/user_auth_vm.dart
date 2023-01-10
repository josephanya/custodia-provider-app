import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/validator.dart';

class SignInVM with ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  bool _isLoading = false, _isButtonEnabled = false;
  bool get isLoading => _isLoading;
  bool get isButtonEnabled => _isButtonEnabled;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void isValid() {
    _isButtonEnabled = (Validator.isPassword(passwordTEC.text)) &&
            (Validator.isEmail(emailTEC.text))
        ? true
        : false;
    notifyListeners();
  }

  signIn(BuildContext context) async {
    Navigator.pushNamed(context, '/bottom-navigation');
  }
}

class ResetPasswordVM with ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void resetPassword(BuildContext context) async {}
}
