import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/user_model.dart';
import 'package:custodia_provider/services/api/api.dart';
import 'package:custodia_provider/services/api/api_service.dart';
import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'auth.dart';

final authRepository = Provider<Auth>(
  (ref) => AuthImpl(
    ref.read(apiProvider),
    ref.watch(localStorageProvider.future),
  ),
);

class AuthImpl implements Auth {
  AuthImpl(this._api, this._localStorage);

  final Api _api;
  final _log = Logger(filter: DevelopmentFilter());
  final Future<LocalStorage> _localStorage;

  String? _token;

  @override
  String? get token => _token;

  @override
  Future<void> login({required String email, required String password}) async {
    final response = await _api.post(
      ApiBase.login,
      body: {
        'email': email,
        'password': password,
      },
    );

    User? user = User.fromJSON(response);
    await _localStorage.then(
      (storage) async => await storage.saveUser(user),
    );
  }

  @override
  void setToken({required String token}) {
    _token = token;
  }

  @override
  Future<void> logout() async {
    _api.post(ApiBase.logout, body: {}).whenComplete(
      () async => await _localStorage
          .then((storage) async => await storage.removeUser()),
    );
  }

  @override
  Future<bool> hasAuthToken() async {
    try {
      final String token = await _localStorage
          .then<String>((storage) async => await storage.getToken());
      if (token != null) {
        return true;
      }
    } catch (e) {
      _log.e('Token does not exist');
    }
    return false;
  }
}
