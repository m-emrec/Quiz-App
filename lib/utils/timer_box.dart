import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/providers/game_provider.dart';

import '../pages/end_screen.dart';

class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  State<TimerBox> createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  late int _remainingTime;
  late int _gameDuration;
  late Timer _timer;

  void startTimer(BuildContext ctx, DateTime startTime, int gameDuration) {
    _remainingTime = gameDuration;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final DateTime now = DateTime.now();
        final int difference = now.difference(startTime).inSeconds;

        // if time is up navigate to End Screen
        if (difference == gameDuration) {
          timer.cancel();
          Navigator.of(ctx).pushReplacementNamed(EndScreen.routeName);
        }

        setState(() {
          _remainingTime = gameDuration - difference;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    final DateTime startTime = DateTime.now();
    _gameDuration =
        Provider.of<Game>(context, listen: false).gameDuration.inSeconds;
    startTimer(context, startTime, _gameDuration);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.buttonColor,
          ),
          width: double.infinity,
          height: 25,
          child: FractionallySizedBox(
            alignment: Alignment.topRight,
            widthFactor: _remainingTime / _gameDuration,
            child: Container(
              color: AppColors.cardColor,
            ),
          ),
        ),
        // Remaining Time text
        Positioned(
          right: 5,
          top: 5,
          child: Text(
            _remainingTime.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
