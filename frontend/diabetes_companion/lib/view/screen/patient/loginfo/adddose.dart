import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../controller/patient/maincontrollers/addlogscontroller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import '../../../widget/buttonauth.dart';
import '../../../widget/dropdownunit.dart';
import '../../../widget/sectopbar.dart';
import '../../../widget/textfieldauth.dart';

class AddNewDose extends StatelessWidget {
  final AddLogsControllerImp controller;

  const AddNewDose({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SecTopBar(
          label: 'اضافة جرعة جديدة',
        ),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: const Image(
              image: AssetImage(ImageAsset.medicine),
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "${controller.carbs.toString()} غم كاربوهيدرات ",
                    style: const TextStyle(
                        fontSize: 20, color: ColorApp.lightblue),
                  ),
                  AutoSizeText(
                    'انت تحتاج إلى ${controller.dose.toString()} وحدات انسولين',
                    style: const TextStyle(fontSize: 24, color: ColorApp.blue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonAuth(
                    label: 'حفظ الجرعة',
                    onPressedFun: () => controller.saveInsulinDose(),
                  ),
                  TextButton(
                      onPressed: () => controller.showInsulinHistory(),
                      child: const Text(
                        'انتقل للأرشيف',
                        style: TextStyle(fontSize: 16, color: ColorApp.red),
                      )),
                  TextButton(
                      onPressed: () => controller.cancelDose(),
                      child: const Text('الغاء')),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
