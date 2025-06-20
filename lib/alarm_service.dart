import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:vibration/vibration.dart';

import 'notification_service.dart';

@pragma('vm:entry-point')
class AlarmService {
  static Future<void> initializeAlarmManager() async {
    // Must be called early in app’s lifecycle
    await AndroidAlarmManager.initialize();
  }

  // This function is called by the Alarm Manager in a separate isolate
  @pragma('vm:entry-point')
  static Future<void> callback(int alarmId) async {
    // Show a local notification
    await NotificationService().initializeNotifications();
    await NotificationService().showAlarmNotification(
      alarmId,
      'Alarm',
      'Your alarm is ringing!',
    );

    print(
      "alarm ringing-------------------------------------------------------------------",
    );

    // Optionally vibrate
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 3000);
    } else {
      print("vibration not avl");
    }
  }

  static Future<void> scheduleAlarm(DateTime dateTime, int alarmId) async {
    // Use the AndroidAlarmManager to schedule
    // The callback will be triggered at [dateTime].
    await AndroidAlarmManager.oneShotAt(
      dateTime,
      alarmId, // unique id
      callback,
      exact: true,
      wakeup: true,
    );
  }

  static Future<void> cancelAlarm(int alarmId) async {
    await AndroidAlarmManager.cancel(alarmId);
  }
}
