import 'package:flutter/material.dart';

class AlarmListScreen extends StatefulWidget {
  final List<DateTime> alarms;
  final Function(int) onDeleteAlarm;

  const AlarmListScreen({
    Key? key,
    required this.alarms,
    required this.onDeleteAlarm,
  }) : super(key: key);

  @override
  _AlarmListScreenState createState() => _AlarmListScreenState();
}

class _AlarmListScreenState extends State<AlarmListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.alarms.length,
      itemBuilder: (context, index) {
        final alarm = widget.alarms[index];
        return Card(
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 4,
              children: [
                const Icon(Icons.alarm),
                Text(
                  '${alarm.hour.toString().padLeft(2, '0')}:${alarm.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () => widget.onDeleteAlarm(index),
            ),
          ),
        );
      },
    );
  }
}
