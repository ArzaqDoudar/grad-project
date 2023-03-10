import 'package:flutter/material.dart';
import '/view/widget/buttonauth.dart';
import '/core/constant/imageasset.dart';
import '../../../../core/constant/routes.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/textfieldauth.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool _isNotValidate = false;

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
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
                  const TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    // textEditingController: emailController,
                    passwordVisible: true,
                    lable: 'كلمة المرور',
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    // textEditingController: emailController,
                    passwordVisible: true,
                    lable: 'تأكيد كلمة المرور',
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ButtonAuth(
                    label: 'تغيير كلمة المرور ',
                    onPressedFun: () {
                      Navigator.pushNamed(context, RouteApp.login);
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
