import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/models/alarm_model.dart';

class AlarmSwitcher extends StatefulWidget {
  AlarmSwitcher(this.onOff, this.timestamp, this.id, {super.key});
  bool onOff;
  Timestamp timestamp;
  String id;
  @override
  State<AlarmSwitcher> createState() => _AlarmSwitcherState();
}

class _AlarmSwitcherState extends State<AlarmSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.white,
      inactiveThumbColor: mediumGrey,
      inactiveTrackColor: mediumGrey.withOpacity(.5),
      value: widget.onOff,
      onChanged: (bool value) {
        AlarmModel alarmModel = AlarmModel();
        alarmModel.onOff = value;
        alarmModel.timestamp = widget.timestamp;
        FirebaseFirestore.instance
            .collection('alarm')
            .doc(widget.id)
            .update(alarmModel.toJson());
      },
    );
  }
}
