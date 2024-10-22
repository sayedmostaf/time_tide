
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:time_tide/pages/alarm_page.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final _notificationService = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "Alarm",
        "Alarm Ring",
        importance: Importance.max,
        priority: Priority.max,
      ),
    );
  }

  static Future init(BuildContext context) async {
    tz.initializeTimeZones();
    final android = AndroidInitializationSettings('logo');
    final settings = InitializationSettings(android: android);
    await _notificationService.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AlarmPage(),
        ),
      );
      onNotifications.add(payload as String?);
    });
  }

  static Future showNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime dateTime,
  }) async {
    if (dateTime.isBefore(DateTime.now())) {
      dateTime = dateTime.add(const Duration(days: 1));
    }
    _notificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      await _notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
