class Alert {
  String alertID, alertType;
  bool isUrgent, isCompleted;
  DateTime triggerTime;
  Map<dynamic, dynamic> data;

  Alert({
    required this.alertID,
    required this.alertType,
    required this.isUrgent,
    required this.isCompleted,
    required this.triggerTime,
    required this.data,
  });

  factory Alert.fromJSON(Map<String, dynamic> data) {
    return Alert(
      alertID: data['alert_id'],
      alertType: data['alert_type'],
      isUrgent: data['is_urgent'],
      isCompleted: data['is_completed'],
      data: data['data'],
      triggerTime: DateTime.parse(data['trigger_time']),
    );
  }
}
