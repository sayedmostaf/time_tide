import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class StartStopButton extends StatelessWidget {
  const StartStopButton(
      {super.key, required this.onPressed, required this.isRunning});
  final VoidCallback onPressed;
  final bool isRunning;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          border: Border.all(
            width: 5,
            color: isRunning ? Colors.red : lightPurple,
          ),
        ),
        child: Text(
          isRunning ? "Stop" : "Start",
          style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: lightWhite,
          ),
        ),
      ),
    );
  }
}
