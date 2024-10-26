import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_tide/widgets/alarm_item.dart';
import 'package:time_tide/widgets/loading_view.dart';
import 'package:time_tide/widgets/no_alarm_view.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('alarm').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingView();
        }
        if (snapshot.data!.docs.isEmpty) {
          return const NoAlarmView();
        }

        final data = snapshot.data;
        return ListView.builder(
          itemCount: data?.docs.length,
          itemBuilder: (context, index) {
            Timestamp t = data?.docs[index].get('time');
            DateTime date = t.toDate();
            String formattedTime = DateFormat.jm().format(date);
            bool on = data?.docs[index].get('onOff');
            return AlarmItem(
              id: data!.docs[index].id,
              formattedTime: formattedTime,
              on: on,
              time: data.docs[index].get('time'),
              index: index,
            );
          },
        );
      },
    );
  }
}
