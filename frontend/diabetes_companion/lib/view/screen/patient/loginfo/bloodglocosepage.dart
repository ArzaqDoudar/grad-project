import 'package:diabetes_companion/controller/patient/maincontrollers/addlogscontroller.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
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
  // TextEditingController dateController = TextEditingController();
  final AddLogsControllerImp controller;

  const BloodGlucosePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              TextFieldAuth(
                // valid: (val) {},
                lable: "نسبة السكر في الدم",
                passwordVisible: false,
                type: TextInputType.number,
                textEditingController: controller.glocoseController,
              ),
              const SizedBox(
                height: 10,
              ),
              BasicDateTimeField(
                textEditingController: controller.dateController,
                now: true,
              ),
              Text(
                DateTime.now().toString(),
                style: const TextStyle(color: ColorApp.blue, fontSize: 18),
              ),
              const Text(
                'وقت الجرعة',
                style: TextStyle(color: ColorApp.blue, fontSize: 18),
              ),
              CustomDropDownTextField(
                controller: controller.tsgController,
                items: const [
                  DropDownValueModel(
                      name: ' قبل الفطور', value: "before breakfast"),
                  DropDownValueModel(
                      name: 'بعد الفطور', value: "after breakfast"),
                  DropDownValueModel(name: 'قبل الغداء', value: "before lunch"),
                  DropDownValueModel(name: 'بعد الغداء', value: "after lunch"),
                  DropDownValueModel(
                      name: 'قبل العشاء ', value: "before dinner"),
                  DropDownValueModel(name: 'بعد العشاء', value: "after dinner"),
                  DropDownValueModel(name: 'قبل النوم', value: "before sleep"),
                  DropDownValueModel(
                      name: 'قبل وجبة خفيفة', value: "before a snack"),
                  DropDownValueModel(
                      name: 'بعد وجبة خفيفة', value: "after a snack"),
                  DropDownValueModel(
                      name: 'قبل النشاط الرياضي',
                      value: "before sports activity"),
                  DropDownValueModel(
                      name: 'اثناء النشاط الرياضي',
                      value: "during sports activity"),
                  DropDownValueModel(
                      name: 'بعد النشاط الرياضي',
                      value: "after sports activity"),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                child: ButtonAuth(
                  label: 'حفظ',
                  onPressedFun: () => controller.saveBloodGlocode(),
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
