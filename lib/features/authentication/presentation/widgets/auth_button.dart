

import 'package:flutter/material.dart';
import 'package:task_master/core/utils/custom_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.cs,
    required this.text,
    this.onPressed,
  });

  final Size cs;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(
              cs.width * 0.9,
              52,
            ),
            elevation: 1,
            backgroundColor: CustomColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
