import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/providers/game_provider.dart';

class TimerBox extends StatelessWidget {
  TimerBox({super.key});

  final DateTime startTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Provider.of<Game>(context).startTimer();
    Provider.of<Game>(context, listen: false).startTimer(context,startTime);
    // print(Provider.of<Game>(context).time);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
      ),
      width: double.infinity,
      height: 10,
      child: Consumer<Game>(
        builder: (context, value, child) {
          print(value.time);
          return FractionallySizedBox(
            alignment: Alignment.topRight,
            widthFactor: value.time / value.gameDuration.inSeconds,
            child: Container(
              color: Colors.red,
              child: Text(
                value.time.toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}
