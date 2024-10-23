import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: DottedBorder(
        strokeWidth: 2,
        color: lightWhite,
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        dashPattern: const [5, 4],
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/add_alarm.png',
                  scale: 1.5,
                ),
                const SizedBox(height: 10),
                Text(
                  'Add Alarm',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onPressed: addAlarm(context),
        ),
      ),
    );
  }
}
