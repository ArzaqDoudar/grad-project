import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/auth/forgetpassword/checkemail.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class EmailVerificationController extends GetxController {
  sendVerificationCode();
}

class EmailVerificationControllerImp extends EmailVerificationController {
  GlobalKey<FormState> formstateforgetpasswordEmail = GlobalKey<FormState>();
  late TextEditingController email;

  StatusRequest statusRequest = StatusRequest.none;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  // late String verifycode;

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    // formstateforgetpasswordEmail.currentState!.dispose();
    super.dispose();
  }

  @override
  sendVerificationCode() async {
    print("rforgetpasswordcode xxxxxxxxxxx");
    var formdata = formstateforgetpasswordEmail.currentState;

    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print("success");
        print("response = $response");
        if (response['status'] == true) {
          print('status');
          Get.offNamed(RouteApp.forgetpasswordcode, arguments: {
            'email': email.text,
          });
        } else {
          Get.defaultDialog(
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
        }
      } else {
        print("else EmailVerificationController");
      }
      update();
    }
  }
}
