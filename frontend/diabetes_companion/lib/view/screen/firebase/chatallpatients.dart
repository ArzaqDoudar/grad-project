import 'package:diabetes_companion/controller/firebase/chatallpatientscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class ChatAllPatients extends StatelessWidget {
  const ChatAllPatients({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatAllPatientsControllerImp());

    return GetBuilder<ChatAllPatientsControllerImp>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
          title: const Text('المرضى'),
        ),
        body: controller.patentWedgets.isNotEmpty
            ? ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: controller.patentWedgets)
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'لا يوجد مرضى',
                      style: TextStyle(fontSize: 24, color: ColorApp.grey),
                    ),
                    FilledButton(
                      onPressed: () => controller.goToAddPatient(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: ColorApp.nocolor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: const TextStyle(fontSize: 24),
                      ),
                      child: const Text(
                        'اضف مريض جديد؟',
                        style: TextStyle(color: ColorApp.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
