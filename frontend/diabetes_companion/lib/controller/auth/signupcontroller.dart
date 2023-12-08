import '/core/constant/color.dart';
import '/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;

  StatusRequest statusRequest = StatusRequest.none;

  SignUpData signupData = SignUpData(Get.find());
  List data = [];

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    // formstatesignup.currentState!.dispose();
    super.dispose();
  }

  @override
  signup() async {
    print("start insert");
    var formdata = formstatesignup.currentState;
    if (password.text == confirmpassword.text) {
      if (formdata!.validate()) {
        // print('valid');
        // Get.offNamed(RouteApp.mainscreen);

        statusRequest = StatusRequest.loading;
        update();
        var response =
            await signupData.postData(name.text, email.text, password.text);
        print("================== Controller $response ");
        print("response['code'] ====== >");
        print(response['code']);
        statusRequest = handlingData(response);
        // update(); // this function from core/functions folder
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == true) {
            print("response['code'] ====== >");
            print(response['code']);
            // data.addAll(response['code']);
            Get.offNamed(RouteApp.verifypatient, arguments: {
              'email': email.text,
              // TODO get id from this user
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
      password.clear();
      confirmpassword.clear();
      update();
    }

    // Get.offNamed(RouteApp.mainscreen); // TODO go to edit profile
  }

  @override
  goToLogin() {
    Get.offNamed(RouteApp.login);
  }
}


// void signupUser() async {
//     if (idController.text.isNotEmpty &&
//         nameController.text.isNotEmpty &&
//         emailController.text.isNotEmpty &&
//         passwordController.text.isNotEmpty &&
//         confirmPasswordController.text.isNotEmpty) {
//       // nameController.text = 'ARZAQZIADDOUDAR';
//       var loginBody = {
//         "email": emailController.text,
//         "password": passwordController.text,
//         "id": idController.text,
//       };
//       print(loginBody);
//       var response = await http.post(
//         Uri.parse('http://localhost:3000/patients'),
//         headers: {"Content-type": "application/json"},
//         body: jsonEncode(loginBody),
//       );
//       print(response);
//       // print(jsonEncode(loginBody));
//     } else {
//       print('loginBody');

//       // setState(() {
//       //   _isNotValidate = false;
//       // });
//     }
//   }