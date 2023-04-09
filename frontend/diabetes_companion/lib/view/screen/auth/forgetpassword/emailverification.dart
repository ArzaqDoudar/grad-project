import 'package:lottie/lottie.dart';

import '../../../../core/class/statusrequest.dart';
import '/controller/auth/forgetpasswordcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/validinput.dart';
import '/view/widget/buttonauth.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/textfieldauth.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    // ForgetPasswordControllerImp controller =
    //     Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) =>
            controller.statusRequest == StatusRequest.loading
                ? Center(child: Lottie.asset(ImageAsset.loadingLottie))
                // const Center(
                //     child: Text('Loading ...'),
                //   )
                : Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: const Image(
                            image: AssetImage(ImageAsset.backgroundAuthImage),
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 0.0,
                          left: 5.0,
                          right: 0.0,
                          child: AppBar(
                            // You can add title here
                            leading: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: ColorApp.blue,
                                size: 28,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            backgroundColor: Colors
                                .transparent, //You can make this transparent
                            elevation: 0.0, //No shadow
                          ),
                        ),
                        Form(
                          key: controller.formstateforget,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'البريد الإلكتروني',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35,
                                      color: ColorApp.blue),
                                ),
                                const SizedBox(height: 7),
                                TextFieldAuth(
                                  valid: (val) {
                                    return validInput(val!, 'email', 0, 50);
                                  },
                                  textEditingController: controller.email,
                                  passwordVisible: false,
                                  lable: '',
                                  icon: const Icon(
                                    Icons.email_outlined,
                                    color: ColorApp.blue,
                                  ),
                                ),
                                const SizedBox(height: 7),
                                ButtonAuth(
                                  label: 'ارسل رمز التحقق',
                                  onPressedFun: () {
                                    controller.sendVerificationCode();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
