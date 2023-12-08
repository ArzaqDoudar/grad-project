import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: TextStyle(fontSize: 30),
    );
  }
}
