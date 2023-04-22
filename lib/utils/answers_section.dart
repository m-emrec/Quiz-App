import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/game_provider.dart';

class AnswersSection extends StatefulWidget {
  const AnswersSection({
    super.key,
    required this.answersData,
  });

  // the list contains Map of Answers
  final List<Map> answersData;
  @override
  State<AnswersSection> createState() => _AnswersSectionState();
}

class _AnswersSectionState extends State<AnswersSection> {
  // This function takes the selceted answer and if the selected answer contains the correct answer it will increase the score.
  void onTap(Map selectedAns) {
    // if an answer selected change the valu of isAnswered to true. This way I can change the color of answer buttons and prevent changing the answer
    setState(() {
      Provider.of<Game>(context, listen: false).changeIsAnswered();
    });
    // if the answer is true than increase the score.
    if (selectedAns["isAnswer"] == true) {
      Provider.of<Game>(context, listen: false).increaseScore();
    }
  }

  @override
  void initState() {
    super.initState();
    // when this widget launched set the value of isAnswered to false.
    Provider.of<Game>(context, listen: false).isAnswered = false;
  }

  @override
  Widget build(BuildContext context) {

    final bool isAnswered = Provider.of<Game>(context).isAnswered;
    return Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            
            ...widget.answersData.map(
              (e) {
                // answers (A,B,C,D)
                final String option = e.keys.first
                    .toString()
                    .toUpperCase()
                    .replaceAll("(", "")
                    .replaceAll(")", "");
                // Answer text
                final String answerText = e.values.first
                    .toString()
                    .replaceAll("(", "")
                    .replaceAll(")", "");
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    shape: const StadiumBorder(),
                    // if isAnswered false then tile color will be AppColors.buttonColor if not 
                      // if answer is true tileColor will be green if not tileColor will be Red.
                    tileColor: isAnswered
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
                    // if isAnswered false call the onTap function , if not set the value of onTap to null this way user can't click the buttons.
                    onTap: isAnswered ? null : () => onTap(e),
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
