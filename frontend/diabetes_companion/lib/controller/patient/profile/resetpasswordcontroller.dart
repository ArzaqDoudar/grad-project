import '/data/datasource/remote/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';

abstract class ExampleController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ExampleController {
  late String? id;
  late String? email;

  late TextEditingController oldpassword;
  late TextEditingController newpassword;
  late TextEditingController confirmpassword;
  StatusRequest statusRequest = StatusRequest.none;

  PatientData patientData = PatientData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];

    oldpassword = TextEditingController();
    newpassword = TextEditingController();
    confirmpassword = TextEditingController();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    if (newpassword.text == confirmpassword.text) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await patientData.changePassword(
          id!, oldpassword.text, newpassword.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          Get.offNamed(RouteApp.profile, arguments: {
            'id': id,
            'email': email,
          });
        } else {
          Get.defaultDialog(
            title: 'Warning',
            middleText: response['msg'],
            cancel: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  backgroundColor: ColorApp.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'رجوع',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorApp.white),
                )),
          );
          statusRequest = StatusRequest.failure;

          oldpassword.clear();
          newpassword.clear();
          confirmpassword.clear();
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: 'تحذير',
        middleText: 'تحقق من كلمة المرور',
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            backgroundColor: ColorApp.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'حاول مرة اخرى',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorApp.white),
          ),
        ),
      );
      newpassword.clear();
      confirmpassword.clear();
      update();
    }
  }
}
