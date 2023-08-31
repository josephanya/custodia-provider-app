class AlertModel {
  String alertID, alertType, patientID;
  bool isUrgent, isCompleted;
  DateTime triggerTime;
  Map<dynamic, dynamic> data;

  AlertModel({
    required this.alertID,
    required this.alertType,
    required this.isUrgent,
    required this.isCompleted,
    required this.triggerTime,
    required this.data,
    required this.patientID,
  });

  factory AlertModel.fromJSON(Map<String, dynamic> data) {
    return AlertModel(
      alertID: data['_id'],
      alertType: data['alert_type'],
      isUrgent: data['is_urgent'],
      isCompleted: data['is_completed'],
      data: data['data'],
      patientID: data['patient_id'],
      triggerTime: DateTime.parse(data['trigger_time']),
    );
  }
}
