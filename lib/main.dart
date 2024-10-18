import 'package:flutter/material.dart';
import 'package:time_tide/clock_view.dart';
import 'package:time_tide/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const HomePage(),
        // body: Container(
        //   alignment: Alignment.center,
        //   color: const Color(0xFF2D2F41),
        //   child: const ClockView(size: 300),
        // ),
      ),
    );
  }
}
