import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: darkBlue,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.replay,
          size: 35,
          color: lightWhite,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
