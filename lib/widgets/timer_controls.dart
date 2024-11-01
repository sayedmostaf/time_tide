import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class TimerControls extends StatelessWidget {
  final bool isRunning;
  final VoidCallback onReset;
  final VoidCallback onStartPause;

  const TimerControls({
    super.key,
    required this.isRunning,
    required this.onReset,
    required this.onStartPause,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(
          icon: Icons.close,
          onPressed: onReset,
          color: mediumGrey,
        ),
        const SizedBox(width: 60),
        _buildControlButton(
          icon: isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
          onPressed: onStartPause,
          color: lightBlueishPurple,
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 35,
          color: lightWhite,
        ),
      ),
    );
  }
}
