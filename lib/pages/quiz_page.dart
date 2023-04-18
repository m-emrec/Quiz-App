import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/game_provider.dart';
import 'package:quiz_app/utils/timer_box.dart';

import '../utils/question_card.dart';

class QuizPage extends StatelessWidget {
  QuizPage({super.key});

  static const routeName = "quiz-page";

  final PageController _controller = PageController();

  void nextQuestion(BuildContext context) {
    Provider.of<Game>(context, listen: false).isAnswered = false;
    Provider.of<Game>(context, listen: false).nextQuestion();
    _controller.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Take the questions list from GameProvider and shuffle the list

    return Scaffold(
      appBar: AppBar(
        title: Consumer<Game>(
            builder: (context, value, child) =>
                Text("Soru : ${value.questionNumber}")),
      ),
      body: Stack(
        children: [
          TimerBox(),
          PageView.builder(
            controller: _controller,
            itemCount: Game().questions["questions"].length,
            itemBuilder: (context, index) {
              //
              // questionData contains question:"Question" , answers : [a,b,c,d]
              return Stack(
                children: [
                  // Timer

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // The card which displays the question and answers.
                        Consumer<Game>(builder: (context, value, child) {
                          final List<Map> questions =
                              Provider.of<Game>(context, listen: false)
                                  .questions["questions"];
                          final Map questionData = questions[index];
                          return QuestionCard(
                            questionData: questionData,
                          );
                        }),
                      ],
                    ),
                  ),
                  // Two buttons in a Row | Pass and Next
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        onPressed: () => nextQuestion(context),
                        child: const Text("Pas"),
                      ),
                    ),
                  ),
                  Consumer<Game>(builder: (context, value, child) {
                    return Visibility(
                      visible: value.isAnswered,
                      child: Positioned(
                        right: 15,
                        bottom: 10,
                        child: ElevatedButton(
                          onPressed: () => nextQuestion(context),
                          child: const Text("Sonraki"),
                        ),
                      ),
                    );
                  })
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
