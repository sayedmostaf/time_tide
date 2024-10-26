import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/constants/colors.dart';
import 'package:time_tide/models/menu_info.dart';
import 'package:time_tide/models/menu_item.dart';
import 'package:time_tide/models/menu_type.dart';
import 'package:time_tide/pages/alarm_page.dart';
import 'package:time_tide/pages/clock_page.dart';
import 'package:time_tide/pages/stop_watch_page.dart';
import 'package:time_tide/pages/timer_page.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockPage();
                } else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else if (value.menuType == MenuType.timer) {
                  return const TimerPage();
                } else {
                  return const StopWatchPage();
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.white54, height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 3),
                ...menuItems
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: MenuButton(
                          image: e.imageSource!,
                          title: e.title!,
                          currentMenuInfo: e,
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
