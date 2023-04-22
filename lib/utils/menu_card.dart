import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/utils/setting.dart';

import '../pages/quiz_page.dart';
import '../providers/game_provider.dart';
import 'custom_button.dart';
import 'custom_title.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    super.key,
  });

  void showSettingsDialogBox(BuildContext ctx) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.grey.withOpacity(0.7),
      context: ctx,
      builder: (_) => const SettingsPopUp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Menu title
              const CTitle(title: "Menü"),
              // Start game button
              CButton(
                  label: "Başla",
                  onTap: () => {
                        // Just reset the score before starting the new game.
                        Provider.of<Game>(context, listen: false).resetGame(),
                        Navigator.of(context).pushNamed(QuizPage.routeName)
                      }),
              // Just for some spacing
              const SizedBox(
                height: 25,
              ),
              // Settings button
              CButton(
                label: "Ayarlar",
                onTap: () => showSettingsDialogBox(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
