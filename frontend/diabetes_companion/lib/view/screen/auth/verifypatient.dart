import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifypatientcontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '/core/constant/imageasset.dart';
import '../../../../core/constant/color.dart';

class VerifyPatient extends StatelessWidget {
  const VerifyPatient({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyPatientControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyPatientControllerImp>(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        ' رمز التحقق ',
                        style: TextStyle(
                            color: ColorApp.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                      const Text(
                        'تم ارسال رمز التحقق للايميل ',
                        style: TextStyle(
                          color: ColorApp.blue,
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
                              controller.checkCode(verificationCode);
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
                          // Navigator.pushNamed(context, RouteApp.profile);
                        },
                      ),
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
