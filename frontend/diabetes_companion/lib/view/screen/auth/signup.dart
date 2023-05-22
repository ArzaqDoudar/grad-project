import '../../../core/class/handlingdataview.dart';
import '/controller/auth/signupcontroller.dart';

import '../../../core/functions/validinput.dart';
import '/core/constant/color.dart';
import '/view/widget/buttonauth.dart';
import '/view/widget/customtextbutton.dart';
import '/view/widget/textfieldauth.dart';
import '/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  // bool _isNotValidate = false;

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
        body: GetBuilder<SignUpControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage(ImageAsset.signupImage),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Form(
                key: controller.formstatesignup,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'حساب جديد ',
                        style: TextStyle(fontSize: 32, color: ColorApp.blue),
                      ),
                      const SizedBox(height: 25),
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'name', 0, 20);
                        },
                        textEditingController: controller.name,
                        lable: 'الاسم',
                        passwordVisible: false,
                        icon: const Icon(Icons.abc, color: ColorApp.blue),
                      ),
                      const SizedBox(height: 15),
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'email', 0, 50);
                        },
                        textEditingController: controller.email,
                        lable: 'البريد الإلكتروني',
                        passwordVisible: false,
                        type: TextInputType.emailAddress,
                        icon: const Icon(Icons.email_outlined,
                            color: ColorApp.blue),
                      ),
                      const SizedBox(height: 15),
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'password', 0, 50);
                        }, //TODO edit this
                        textEditingController: controller.password,
                        lable: 'كلمة المرور',
                        passwordVisible: true,
                        icon: const Icon(Icons.lock_outline_rounded,
                            color: ColorApp.blue),
                      ),
                      const SizedBox(height: 15),
                      TextFieldAuth(
                        valid: (val) {
                          return validInput(val!, 'password', 0, 50);
                        },
                        textEditingController: controller.confirmpassword,
                        lable: 'تأكيد كلمة المرور',
                        passwordVisible: true,
                        icon: const Icon(
                          Icons.lock_outline_rounded,
                          color: ColorApp.blue,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ButtonAuth(
                        label: 'إنشاء حساب جديد',
                        onPressedFun: () {
                          // signupUser();
                          controller.signup();
                          // Navigator.pushNamed(context, RouteApp.verifypatient);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom == 0
                            ? 50
                            : 0,
                        child: CustomTextButton(
                          label: 'لدي حساب بالفعل؟',
                          onPressedFun: () {
                            controller.goToLogin();
                            // Navigator.pushNamed(context, RouteApp.login);
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom == 0
                            ? 70
                            : 0,
                      ),
                      // )
                    ],
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
