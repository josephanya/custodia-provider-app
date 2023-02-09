import 'package:custodia_provider/models/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = FutureProvider((ref) async {
  return LocalStorage();
});

class LocalStorage {
  Future<void> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', user.userID!);
    prefs.setString('firstName', user.firstName!);
    prefs.setString('lastName', user.lastName!);
    prefs.setString('email', user.email!);
    prefs.setString('authToken', user.authToken!);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('userID');
    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? email = prefs.getString('email');
    String? authToken = prefs.getString('authToken');

    return User(
      userID: userID,
      firstName: firstName,
      lastName: lastName,
      email: email,
      authToken: authToken,
    );
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userID');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('email');
    prefs.remove('authToken');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('authToken')!;
    return token;
  }
}
