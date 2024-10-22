import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/clock_view.dart';
import 'package:time_tide/models/menu_info.dart';
import 'package:time_tide/models/menu_type.dart';
import 'package:time_tide/pages/home_page.dart';
import 'package:time_tide/providers/timer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock),
        ),
        ChangeNotifierProvider<TimerProvider>(
          create: (context) => TimerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Garet'),
        home: const HomePage(),
      ),
    );
  }
}
