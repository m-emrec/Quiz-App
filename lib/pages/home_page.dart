import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/providers/game_provider.dart';

import '../utils/menu_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = "home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Game>(context,listen: true).getDataFromPrefs();
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
          const Center(
            child: MenuCard(),
          )
        ],
      ),
    );
  }
}
