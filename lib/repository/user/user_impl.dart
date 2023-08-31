import 'package:custodia_provider/models/user_model.dart';
import 'package:custodia_provider/repository/user/user.dart';
import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepository = Provider<User>(
  (ref) => UserImpl(
    ref.watch(localStorageProvider.future),
  ),
);

class UserImpl implements User {
  UserImpl(this._localStorage);

  final Future<LocalStorage> _localStorage;

  @override
  Future<UserModel> getUser() async {
    return await _localStorage
        .then<UserModel>((storage) async => await storage.getUser());
  }
}
