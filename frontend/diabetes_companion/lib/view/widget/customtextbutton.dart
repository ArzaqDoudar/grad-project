import 'package:flutter/material.dart';
import '/core/constant/color.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressedFun;
  const CustomTextButton(
      {super.key, required this.label, required this.onPressedFun});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressedFun,
        child: Text(
          label,
          style: const TextStyle(
              color: ColorApp.blue,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ));
  }
}
