import '../../../core/class/handlingdataview.dart';
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
    Get.put(LoginControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GetBuilder<LoginControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Image(
                  // image: NetworkImage(
                  //     'https://demo-bucket.eu-central-1.linodeobjects.com/Test.png'),
                  // 'https://link.storjshare.io/jux4cesi54tvwuf4rr5riltwpboa/diabetes-companion/avatar.png'),
                  image: AssetImage(ImageAsset.loginImage),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Form(
                key: controller.formstatelogin,
                child: Padding(
                  padding: screenWidth > 700
                      ? const EdgeInsets.symmetric(horizontal: 100)
                      : const EdgeInsets.symmetric(horizontal: 25),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: [
                            TextFieldAuth(
                              type: TextInputType.emailAddress,
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
                          ],
                        ),
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
            ],
          ),
        ),
      ),
    ));
  }
}
