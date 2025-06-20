import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'alarm_service.dart';
import 'new_alarm_screen.dart';
import 'alarm_list_screen.dart';
import 'notification_service.dart';

Future<void> reqPermissions() async {
  if (Platform.isAndroid) {
    if (await Permission.scheduleExactAlarm.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }
    await Permission.notification.request();
    await Permission.systemAlertWindow.request();
    await Permission.reminders.request();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await reqPermissions();
  await AlarmService.initializeAlarmManager();

  await NotificationService().initializeNotifications();

  runApp(const POCApp());
}

class POCApp extends StatelessWidget {
  const POCApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wear Alarm Clock',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<DateTime> _alarms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wear OS Alarm', style: TextStyle(fontSize: 12)),
        centerTitle: true,
      ),
      body: AlarmListScreen(alarms: _alarms, onDeleteAlarm: _deleteAlarm),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _navigateToAddAlarm,
      ),
    );
  }

  Future<void> _navigateToAddAlarm() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewAlarmScreen(onSave: _addAlarm),
      ),
    );
    setState(() {});
  }

  void _addAlarm(DateTime dateTime) async {
    final alarmId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _alarms.add(dateTime);

    await AlarmService.scheduleAlarm(dateTime, alarmId);

    setState(() {});
  }

  void _deleteAlarm(int index) async {
    final alarmDateTime = _alarms[index];
    final alarmId = alarmDateTime.millisecondsSinceEpoch ~/ 1000;

    await AlarmService.cancelAlarm(alarmId);
    _alarms.removeAt(index);
    setState(() {});
  }
}
