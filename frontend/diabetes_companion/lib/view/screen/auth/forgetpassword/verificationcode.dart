import 'package:diabetes_companion/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../core/constant/color.dart';
import '../../../widget/buttonauth.dart';
import 'newpassword.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

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
            Row(
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.center,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'التأكد من الرمز',
                          style: TextStyle(
                              fontFamily: 'Amiri',
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        OtpTextField(
                          textStyle: TextStyle(fontSize: 20),
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(10),
                          numberOfFields: 5,
                          margin: const EdgeInsets.only(
                              bottom: 10, left: 5, top: 10),
                          focusedBorderColor: ColorApp.blue,
                          enabledBorderColor: ColorApp.blue,
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            // TODO check if the code is correct and change page after showing dialog
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    alignment: Alignment.center,
                                    title: const Text(
                                      "التأكد من الرمز",
                                      style: TextStyle(
                                          color: ColorApp.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                      textAlign: TextAlign.right,
                                    ),
                                    content: Text(
                                      'الرمز المدخل هو $verificationCode',
                                      style: const TextStyle(
                                          color: ColorApp.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                      textAlign: TextAlign.right,
                                    ),
                                  );
                                });
                          }, // end onSubmit
                        ),
                        const ButtonAuth(
                          label: 'تأكيد من الرمز',
                        ),
                        const SizedBox(height: 5),
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
