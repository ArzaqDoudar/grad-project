import 'package:flutter/material.dart';
import '/global.dart' as globals;

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/login.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstatelogin = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());
  List data = [];
  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value) {
    //   print('token == $value');
    //   String? token = value;
    // });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    // formstatelogin.currentState!.dispose();
    super.dispose();
  }

  @override
  login() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.postData(email.text, password.text);
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      print("success");
      print("response = $response");
      if (response['status'] == true) {
        print('status');
        if (response['type'] == 'patient') {
          print(
              "**************************************************************");
          print("USER ===============");
          print(response['user']);
          print("Eamil ===============");
          print(email);
          print("USER ID ===============");
          print(response['user']['_id']);
          print(
              "**************************************************************");
          print(response['user']['email']);
          print(
              "**************************************************************");
          print(email.text);
          print(
              "**************************************************************");
          globals.id = response['user']['_id'];
          // Get.toNamed(RouteApp.home);
          Get.offNamed(RouteApp.home, arguments: {
            'id': response['user']['_id'],
            'email': response['user']['email'],
          });
        } else if (response['type'] == 'doctor') {
          Get.offNamed(RouteApp.homedoctor, arguments: {
            'id': response['user']['_id'],
            'email': response['user']['email'],
          });
        }
        // else if (response['type'] == 'admin') {
        //   // TODO Login as Admin
        // }
      } else if (response['active'] == false) {
        Get.defaultDialog(
          title: 'ثثثثث',
          middleText: response['msg'],
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              backgroundColor: ColorApp.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () {
              Get.offNamed(RouteApp.verifypatient, arguments: {
                'email': email.text,
              });
            },
            child: const Text(
              'تفعيل الحساب',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.white),
            ),
          ),
        );
        statusRequest = StatusRequest.failure;
        password.clear();
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
        password.clear();
      }
    } else {
      print("else login");
    }
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed(RouteApp.signup);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(RouteApp.forgetpasswordemail);
  }
}
