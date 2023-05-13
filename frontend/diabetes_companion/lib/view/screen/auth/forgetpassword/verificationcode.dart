import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpassword/verificationcodecontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '/core/constant/imageasset.dart';
import '../../../../core/constant/color.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  State<VerificationCode> createState() => VerificationCodeState();
}

class VerificationCodeState extends State<VerificationCode> {
  @override
  Widget build(BuildContext context) {
    Get.put(VerificationCodeControllerImp());
    return Scaffold(
      body: GetBuilder<VerificationCodeControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Center(
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
                    backgroundColor:
                        Colors.transparent, //You can make this transparent
                    elevation: 0.0, //No shadow
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'تم ارسال رمز التحقق للايميل ',
                        style: TextStyle(
                            fontFamily: 'Amiri',
                            color: ColorApp.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: OtpTextField(
                            // showCursor: false,
                            clearText: true,
                            textStyle: const TextStyle(
                              fontSize: 20,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            fieldWidth: 50.0,
                            borderRadius: BorderRadius.circular(10),
                            numberOfFields: 5,
                            margin: const EdgeInsets.only(
                                bottom: 10, left: 5, top: 10),
                            focusedBorderColor: ColorApp.blue,
                            enabledBorderColor: ColorApp.blue,
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },

                            //runs when every textfield is filled
                            onSubmit: (String verificationCode) {
                              print("verificationCode =======");
                              print(verificationCode);
                              controller
                                  .checkVerificationCode(verificationCode);
                            }),
                      ),
                      TextButton(
                        child: const Text(
                          'ارسل الرمز مرة اخرى',
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorApp.blue,
                          ),
                        ),
                        // label: ,
                        onPressed: () {
                          print('controller.resendCode();');
                          controller.resendCode();
                          // Navigator.pushNamed(context, RouteApp.profile);
                        },
                      ),
                      // OtpTextField(
                      //   textStyle: const TextStyle(fontSize: 20),
                      //   fieldWidth: 50.0,
                      //   borderRadius: BorderRadius.circular(10),
                      //   numberOfFields: 5,
                      //   margin: const EdgeInsets.only(
                      //       bottom: 10, left: 5, top: 10),
                      //   focusedBorderColor: ColorApp.blue,
                      //   enabledBorderColor: ColorApp.blue,
                      //   //set to true to show as box or false to show as dash
                      //   showFieldAsBox: true,
                      //   //runs when a code is typed in
                      //   onCodeChanged: (String code) {
                      //     //handle validation or checks here
                      //   },
                      //   //runs when every textfield is filled
                      //   onSubmit: (String verificationCode) {
                      //     // TODO check if the code is correct and change page after showing dialog
                      //     showDialog(
                      //         context: context,
                      //         builder: (context) {
                      //           return AlertDialog(
                      //             alignment: Alignment.center,
                      //             title: const Text(
                      //               'تم ارسال رمز التحقق للايميل ',
                      //               style: TextStyle(
                      //                   color: ColorApp.blue,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 25),
                      //               textAlign: TextAlign.right,
                      //             ),
                      //             content: Text(
                      //               'الرمز المدخل هو $verificationCode',
                      //               style: const TextStyle(
                      //                   color: ColorApp.blue,
                      //                   fontWeight: FontWeight.bold,
                      //                   fontSize: 20),
                      //               textAlign: TextAlign.right,
                      //             ),
                      //           );
                      //         });
                      //   }, // end onSubmit
                      // ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
