import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/utils/custom_button.dart';
import 'package:quiz_app/utils/custom_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = "home-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quiz Game",
          style: TextStyle(color: AppColors.textColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            height: double.infinity,
            child: Image.network(
              "https://imageio.forbes.com/specials-images/imageserve/1146657078/Paper-concept--Question-Mark-Symbol-/960x0.jpg?format=jpg&width=960",
              fit: BoxFit.cover,
            ),
          ),
          // Menu Card
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Menu title
                      const CTitle(title: "Menu"),
                      // Start game button
                      CButton(
                        label: "Start",
                        onTap: () => 
                          Navigator.of(context).pushNamed(QuizPage.routeName)
                        ,
                      ),
                      // Just for some spacing
                      const SizedBox(
                        height: 25,
                      ),
                      // Settings button
                      CButton(label: "Settings", onTap: () {})
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
