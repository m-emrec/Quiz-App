
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/pages/end_screen.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/quiz_page.dart';
import 'package:quiz_app/providers/game_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Game(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          appBarTheme: const AppBarTheme(color: AppColors.primaryColor),
          cardColor: AppColors.cardColor,
          textTheme: const TextTheme(titleLarge: TextStyles.title),
          canvasColor: AppColors.canvasColor,
        ),
        routes: {
          "/": (context) => const HomePage(),
          QuizPage.routeName: (context) => QuizPage(),
          EndScreen.routeName: (context) => const EndScreen(),
        },
      ),
    );
  }
}
