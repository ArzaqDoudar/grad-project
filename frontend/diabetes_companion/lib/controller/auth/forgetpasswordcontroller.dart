import 'package:flutter/material.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/forgetpassword/checkemail.dart';
import '../../data/datasource/remote/auth/forgetpassword/resetpassword.dart';
import '../../data/datasource/remote/auth/verifycodesignup.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkVerificationCode(verificationCode);
  resetPassword();
  sendVerificationCode();
  resendCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstateforget = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController code;
  late TextEditingController newpassword;
  late TextEditingController confirmpassword;

  StatusRequest statusRequest = StatusRequest.none;

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  // late String verifycode;

  @override
  void onInit() {
    code = TextEditingController();
    email = TextEditingController();
    newpassword = TextEditingController();
    confirmpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    code.dispose();
    email.dispose();
    newpassword.dispose();
    confirmpassword.dispose();
    super.dispose();
  }

  @override
  sendVerificationCode() async {
    var formdata = formstateforget.currentState;

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
            // title: 'Warning',
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
        print("else forget");
      }
      update();
    }
  }

  @override
  checkVerificationCode(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpData.postData(email.text, verificationCode);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        Get.offNamed(RouteApp.newpassword, arguments: {
          'email': email.text,
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
  resetPassword() async {
    var formdata = formstateforget.currentState;
    if (newpassword.text == confirmpassword.text) {
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await resetPasswordData.postData(email.text, newpassword.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == true) {
            Get.offNamed(RouteApp.login);
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
          }
        }
        update();
      } else {
        print('not valied');
      }
    } else {
      print('pass != confirm');
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

  @override
  resendCode() {
    // TODO: implement resendCode
    throw UnimplementedError();
  }
}
