import 'package:custodia_provider/models/alert_model.dart';

abstract class Alert {
  Future<List<AlertModel>> getAlerts();

  Future<AlertModel> getSingleAlert(String alertID);

  // Future markAsCompleted();
}
