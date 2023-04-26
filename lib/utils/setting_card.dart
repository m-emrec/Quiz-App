import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/providers/game_provider.dart';
import 'package:quiz_app/utils/custom_button.dart';
import 'package:quiz_app/constants.dart';

class SettingsPopUp extends StatelessWidget {
  SettingsPopUp({super.key});

  final TextEditingController _gameDurationController = TextEditingController();
  final TextEditingController _fontSizeController = TextEditingController();

  void _savePrefs(
      {required BuildContext context, String? newDuration, int? fontSize}) {
    logger.i("newDuration :  $newDuration");
    var oldGameDuration =
        Provider.of<Game>(context, listen: false).gameDuration;
    if (oldGameDuration != newDuration) {
      Provider.of<Game>(context, listen: false).setGameDuration(
        int.parse(newDuration!),
      );
      final SnackBar snackBar = SnackBar(
        content: const Text(
          "Oyun Süresi Güncellendi.",
          style: TextStyle(
            color: AppColors.textColor,
          ),
        ),
        margin: const EdgeInsets.all(12),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Theme.of(context).primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0),
          ],
        ),
      ),
      child: Consumer<Game>(
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Game Duration setting
            InputField(
              label: "Oyun Süresi",
              function: () {},
              controller: _gameDurationController,
              defaultValue: value.gameDuration.inSeconds.toString(),
            ),
            // // Text Size setting
            // InputField(
            //   label: "Yazı Boyutu",
            //   function: () {},
            //   controller: _fontSizeController,
            //   defaultValue: "16",
            // ),
            // Save button
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: CButton(
                label: "Kaydet",
                onTap: () => _savePrefs(
                    context: context,
                    newDuration: _gameDurationController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    required this.function,
    required this.controller,
    required this.defaultValue,
  });

  final String label;
  final Function function;
  final TextEditingController controller;
  final String defaultValue;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // I used didUpdateWidget because  showModalBottomSheet is setting the state when the keyboard removed from the screen
  //so because of this the text of the controller resets itself every time the keyboard is removed.
  @override
  void didUpdateWidget(covariant InputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller.text.isNotEmpty) {
      widget.controller.text = oldWidget.controller.text;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, BoxConstraints constraints) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        width: constraints.maxWidth * 0.9,
        height: 80,
        child: Column(
          children: [
            // Title
            Text(
              widget.label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Input Field
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: Colors.white,
                    child: TextField(
                      showCursor: false,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: widget.controller,
                      onSubmitted: (value) => setState(
                        () {
                          logger.i(value);
                          widget.controller.text = value;
                          logger.e(widget.controller.text);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
