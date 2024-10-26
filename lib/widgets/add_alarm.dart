import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/models/alarm_model.dart';
import 'package:time_tide/widgets/show_snack_bar.dart';

addAlarm(BuildContext context) {
  TimeOfDay time = TimeOfDay.now();
  add(TimeOfDay time) {
    try {
      DateTime d = DateTime.now();
      DateTime dateTime =
          DateTime(d.year, d.month, d.day, time.hour, time.minute);
      Timestamp timestamp = Timestamp.fromDate(dateTime);
      AlarmModel alarmModel = AlarmModel();
      alarmModel.timestamp = timestamp;
      alarmModel.onOff = false;
      FirebaseFirestore.instance
          .collection('alarm')
          .doc()
          .set(alarmModel.toJson());

      showSnackBar(context, 'Alarm Added Successfully.');
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  return showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
          return AlertDialog(
            backgroundColor: darkGrey.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Text(
              textAlign: TextAlign.center,
              'Add Alarm',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: lightWhite,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select a time for the alarm.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: lightWhite,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CupertinoButton(
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (newTime == null) return;
                      setState(() {
                        time = newTime;
                      });
                    },
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      decoration: BoxDecoration(
                        color: lightPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: lightWhite,
                            size: 40,
                          ),
                          const SizedBox(width: 18),
                          Text(
                            time.format(context).toString(),
                            style: TextStyle(
                              color: lightWhite,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // width: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: lightPurple.withOpacity(0.2),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: lightWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          'Cancel',
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CupertinoButton(
                      onPressed: () {
                        add(time);
                        Navigator.pop(context);
                      },
                      child: Container(
                        // width: 75,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: lightPurple.withOpacity(0.2),
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: lightWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          'Add',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
