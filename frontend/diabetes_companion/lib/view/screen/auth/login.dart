import '/core/constant/color.dart';
import '/core/constant/imageasset.dart';
import '/core/constant/routes.dart';
import '/view/widget/buttonauth.dart';
import '/view/widget/customtextbutton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widget/textfieldauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  // void loginUser(emailController, passwordController) async {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     var loginBody = {
  //       "email": emailController.text,
  //       "password": passwordController.text,
  //     };
  //     var response = await http.post(
  //       Uri.parse('uri'),
  //       headers: {"Content-type": "application/json"},
  //       body: jsonEncode(loginBody),
  //     );

  //     print(response);
  //   } else {
  //     setState(() {
  //       _isNotValidate = false;
  //     });
  //   }
  // }

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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          const TextFieldAuth(
                            // isNotValidate: _isNotValidate,
                            // textEditingController: emailController,
                            passwordVisible: false,
                            lable: 'البريد الإلكتروني',
                            icon: Icon(
                              Icons.email_outlined,
                              color: ColorApp.blue,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const TextFieldAuth(
                            // isNotValidate: _isNotValidate,
                            // textEditingController: passwordController,
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

                          //not member? sign up or forget my pass?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextButton(
                                label: 'هل نسيت كلمة المرور؟',
                                onPressedFun: () {
                                  Navigator.pushNamed(
                                      context, RouteApp.forgetpasswordemail);
                                },
                              ),
                              CustomTextButton(
                                label: 'حساب جديد؟',
                                onPressedFun: () {
                                  Navigator.pushNamed(context, RouteApp.signup);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
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
