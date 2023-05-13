import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class NoDoctorChat extends StatelessWidget {
  const NoDoctorChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.blue,
      ),
      body: const Center(
        child: Text(
          'لا يوجد محادثة , يرجى مراجعة طبيبك',
          style: TextStyle(fontSize: 20, color: ColorApp.grey),
        ),
      ),
    );
  }
}
