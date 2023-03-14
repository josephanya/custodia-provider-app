import 'package:custodia_provider/core/api_base.dart';
import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/repository/alert/alert.dart';
import 'package:custodia_provider/services/api/api.dart';
import 'package:custodia_provider/services/api/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final alertRepository = Provider<Alert>(
  (ref) => AlertImpl(ref.read(apiProvider)),
);

class AlertImpl implements Alert {
  AlertImpl(
    this._api,
  );

  final Api _api;

  @override
  Future<List<AlertModel>> getAlerts() async {
    final response = await _api.get(ApiBase.alert);
    final result = List<Map<String, dynamic>>.from(response['alerts']);
    List<AlertModel> alerts =
        result.map((alert) => AlertModel.fromJSON(alert)).toList();
    return alerts;
  }

  @override
  Future<AlertModel> getSingleAlert(String alertID) async {
    final response = await _api.get(ApiBase.alertBase('/$alertID'));
    return AlertModel.fromJSON(response);
  }
}
