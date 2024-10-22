import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class TimerDisplay extends StatelessWidget {
  const TimerDisplay(
      {super.key,
      required this.remainingTime,
      required this.initialTime,
      required this.onTimeTap});
  final int remainingTime, initialTime;
  final VoidCallback onTimeTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CupertinoButton(
          child: SizedBox(
            width: 250,
            height: 250,
            child: CircularProgressIndicator(
              backgroundColor: lightWhite,
              value: initialTime > 0 ? remainingTime / initialTime : 0,
              strokeWidth: 5,
              color: lightBlueishPurple,
            ),
          ),
          onPressed: onTimeTap,
        ),
        CupertinoButton(
          child: Text(
            _formatTime(remainingTime),
            style: TextStyle(
              fontFamily: 'DIGI',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: lightWhite,
            ),
          ),
          onPressed: onTimeTap,
        ),
      ],
    );
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
