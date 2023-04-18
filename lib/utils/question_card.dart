import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/utils/question_title.dart';

import '../constants.dart';
import '../providers/game_provider.dart';
import 'answers_section.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.questionData,
  });

  final Map questionData;

  @override
  Widget build(BuildContext context) {
    
    final String question = questionData["question"];
    final List<Map> answers = questionData["answers"];

    return Card(
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The question
              QuestionTitle(question: question),
              const Divider(
                thickness: 3,
              ),
              //Answers
              AnswersSection(
                answersData: answers,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
