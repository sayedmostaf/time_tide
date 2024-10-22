import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: lightWhite,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      duration: const Duration(milliseconds: 900),
      behavior: SnackBarBehavior.floating,
      backgroundColor: lightBlue.withOpacity(.4),
    ),
  );
}
