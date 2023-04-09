import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpasswordcontroller.dart';
import '../../../../core/functions/validinput.dart';
import '/view/widget/buttonauth.dart';
import '/core/constant/imageasset.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/textfieldauth.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: Center(
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
              left: 0.0,
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
                backgroundColor:
                    Colors.transparent, //You can make this transparent
                elevation: 0.0, //No shadow
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'كلمة مرور جديدة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: ColorApp.blue),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    valid: (val) {
                      return validInput(val!, 'password', 0, 50);
                    },
                    textEditingController: controller.newpassword,
                    passwordVisible: true,
                    lable: 'كلمة المرور',
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    valid: (val) {
                      return validInput(val!, 'password', 0, 50);
                    },
                    textEditingController: controller.confirmpassword,
                    passwordVisible: true,
                    lable: 'تأكيد كلمة المرور',
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ButtonAuth(
                    label: 'تغيير كلمة المرور ',
                    onPressedFun: () {
                      controller.changePassword();
                      // Navigator.pushNamed(context, RouteApp.login);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
