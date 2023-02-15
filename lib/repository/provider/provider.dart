import 'package:custodia_provider/models/provider_model.dart';

abstract class ProviderRepo {
  Future<ProviderModel> getProvider();
}
