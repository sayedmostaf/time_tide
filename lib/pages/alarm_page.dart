import 'package:flutter/material.dart';
import 'package:time_tide/widgets/add_alarm_button.dart';
import 'package:time_tide/widgets/alarm_header.dart';
import 'package:time_tide/widgets/alarm_list.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 28),
      child: const Column(
        children: [
          AlarmHeader(),
          Expanded(child: AlarmList()),
          AddAlarmButton(),
        ],
      ),
    );
  }
}
