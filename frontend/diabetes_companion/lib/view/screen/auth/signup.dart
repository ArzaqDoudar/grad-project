import 'dart:convert';

import '/core/constant/color.dart';
import '/core/constant/routes.dart';
import '/view/widget/buttonauth.dart';
import '/view/widget/customtextbutton.dart';
import 'package:http/http.dart' as http;
import '/view/widget/textfieldauth.dart';
import '/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

class SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // nameController.text = 'ARZAQZIADDOUDAR';
    // idController.text = '123456';
  }

  // bool _isNotValidate = false;
  void signupUser() async {
    if (idController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      // nameController.text = 'ARZAQZIADDOUDAR';
      var loginBody = {
        "email": emailController.text,
        "password": passwordController.text,
        "id": idController.text,
      };
      print(loginBody);
      var response = await http.post(
        Uri.parse('http://localhost:3000/patients'),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(loginBody),
      );
      print(response);
      // print(jsonEncode(loginBody));
    } else {
      print('loginBody');

      // setState(() {
      //   _isNotValidate = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 7),
                  const Text(
                    'حساب جديد ',
                    style: TextStyle(fontSize: 40, color: ColorApp.blue),
                  ),
                  TextFieldAuth(
                    textEditingController: nameController,
                    lable: 'الاسم',
                    passwordVisible: false,
                    icon: const Icon(Icons.abc, color: ColorApp.blue),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    textEditingController: idController,
                    lable: 'رقم الهوية',
                    passwordVisible: false,
                    icon: const Icon(
                      Icons.assignment_ind_outlined,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    textEditingController: emailController,
                    lable: 'البريد الإلكتروني',
                    passwordVisible: false,
                    icon:
                        const Icon(Icons.email_outlined, color: ColorApp.blue),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    textEditingController: passwordController,
                    lable: ' كلمة المرور',
                    passwordVisible: true,
                    icon: const Icon(Icons.lock_outline_rounded,
                        color: ColorApp.blue),
                  ),
                  const SizedBox(height: 7),
                  TextFieldAuth(
                    // isNotValidate: _isNotValidate,
                    textEditingController: confirmPasswordController,
                    lable: 'تأكيد كلمة المرور',
                    passwordVisible: true,
                    icon: const Icon(
                      Icons.lock_outline_rounded,
                      color: ColorApp.blue,
                    ),
                  ),
                  const SizedBox(height: 7),
                  ButtonAuth(
                    label: 'إنشاء حساب جديد',
                    onPressedFun: () {
                      signupUser();

                      Navigator.pushNamed(context, RouteApp.mainscreen);
                    },
                  ),
                  CustomTextButton(
                    label: 'لدي حساب بالفعل؟',
                    onPressedFun: () {
                      Navigator.pushNamed(context, RouteApp.login);
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
