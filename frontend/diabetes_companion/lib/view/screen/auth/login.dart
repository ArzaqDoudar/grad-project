import 'package:diabetes_companion/core/class/statusrequest.dart';

import '../../../core/functions/alertexitapp.dart';
import '/core/functions/validinput.dart';

import '../../../controller/auth/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/constant/color.dart';
import '/core/constant/imageasset.dart';
import '/view/widget/buttonauth.dart';
import '/view/widget/customtextbutton.dart';
import '../../widget/textfieldauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage(ImageAsset.loginImage),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            // GetBuilder<LoginControllerImp>(
            //   builder: (controller) => controller.statusRequest ==
            //           StatusRequest.loading
            //       ? const Center(
            //           child: Text('Loading ...'),
            //         )
            //       :
            Form(
              key: controller.formstatelogin,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'email', 0, 50);
                        },
                        textEditingController: controller.email,
                        passwordVisible: false,
                        lable: 'البريد الإلكتروني',
                        icon: const Icon(
                          Icons.email_outlined,
                          color: ColorApp.blue,
                        ),
                      ),
                      const SizedBox(height: 7),
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'password', 0, 50);
                        }, // TODO edit this
                        textEditingController: controller.password,
                        passwordVisible: true,
                        lable: 'كلمة المرور',
                        icon: const Icon(
                          Icons.lock_outline_rounded,
                          color: ColorApp.blue,
                        ),
                      ),
                      const SizedBox(height: 7),
                      ButtonAuth(
                        label: 'تسجيل الدخول',
                        onPressedFun: () {
                          controller.login();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextButton(
                            label: 'هل نسيت كلمة المرور؟',
                            onPressedFun: () {
                              controller.goToForgetPassword();
                            },
                          ),
                          CustomTextButton(
                            label: 'ليس لديك حساب؟',
                            onPressedFun: () {
                              controller.goToSignUp();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom == 0
                            ? 50
                            : 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
