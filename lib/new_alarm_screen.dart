import 'package:flutter/material.dart';

class NewAlarmScreen extends StatefulWidget {
  final Function(DateTime) onSave;

  const NewAlarmScreen({Key? key, required this.onSave}) : super(key: key);

  @override
  _NewAlarmScreenState createState() => _NewAlarmScreenState();
}

class _NewAlarmScreenState extends State<NewAlarmScreen> {
  int _hour = TimeOfDay.now().hour;
  int _minute = TimeOfDay.now().minute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Wear OS theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Compact Time Display
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
              ),
              alignment: Alignment.center,
              child: Text(
                '${_hour.toString().padLeft(2, '0')} : ${_minute.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Adjust Time (Smaller Buttons)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _timeAdjustButton(
                  "H+",
                  () => setState(() => _hour = (_hour + 1) % 24),
                ),
                _timeAdjustButton(
                  "M+",
                  () => setState(() => _minute = (_minute + 1) % 60),
                ),
                // _timeAdjustButton(
                //   "H-",
                //   () => setState(() => _hour = (_hour - 1) % 24),
                // ),
                // _timeAdjustButton(
                //   "M-",
                //   () => setState(() => _minute = (_minute - 1) % 60),
                // ),
              ],
            ),
            const SizedBox(height: 10),

            // Save Button (Smaller for Watch)
            ElevatedButton(
              onPressed: _saveAlarm,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Compact Buttons for Small Screen
  Widget _timeAdjustButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(4), // Smaller buttons
        backgroundColor: Colors.white,
      ),
      child: Text(label, style: const TextStyle(fontSize: 12)), // Smaller text
    );
  }

  // Save Alarm Function
  void _saveAlarm() {
    final now = DateTime.now();
    final alarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      _hour,
      _minute,
    );

    // Schedule for next day if time is past
    final scheduledTime =
        alarmDateTime.isBefore(now)
            ? alarmDateTime.add(const Duration(days: 1))
            : alarmDateTime;

    widget.onSave(scheduledTime);
    Navigator.of(context).pop();
  }
}
