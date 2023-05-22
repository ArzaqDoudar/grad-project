import 'package:diabetes_companion/controller/patient/profile/resetpasswordcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/sectopbar.dart';
import '../../../widget/textfieldauth.dart';
import '/view/widget/buttonauth.dart';
import '/core/constant/imageasset.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/constant/color.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'تغيير كلمة السر',
          ),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Image(
                  image: AssetImage(ImageAsset.forgetPassImage),
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'كلمة مرور جديدة',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: ColorApp.blue),
                    ),
                    const SizedBox(height: 10),
                    TextFieldAuth(
                      textEditingController: controller.oldpassword,
                      passwordVisible: true,
                      lable: 'كلمة المرور القديمة',
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                        color: ColorApp.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldAuth(
                      valid: (val) {},
                      // isNotValidate: _isNotValidate,
                      textEditingController: controller.newpassword,
                      passwordVisible: true,
                      lable: 'كلمة المرور الجديدة',
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                        color: ColorApp.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldAuth(
                      // isNotValidate: _isNotValidate,
                      textEditingController: controller.confirmpassword,
                      passwordVisible: true,
                      lable: 'تأكيد كلمة المرور',
                      icon: const Icon(
                        Icons.lock_outline_rounded,
                        color: ColorApp.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonAuth(
                      label: 'تغيير كلمة المرور ',
                      onPressedFun: () => controller.resetPassword(),
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
