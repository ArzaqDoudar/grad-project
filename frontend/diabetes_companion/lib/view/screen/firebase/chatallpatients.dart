import 'package:diabetes_companion/controller/firebase/chatallpatientscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ChatAllPatients extends StatelessWidget {
  const ChatAllPatients({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(ChatAllPatientsControllerImp());
    ChatAllPatientsControllerImp controller = ChatAllPatientsControllerImp();
    Get.put(controller);

    return Scaffold(
      body: GetBuilder<ChatAllPatientsControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: ColorApp.blue,
            title: const Text('المرضى'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            children: controller.patentWedgets,
          ),
        ),
      ),
    );
  }
}
