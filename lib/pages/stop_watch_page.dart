import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:time_tide/widgets/page_header.dart';
import 'package:time_tide/widgets/reset_button.dart';
import 'package:time_tide/widgets/stop_watch_display.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({super.key});

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  late Stopwatch stopwatch;
  late Timer timer;

  void handleStart() {
    setState(() {
      if (stopwatch.isRunning) {
        stopwatch.stop();
      } else {
        stopwatch.start();
      }
    });
  }

  String formattedTime() {
    var milli = stopwatch.elapsed.inMilliseconds;
    String milliSeconds = ((milli % 1000) ~/ 10).toString().padLeft(2, '0');
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, '0');
    String minutes = ((milli ~/ 1000) ~/ 60 % 60).toString().padLeft(2, '0');
    String hours = ((milli ~/ 1000) ~/ 3600).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds:$milliSeconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const PageHeader(
          image: 'assets/images/stopwatch_icon.png',
          title: 'Stop Watch',
        ),
        const SizedBox(height: 100),
        StopWatchDisplay(displayTime: formattedTime(), onPressed: handleStart),
        const SizedBox(height: 35),
        ResetButton(
            onPressed: () => setState(() {
                  stopwatch.reset();
                }))
      ],
    );
  }
}
