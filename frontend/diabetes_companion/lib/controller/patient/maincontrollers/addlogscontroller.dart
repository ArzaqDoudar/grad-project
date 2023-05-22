import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../core/functions/showdialog.dart';
import '../../../data/datasource/remote/patient/addlogs.dart';

abstract class AddLogsController extends GetxController {
  getData();
  saveBloodGlocode();
}

class AddLogsControllerImp extends AddLogsController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());
  AddLogsData addLogsData = AddLogsData(Get.find());

  //blood glocose page
  late TextEditingController dateController;
  late TextEditingController glocoseController;
  late SingleValueDropDownController tagController;

  //
  late TextEditingController weightController;
  late TextEditingController fatsWeightController;

  // carb page
  late TextEditingController fatsController;
  late TextEditingController carbsController;
  late TextEditingController proteinController;
  late TextEditingController caloriesController;

  String? id;
  String? email;
  String? name;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    email = Get.arguments['email'];

    dateController = TextEditingController();
    glocoseController = TextEditingController();
    weightController = TextEditingController();
    fatsWeightController = TextEditingController();
    fatsController = TextEditingController();
    carbsController = TextEditingController();
    proteinController = TextEditingController();
    caloriesController = TextEditingController();
    tagController = SingleValueDropDownController();
    tagController.dropDownValue =
        const DropDownValueModel(name: 'اختر وقت الفحص', value: "");
  }

  @override
  getData() {}

  @override
  saveBloodGlocode() async {
    statusRequest = StatusRequest.loading;
    update();
    String time;
    if (dateController.text.isEmpty) {
      time = DateTime.now().toString();
    } else {
      time = dateController.text;
    }

    if (glocoseController.text.isNotEmpty &&
        glocoseController.text.isNumericOnly) {
      var response = await addLogsData.insertGlocose(
        id!,
        glocoseController.text,
        time,
        tagController.dropDownValue?.value ?? '',
      );
      statusRequest = handlingData(response);
      print("response after handle= $response");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          glocoseController.clear();
          dateController.clear();
          tagController.clearDropDown();
          showdialog("", "تمت الإضافة بنجاح");
        }
        // else {
        //   Get.offNamed(RouteApp.morepages, arguments: {
        //     'id': id,
        //     'email': email,
        //   });
        // }
      }
    } else {
      //TODO show dialog
      showdialog(' حدث خطأ !', "  نسبة السكر يجب ان يكون ارقاما فقط");
    }

// bloodGlocose(String id, int data, DateTime time, String tag)
    // AddLogsData.bloodGlocose(String id, int data, DateTime time, String tag)
  }
}
