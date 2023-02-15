import 'package:custodia_provider/models/provider_model.dart';
import 'package:custodia_provider/repository/provider/provider.dart';
import 'package:custodia_provider/services/local_storage/local_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerRepository = Provider<ProviderRepo>(
  (ref) => ProviderImpl(
    ref.watch(localStorageProvider.future),
  ),
);

class ProviderImpl implements ProviderRepo {
  ProviderImpl(this._localStorage);

  final Future<LocalStorage> _localStorage;

  @override
  Future<ProviderModel> getProvider() async {
    return await _localStorage
        .then<ProviderModel>((storage) async => await storage.getProvider());
  }
}
