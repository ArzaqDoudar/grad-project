import 'package:diabetes_companion/core/constant/color.dart';
import 'package:diabetes_companion/core/constant/imageasset.dart';
import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:diabetes_companion/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';

import '../../widget/textfieldauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,

                        //email textfield
                        children: <Widget>[
                          const TextFieldAuth(
                            passwordVisible: false,
                            lable: 'البريد الإلكتروني',
                            icon: Icon(
                              Icons.email_outlined,
                              color: ColorApp.blue,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const TextFieldAuth(
                            passwordVisible: true,
                            lable: 'كلمة المرور',
                            icon: Icon(
                              Icons.lock_outline_rounded,
                              color: ColorApp.blue,
                            ),
                          ),
                          const SizedBox(height: 7),

                          //login button
                          ButtonAuth(
                            label: 'تسجيل الدخول',
                            onPressedFun: () {
                              Navigator.pushNamed(context, RouteApp.mainscreen);
                            },
                          ),
                          const SizedBox(height: 7),

                          //not member? sign up
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                textStyle: const TextStyle(fontSize: 20),
                                alignment: const Center().alignment,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, RouteApp.signup);
                              },
                              child: const SizedBox(
                                child: Text(
                                  'حساب جديد؟',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      decoration: TextDecoration.underline,
                                      color: ColorApp.darkBlue),
                                ),
                              ),
                            ),
                          ),
                          //forget my pass?
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                  backgroundColor: Colors.transparent,
                                  textStyle: const TextStyle(fontSize: 20),
                                  alignment: const Center().alignment),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteApp.forgetpasswordemail);
                              },
                              child: const Text(
                                'هل نسيت كلمة السر؟',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
                                    color: ColorApp.darkBlue),
                              ),
                            ),
                          ),
                          // const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
