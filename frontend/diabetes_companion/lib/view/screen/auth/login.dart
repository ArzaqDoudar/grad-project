import 'package:diabetes_companion/core/constant/color.dart';
import 'package:diabetes_companion/core/constant/imageasset.dart';
import 'package:diabetes_companion/core/constant/routes.dart';
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
                          passwordVisible: false,
                          lable: 'كلمة المرور',
                          icon: Icon(
                            Icons.lock_outline_rounded,
                            color: ColorApp.blue,
                          ),
                        ),
                        const SizedBox(height: 7),

                        //login button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: ColorApp.blue,
                                padding: const EdgeInsets.all(10),
                                textStyle: const TextStyle(fontSize: 20),
                                alignment: const Center().alignment),
                            onPressed: () {
                              Navigator.pushNamed(context, RouteApp.mainscreen);
                            },
                            child: const SizedBox(
                              height: 30,
                              width: 500,
                              child: Text(
                                'تسجيل الدخول',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
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

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const EmailVerification()));
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
                      ]),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
