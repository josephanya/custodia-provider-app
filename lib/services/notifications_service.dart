import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  var flutterLocalNotificationsPlugin;

  NotificationsService() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initNotifications();
  }

  void initNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    print('notification payload: $payload');
  }

  Future onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    return Future.value(1);
  }

  getPlatformChannelSpecfics() {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'ng.lifebox.sustain',
      'Sustain',
      channelDescription: 'your channel description',
      playSound: true,
      enableLights: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'Sustain',
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  void showNotification(
      int id, String title, String body, dynamic payload) async {
    await flutterLocalNotificationsPlugin
        .show(id, title, body, getPlatformChannelSpecfics(), payload: payload);
    print(payload);
  }

  void showNotificationDaily(
      int id, String title, String body, int hour, int minute) async {
    var time = Time(hour, minute, 0);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        id, title, body, time, getPlatformChannelSpecfics());
    print('Notification Succesfully Scheduled at ${time.toString()}');
  }

  void showNotificationWeekly(
      int id, String title, String body, int hour, int minute) async {
    var time = Time(hour, minute, 0);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        id, title, body, Day.monday, getPlatformChannelSpecfics());
    print('Notification Succesfully Scheduled at ${time.toString()}');
  }

  void showNotificationAtintervals(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.hourly, getPlatformChannelSpecfics());
  }

  void removeReminder(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
