import 'package:flutter/material.dart';
import 'package:alarm_app/src/models/alarm_info.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  List<AlarmInfo> _alarms = [];

  @override
  void initState() {
    _alarms = [
      AlarmInfo(
          title: 'new years :)',
          alarmDateTime: DateTime.parse('2023-01-01 00:01:00Z')),
      AlarmInfo(
          title: 'yeah', alarmDateTime: DateTime.parse('2023-01-05 18:00:00Z')),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _alarms.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(_alarms[index].alarmDateTime.toString()),
        );
      }),
    );
  }
}
