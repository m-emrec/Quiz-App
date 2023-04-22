import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:quiz_app/utils/custom_button.dart';
import 'package:quiz_app/utils/custom_title.dart';

class SettingsPopUp extends StatelessWidget {
  const SettingsPopUp({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Game Duration setting
          InputField(
            label: "Oyun Süresi",
            function: () {},
          ),
           // Text Size setting
          InputField(
            label: "Yazı Boyutu",
            function: () {},
          ),
          // Save button
          SizedBox(
            width: MediaQuery.of(context).size.width * .7,
            child: CButton(
              label: "Kaydet",
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.label,
    required this.function,
  });

  final String label;
  final Function function;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, BoxConstraints constraints) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(15),
        ),
        width: constraints.maxWidth * 0.9,
        height: 70,
        child: Column(
          children: [
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Text("60"),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
