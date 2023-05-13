import '../../../data/datasource/remote/auth/forgetpassword/resendverifycode.dart';
import '../../../data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class VerificationCodeController extends GetxController {
  checkVerificationCode(verificationCode);
  resendCode();
}

class VerificationCodeControllerImp extends VerificationCodeController {
  GlobalKey<FormState> formstateforgetpasswordcode = GlobalKey<FormState>();
  late String? email;

  late TextEditingController code;

  StatusRequest statusRequest = StatusRequest.none;

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  ReSendVerifyCodeData reSendVerifyCodeData = ReSendVerifyCodeData(Get.find());

  @override
  void onInit() {
    code = TextEditingController();
    email = Get.arguments['email'];
    update();
    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  @override
  checkVerificationCode(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postData(email!, verificationCode);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        Get.offNamed(RouteApp.newpassword, arguments: {
          'email': email,
        });
      } else {
        Get.defaultDialog(
          title: 'Warning',
          middleText: 'الرمز خاطىء',
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
                'اعد المحاولة',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.white),
              )),
        );
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  resendCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reSendVerifyCodeData.postData(email!);

    print("================== Controller $response ");
    statusRequest = handlingData(response);
    update();
    print("================== STATUS REQ $statusRequest ====================");
    if (statusRequest == StatusRequest.success) {
      Get.offNamed(RouteApp.forgetpasswordcode, arguments: {
        'email': email,
      });
    } else {
      Get.offNamed(RouteApp.forgetpasswordemail);
    }
  }
}
