import '/controller/patient/maincontrollers/addlogscontroller.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/addlog.dart';
import '../../../widget/buttonauth.dart';
import '../../../widget/customdropdowntextfield.dart';
import '../../../widget/datetime/basicdatetimefield.dart';
import '../../../widget/textfieldauth.dart';

class BloodGlucosePage extends StatelessWidget {
  final AddLogsControllerImp controller;

  const BloodGlucosePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: const Image(
            image: AssetImage(ImageAsset.glucose),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
        ),
        Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Padding(
            padding: (kIsWeb)
                ? EdgeInsets.symmetric(horizontal: (screenWidth * 0.5) - 500)
                : const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: TextFieldAuth(
                  lable: "نسبة السكر في الدم",
                  passwordVisible: false,
                  type: TextInputType.number,
                  textEditingController: controller.glocoseController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BasicDateTimeField(
                textEditingController: controller.dateController,
                now: true,
              ),
              ButtonAuth(
                label: 'حفظ',
                onPressedFun: () => controller.saveBloodGlocode(),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
