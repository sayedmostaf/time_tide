import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/widgets/alarm_switcher.dart';
import 'package:time_tide/widgets/delete_alarm.dart';

class AlarmItem extends StatelessWidget {
  const AlarmItem({
    super.key,
    required this.id,
    required this.formattedTime,
    required this.on,
    required this.time,
    required this.index,
  });

  final String id, formattedTime;
  final bool on;
  final Timestamp time;
  final int index;

  @override
  Widget build(BuildContext context) {
    List<Color> colorGradient = gradientColors[index % gradientColors.length];
    Color shadowColor = colorGradient.first;

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(.7),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
        gradient: LinearGradient(
          colors: colorGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.label, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text('Alarm', style: TextStyle(color: Colors.white)),
                ],
              ),
              AlarmSwitcher(on, time, id),
            ],
          ),
          const Text('Everyday', style: TextStyle(color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedTime,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              IconButton(
                onPressed: () => deleteAlarm(context, id),
                icon: const Icon(Icons.cancel_outlined,
                    size: 30, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
