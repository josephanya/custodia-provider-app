import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileVM with ChangeNotifier {
  final TextEditingController usernameTEC = new TextEditingController();
  final TextEditingController bioTEC = new TextEditingController();

  File? _image;

  File? get image => _image;

  Future getImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      _image = File(pickedFile!.path);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  // Future<String> uploadFile() async {}

  // void updateProfile() {
  //   try {} catch (error) {}
  // }
}
