import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/models/menu_info.dart';
import 'package:time_tide/models/menu_item.dart';
import 'package:time_tide/pages/clock_page.dart';
import 'package:time_tide/widgets/menu_button.dart';

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
                    width: 45,
                    height: 45,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                const SizedBox(height: 100),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: menuItems
                      .map(
                        (e) => MenuButton(
                          image: e.imageSource!,
                          title: e.title!,
                          currentMenuInfo: e,
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(child: Consumer<MenuInfo>(
            builder: (context, value, child) {
              return const ClockPage();
            },
          ))
        ],
      ),
    );
  }
}
