import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../controller/patient/nodoctorcontroller.dart';
import '../../../core/constant/color.dart';

class NoDoctorChat extends StatelessWidget {
  const NoDoctorChat({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NoDoctorControllerImp());
    return GetBuilder<NoDoctorControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorApp.blue,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'لا يوجد محادثة , يرجى مراجعة طبيبك',
                style: TextStyle(fontSize: 20, color: ColorApp.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              QrImage(
                data: controller.id!,
                version: QrVersions.auto,
                size: 200,
                // gapless: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                controller.id!,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorApp.black),
              ),
            ],
          ),
        ),
      );
    });
  }
}
