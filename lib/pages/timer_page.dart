import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:time_tide/providers/timer_provider.dart';
import 'package:time_tide/widgets/page_header.dart';
import 'package:time_tide/widgets/timer_controls.dart';
import 'package:time_tide/widgets/timer_display.dart';
import 'package:time_tide/widgets/timer_picker.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const PageHeader(image: 'assets/images/timer_icon.png', title: 'Timer'),
        const SizedBox(height: 100),
        TimerDisplay(
          remainingTime: timerProvider.remainingTime,
          initialTime: timerProvider.initialTime,
          onTimeTap: () => showTimePickerDialog(context, timerProvider),
        ),
        const SizedBox(
          height: 85,
        ),
        TimerControls(
          isRunning: timerProvider.isRunning,
          onReset: timerProvider.resetTimer,
          onStartPause: timerProvider.isRunning
              ? timerProvider.pauseTimer
              : timerProvider.startTimer,
        ),
      ],
    );
  }
}
