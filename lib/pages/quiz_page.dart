import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/providers/game_provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  static const routeName = "quiz-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        itemCount: Provider.of<Game>(context).questions.length,
        itemBuilder: (context, index) {
          final questions =
              Provider.of<Game>(context).shuffleQuestions()["questions"];
          final questionData = questions[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionCard(
                questionData: questionData,
              ),
            ],
          );
        },
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, this.questionData});

  final questionData;

  @override
  Widget build(BuildContext context) {
    final _question = questionData["question"];
    final _answers = questionData["answers"];

    return Card(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          // height: 700,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuestionTitle(question: _question),
              const Divider(),
              AnswersSection(
                answersData: _answers,
                correctAnswer: questionData["answer"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({super.key, required this.question});

  final String question;
  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class AnswersSection extends StatefulWidget {
  const AnswersSection(
      {super.key, required this.answersData, required this.correctAnswer});

  final List answersData;
  final String correctAnswer;
  @override
  State<AnswersSection> createState() => _AnswersSectionState();
}

class _AnswersSectionState extends State<AnswersSection> {
  void onTap(String selectedAns) {
    if (selectedAns.contains(widget.correctAnswer)) {
      print("True");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...widget.answersData.map(
          (e) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                shape: const StadiumBorder(),
                tileColor: AppColors.buttonColor,
                leading: Text(
                  e.keys
                      .toString()
                      .toUpperCase()
                      .replaceAll("(", "")
                      .replaceAll(")", ""),
                ),
                title: Text(
                  e.values.toString().replaceAll("(", "").replaceAll(")", ""),
                ),
                onTap: () => onTap(e.keys.toString()),
              ),
            );
          },
        )
      ],
    );
  }
}
