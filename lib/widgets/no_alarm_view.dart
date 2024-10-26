import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class NoAlarmView extends StatelessWidget {
  const NoAlarmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text(
            'Nothing to show!',
            style: TextStyle(color: lightWhite, fontSize: 24),
          ),
          Text(
            'Add Alarm to get started!',
            style: TextStyle(color: lightWhite, fontSize: 24),
          ),
        ],
      ),
    );
  }
}
