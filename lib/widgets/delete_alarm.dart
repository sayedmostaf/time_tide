import 'dart:js_interop_unsafe';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/widgets/show_snack_bar.dart';

deleteAlarm(BuildContext context, String id) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: darkGrey.withOpacity(.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      title: Text(
        textAlign: TextAlign.center,
        "Delete Alarm",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: lightWhite,
        ),
      ),
      content: Text(
        'Are you sure you want to delete this?',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: lightWhite,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Container(
                width: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: lightBlueishPurple.withOpacity(.2),
                ),
                child: Text(
                  'Cancel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoButton(
              child: Container(
                width: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: lightBlueishPurple.withOpacity(.2),
                ),
                child: Text(
                  'Delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () {
                try {
                  FirebaseFirestore.instance
                      .collection('alarm')
                      .doc(id)
                      .delete();
                  showSnackBar(context, 'Alarm Deleted Successfully.');
                } catch (e) {
                  showSnackBar(context, e.toString());
                }
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    ),
  );
}
