import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/providers/timer_provider.dart';

void showTimerPickerDialog(
  BuildContext context,
  TimerProvider timerProvider,
) {
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
            colors: [
              darkGrey.withOpacity(.7),
              darkBlue.withOpacity(.7),
            ],
          ),
        ),
        height: 300,
        child: CupertinoTimerPicker(
          onTimerDurationChanged: (Duration newDuration) {
            if (newDuration.inSeconds > 0) {
              timerProvider.setTime(newDuration.inSeconds);
            }
          },
          mode: CupertinoTimerPickerMode.hms,
          initialTimerDuration: Duration(seconds: timerProvider.remainingTime),
        ),
      );
    },
  );
}
