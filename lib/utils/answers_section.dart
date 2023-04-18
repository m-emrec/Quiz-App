import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/game_provider.dart';

class AnswersSection extends StatefulWidget {
  AnswersSection({
    super.key,
    required this.answersData,
  });

  final List<Map> answersData;
  //bool _isAnswered = false;
  @override
  State<AnswersSection> createState() => _AnswersSectionState();
}

class _AnswersSectionState extends State<AnswersSection> {
  // This function takes the selceted answer and if the selected answer contains the correct answer it will increase the score.
  void onTap(Map selectedAns) {
    setState(() {
      Provider.of<Game>(context, listen: false).changeIsAnswered() ;
    });
    if (selectedAns["isAnswer"] == true) {
      // print("true");
      Provider.of<Game>(context,listen: false).increaseScore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool _isAnswered = Provider.of<Game>(context).isAnswered;
    // print(widget.answersData);
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            ...widget.answersData.map(
              (e) {
                final String option = e.keys.first
                    .toString()
                    .toUpperCase()
                    .replaceAll("(", "")
                    .replaceAll(")", "");
                final String answerText = e.values.first
                    .toString()
                    .replaceAll("(", "")
                    .replaceAll(")", "");
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: const StadiumBorder(),
                    tileColor: _isAnswered
                        ? e["isAnswer"]
                            ? Colors.green
                            : Colors.red
                        : AppColors.buttonColor,
                    leading: Text(
                      option,
                    ),
                    title: Text(
                      answerText,
                    ),
                    onTap: _isAnswered ? null : () => onTap(e),
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
