import 'package:flutter/cupertino.dart';
import 'package:time_tide/constants/colors.dart';

class StopWatchDisplay extends StatelessWidget {
  const StopWatchDisplay(
      {super.key, required this.displayTime, required this.onPressed});
  final String displayTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        alignment: Alignment.center,
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(300),
          border: Border.all(
            width: 5,
            color: lightPurple,
          ),
        ),
        child: Text(
          displayTime,
          style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: lightWhite,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
