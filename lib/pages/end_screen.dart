import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/providers/game_provider.dart';
import 'package:quiz_app/utils/custom_button.dart';
import 'package:quiz_app/utils/custom_title.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  static const routeName = "end-screen";

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  late int lastScore;


  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    // await Provider.of<Game>(context).getLastScore();
  }

  @override
  Widget build(BuildContext context) {
    logger.i("build");
    lastScore = Provider.of<Game>(context).lastScore;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CTitle(title: "Skorunuz  "),
                    ),
                    const Spacer(),
                    Consumer<Game>(builder: (context, value, child) {
                      value.setLastScore(value.score);
                      return Center(
                        child: Text(
                          value.score.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontSize: 45),
                        ),
                      );
                    }),
                    Text("Son Skorunuz : $lastScore"),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: CButton(
              label: "Ana Sayfaya Dön",
              onTap: () => Navigator.of(context).pushReplacementNamed("/"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
