class AlertModel {
  String alertID, alertType, patientID;
  bool isUrgent, isCompleted;
  DateTime triggerTime;
  Map<dynamic, dynamic> data;

  AlertModel(
      {required this.alertID,
      required this.alertType,
      required this.isUrgent,
      required this.isCompleted,
      required this.triggerTime,
      required this.data,
      required this.patientID});

  factory AlertModel.fromJSON(Map<String, dynamic> data) {
    return AlertModel(
      alertID: data['_id'],
      alertType: data['alertType'],
      isUrgent: data['isUrgent'],
      isCompleted: data['isCompleted'],
      data: data['data'],
      patientID: data['patientID'],
      triggerTime: DateTime.parse(data['triggerTime']),
    );
  }
}
