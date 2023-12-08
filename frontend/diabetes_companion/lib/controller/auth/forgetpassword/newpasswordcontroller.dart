import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/auth/forgetpassword/resetpassword.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class NewPasswordController extends GetxController {
  resetPassword();
}

class NewPasswordControllerImp extends NewPasswordController {
  GlobalKey<FormState> formstateforgetpasswordNew = GlobalKey<FormState>();
  late String? email;
  late TextEditingController newpassword;
  late TextEditingController confirmpassword;

  StatusRequest statusRequest = StatusRequest.none;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  @override
  void onInit() {
    email = Get.arguments['email'];
    newpassword = TextEditingController();
    confirmpassword = TextEditingController();
    update();
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    confirmpassword.dispose();
    // formstateforgetpasswordNew.currentState!.dispose();
    super.dispose();
  }

  @override
  resetPassword() async {
    var formdata = formstateforgetpasswordNew.currentState;
    print("formstateforgetpasswordNew");
    print(formstateforgetpasswordNew.currentState);
    print("formdata == $formdata");
    if (newpassword.text == confirmpassword.text) {
      if (formdata!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var response =
            await resetPasswordData.postData(email!, newpassword.text);
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
}
