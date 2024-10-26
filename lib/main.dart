import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/firebase_options.dart';
import 'package:time_tide/models/menu_info.dart';
import 'package:time_tide/models/menu_type.dart';
import 'package:time_tide/pages/splash_page.dart';
import 'package:time_tide/providers/timer_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        home: const SplashPage(),
      ),
    );
  }
}
