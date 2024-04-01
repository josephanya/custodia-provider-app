import 'package:custodia_provider/models/user_model.dart';
import 'package:custodia_provider/models/auth_user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = FutureProvider((ref) async {
  return LocalStorage();
});

class LocalStorage {
  Future<void> saveAuthUser(AuthModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('authToken', user.authToken!);
  }

  Future<AuthModel> getAuthUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? authToken = prefs.getString('authToken');

    return AuthModel(
      authToken: authToken,
    );
  }

  Future<void> removeAuthUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('authToken');
  }

  Future<void> saveUser(UserModel profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userID', profile.userID!);
    prefs.setString('firstName', profile.firstName!);
    prefs.setString('lastName', profile.lastName!);
    prefs.setString('email', profile.email!);
    prefs.setString('role', profile.role!);
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userID = prefs.getString('userID');
    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? email = prefs.getString('email');
    String? role = prefs.getString('role');

    return UserModel(
      userID: userID,
      firstName: firstName,
      lastName: lastName,
      email: email,
      role: role,
    );
  }
}
