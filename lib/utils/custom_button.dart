import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class CButton extends StatelessWidget {
  const CButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.buttonColor,
      shape: const StadiumBorder(),
      child: SizedBox(
        width: double.infinity,
        child: InkWell(
          customBorder: const StadiumBorder(),
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
