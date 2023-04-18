
import 'package:flutter/material.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({
    super.key,
    required this.question,
  });

  final String question;
  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}