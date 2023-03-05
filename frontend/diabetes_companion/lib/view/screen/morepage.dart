import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // bottomNavigationBar: Cu(),
      body: Text(
        'More',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
