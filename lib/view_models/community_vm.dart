import 'package:flutter/material.dart';

class CommunityVM with ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  final TextEditingController newPostTEC = new TextEditingController();

  bool _isButtonEnabled = false;
  bool get isButtonEnabled => _isButtonEnabled;

  void isValid() {
    _isButtonEnabled = (newPostTEC.text.isNotEmpty) ? true : false;
    notifyListeners();
  }

  void sendPost() => print(newPostTEC.text);
}
