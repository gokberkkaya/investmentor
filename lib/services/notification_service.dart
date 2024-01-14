import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService() {
    initialize();
  }

  Future<void> initialize() async {
    tz.initializeTimeZones();
    final AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon'); // Bildirim ikonunu belirtin
    final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleDailyTenAMNotification() async {
    tz.TZDateTime scheduledDate = _nextInstanceOfTenAM();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Günaydın',
      'Güne başlama zamanı!',
      scheduledDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily_ten_am_channel',
          'Günlük Sabah Bildirimleri',
          channelDescription: 'Sabah 10:00 bildirimleri için kanal',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    String plannedTime = scheduledDate.toIso8601String();
    await saveNotification('Günaydın, Güne başlama zamanı!', plannedTime);
  }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 19, 07 );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    print("planlanan: $scheduledDate");
    return scheduledDate;
  }


Future<void> saveNotification(String message, String plannedTime) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> notifications = prefs.getStringList('notifications') ?? [];

  bool alreadySaved = notifications.any((savedNotification) {
    var parts = savedNotification.split(' | ');
    return parts[0] == message && parts[1] == plannedTime;
  });

  if (!alreadySaved) {
    notifications.add('$message | $plannedTime');
    await prefs.setStringList('notifications', notifications);
  }
}

  Future<void> clearNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('notifications'); // 'notifications' anahtarını silerek bildirimleri temizle
  }
  
}