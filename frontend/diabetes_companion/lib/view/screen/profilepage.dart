import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // bottomNavigationBar: Cu(),
      body: Text(
        'Profile',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
