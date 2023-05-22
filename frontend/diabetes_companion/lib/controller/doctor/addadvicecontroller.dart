import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/advice.dart';

abstract class AddAdviceController extends GetxController {
  goToTest();
  addNewAdvice();
}

class AddAdviceControllerImp extends AddAdviceController {
  late String? id;
  late String? email;
  late TextEditingController name;
  late TextEditingController text;
  late TextEditingController description;
  late SingleValueDropDownController tag;
  late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;

  AdviceData adviceData = AdviceData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    text = TextEditingController(); //
    tag = SingleValueDropDownController(); //
    description = TextEditingController(); //
    diabetestype = SingleValueDropDownController(); //
    diabetestype.setDropDown(
      const DropDownValueModel(name: 'اختر نوع السكري المناسب ', value: "0"),
    );
    tag.setDropDown(
      const DropDownValueModel(name: 'اختر حالة المريض', value: "0"),
    );
    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    text.dispose();
    tag.dispose();
    description.dispose();
    diabetestype.dispose();

    super.dispose();
  }

  @override
  goToTest() {
    Get.toNamed(RouteApp.test, arguments: {
      'id': id,
    });
  }

  @override
  addNewAdvice() async {
    print('add advice');

    statusRequest = StatusRequest.loading;
    update();
    if (text.text.isNotEmpty) {
      var response = await adviceData.insertAdvice(
        id!,
        text.text,
        description.text,
        diabetestype.dropDownValue!.value,
        tag.dropDownValue!.value,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          text.clear();
          description.clear();
          diabetestype.setDropDown(
            const DropDownValueModel(
                name: 'اختر نوع السكري المناسب ', value: "0"),
          );
          tag.setDropDown(
            const DropDownValueModel(name: 'اختر حالة المريض', value: "0"),
          );
          update();
          Get.defaultDialog(
            title: 'تمت اضافة النصيحة بنجاح',
            // middleText: response['msg'],
          );

          // Get.offNamed(RouteApp.homedoctor, arguments: {
          //   'id': id,
          //   'email': email,
          // });
        } else {
          Get.defaultDialog(
            title: 'حدث خطأ',
            middleText: response['msg'],
          );
        }
      } else {
        print('statusRequest = $statusRequest');
        print('response error');
      }
    }
    update();
  }
}
