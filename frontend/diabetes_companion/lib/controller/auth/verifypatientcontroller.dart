import '../../data/datasource/remote/auth/forgetpassword/resendverifycode.dart';
import '/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyPatientController extends GetxController {
  checkCode(String verificationCode);
  resendCode();
}

class VerifyPatientControllerImp extends VerifyPatientController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  ReSendVerifyCodeData reSendVerifyCodeData = ReSendVerifyCodeData(Get.find());

  // GlobalKey<FormState> formstateverifypatient = GlobalKey<FormState>();
  late String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  resendCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reSendVerifyCodeData.postData(email!);
    print("==================  resend Controller $response ");
    statusRequest = handlingData(response);
    print("================== STATUS REQ $statusRequest ====================");
  }

  @override
  checkCode(String verificationCode) async {
    print("================== EMAIL $email ");
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postData(email!, verificationCode);
    print("================== Controller $response ");
    statusRequest = handlingData(response);
    print("================== STATUS REQ $statusRequest ====================");

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        print(
          'تم تفعيل حسابك بنجاح',
        );
        Get.defaultDialog(
          title: 'Success',
          middleText: 'تم تفعيل حسابك بنجاح',
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              backgroundColor: ColorApp.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              Get.offNamed(RouteApp.login);
            },
            child: const Text(
              'استمر',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.white),
            ),
          ),
        );
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
  void onInit() {
    email = Get.arguments['email']; // passing parameter from page to another
    update();
    print(
        "************************** EMAIL onInit $email ***********************");

    super.onInit();
  }
}
