import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/auth_user_model.dart';
import 'package:custodia_provider/models/provider_model.dart';
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

    AuthModel? authUser = AuthModel.fromJSON(response);
    await _localStorage.then(
      (storage) async => await storage.saveAuthUser(authUser),
    );

    final providerProfile = await _api.get(ApiBase.profile);
    ProviderModel? provider = ProviderModel.fromJSON(providerProfile);
    await _localStorage.then(
      (storage) async => await storage.saveProvider(provider),
    );
  }

  @override
  Future<void> logout() async {
    _api.post(ApiBase.logout, body: {}).whenComplete(
      () async => await _localStorage
          .then((storage) async => await storage.removeAuthUser()),
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
