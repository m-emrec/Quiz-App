import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/game_provider.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({super.key});

  static const routeName = "end-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Game>(
          builder: (context, value, child) => Center(
                child: Text(value.score.toString()),
              )),
    );
  }
}
