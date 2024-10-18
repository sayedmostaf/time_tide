import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                const SizedBox(height: 15),
                SafeArea(
                  child: SizedBox(
                    width: 450,
                    height: 45,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
