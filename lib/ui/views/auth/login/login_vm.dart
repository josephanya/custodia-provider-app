import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider((ref) => LoginVM());

class LoginVM with ChangeNotifier {
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

  void signIn(BuildContext context) async {
    Navigator.pushNamed(context, '/bottom-navigation');
  }

  void signOut(BuildContext context) async {}
}
