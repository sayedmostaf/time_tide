import 'package:flutter/material.dart';
import 'package:time_tide/constants/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          CircularProgressIndicator(
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation<Color>(lightWhite),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Loading...',
            style: TextStyle(
              color: lightWhite,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
