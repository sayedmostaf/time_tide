import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/providers/timer_provider.dart';

void showTimePickerDialog(BuildContext context, TimerProvider timerProvider) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              darkGrey.withOpacity(0.7),
              darkBlue.withOpacity(0.7)
            ],
          ),
        ),
        height: 300,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(seconds: timerProvider.remainingTime),
          onTimerDurationChanged: (Duration newDuration) {
            if (newDuration.inSeconds > 0) {
              timerProvider.setTime(newDuration.inSeconds);
            }
          },
        ),
      );
    },
  );
}
