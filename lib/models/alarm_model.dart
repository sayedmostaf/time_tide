import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmModel {
  Timestamp? timestamp;
  bool? onOff;

  AlarmModel({this.timestamp, this.onOff});
  Map<String, dynamic> toJson() {
    return {
      'time': timestamp,
      'onOff': onOff,
    };
  }

  factory AlarmModel.fromJson(json) {
    return AlarmModel(
      timestamp: json['time'],
      onOff: json['onOff'],
    );
  }
}
