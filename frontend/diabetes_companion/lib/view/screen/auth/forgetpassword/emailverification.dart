import 'package:flutter/material.dart';
import '/view/widget/buttonauth.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../../core/constant/routes.dart';
import '../../../widget/textfieldauth.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => EmailVerificationState();
}

class EmailVerificationState extends State<EmailVerification> {
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
                    'البريد الإلكتروني',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: ColorApp.blue),
                  ),
                  const SizedBox(height: 7),
                  const TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    // textEditingController: emailController,
                    passwordVisible: false,
                    lable: '',
                    icon: Icon(
                      Icons.email_outlined,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ButtonAuth(
                    label: 'ارسل رمز التحقق',
                    onPressedFun: () {
                      Navigator.pushNamed(context, RouteApp.forgetpasswordcode);
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
