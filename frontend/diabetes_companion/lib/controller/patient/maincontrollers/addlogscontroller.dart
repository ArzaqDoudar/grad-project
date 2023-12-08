import 'dart:io';

import 'package:diabetes_companion/view/screen/patient/morepage.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:inc_dec_textfield/inc_dec_textfield.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../core/class/carb.dart';
import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../core/functions/showdialog.dart';
import '../../../data/datasource/remote/patient/addlogs.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../view/widget/carbsline.dart';

abstract class AddLogsController extends GetxController {
  getAllCarbs();
  saveBloodGlocode();
  // calculateDose();
  addCarb();
  removeFromSelectedCarbsList(int value);
  getCarbsToInsulin();
  // onChangeDropDown(List<String> value);
  // showMultiSelect(BuildContext context);
  saveMedicine();
  saveInsulinDose();
  cancelDose();
  showInsulinHistory();
}

class AddLogsControllerImp extends AddLogsController {
  StatusRequest statusRequest = StatusRequest.none;

  List<CarbsLine> allcarbslist = [];
  ProfileData profileData = ProfileData(Get.find());
  LogsData addLogsData = LogsData(Get.find());

  //blood glocose page
  late TabController tabcontroller;
  late TextEditingController dateController;
  late TextEditingController glocoseController;
  late TextEditingController incDecController;
  late SingleValueDropDownController tagController;
  late SingleValueDropDownController carbDropdownController;

  //
  late TextEditingController weightController;
  late TextEditingController fatsWeightController;

  // carb page
  late TextEditingController fatsController;
  late TextEditingController carbsController;
  late TextEditingController proteinController;
  late TextEditingController caloriesController;

  late TextEditingController medicinename;
  late TextEditingController doseController;

  String? id;
  String? email;
  String? name;
  int carbstoinsulin = 0;
  int carbs = 0;
  double dose = 0.0;
  List<CarbsLine> allcarbs = [];
  List<DropDownValueModel> carbsItems = [];

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getAllCarbs();
    getCarbsToInsulin();
    update();

    // tabcontroller = TabController(length: 4, vsync: );
    dateController = TextEditingController();
    incDecController = TextEditingController();
    glocoseController = TextEditingController();
    weightController = TextEditingController();
    fatsWeightController = TextEditingController();
    fatsController = TextEditingController();
    carbsController = TextEditingController();
    proteinController = TextEditingController();
    caloriesController = TextEditingController();
    medicinename = TextEditingController();
    doseController = TextEditingController();

    tagController = SingleValueDropDownController();
    carbDropdownController = SingleValueDropDownController();

    tagController.dropDownValue =
        const DropDownValueModel(name: 'اختر وقت الفحص', value: "");
    carbDropdownController.dropDownValue =
        const DropDownValueModel(name: 'أضف وجبة جديدة', value: "0");
    incDecController.text = '1';
  }

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

    print('time $time');
    List<String> timedata = time.split(' ');
    print('time0 ${timedata[0]}');
    print('time1 ${timedata[1]}');
    print('time2 ${timedata[2]}');
    String datetime = '${timedata[0]}T${timedata[1]}+0300';

    print('time2 ${datetime}');
    if (glocoseController.text.isNotEmpty &&
        glocoseController.text.isNumericOnly) {
      var response = await addLogsData.insertGlocose(
        id!,
        glocoseController.text,
        datetime,
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
      }
    } else {
      showdialog(' حدث خطأ !', "  نسبة السكر يجب ان يكون ارقاما فقط");
    }
  }

  @override
  getAllCarbs() async {
    print('successfuly getAllCarbs');
    statusRequest = StatusRequest.loading;
    update();
    var response = await addLogsData.getAllCarbs();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      print(response['carbs']);
      if (response['status'] == true) {
        final carbs = response['carbs'] ?? [];
        for (var carb in carbs) {
          Carb carbdata = Carb(
            name: carb['name'],
            weight: carb['weight'],
            weightDescription: carb['weight_description'],
            amount: 1,
            carbweight: carb['carb'],
          );

          carbsItems.add(DropDownValueModel(
              name: '${carb['name']} , ${carb['weight_description']} ',
              value: carbdata));
        }
      }
      update();
    }
  }

  @override
  saveMedicine() {
    print('name ${medicinename.text}');
    print('successfuly');
  }

  @override
  addCarb() {
    print('addCarb');
    if (carbDropdownController.dropDownValue?.value != 0 &&
        incDecController.text != 0 &&
        carbDropdownController.dropDownValue?.value != null) {
      String name = carbDropdownController.dropDownValue?.value.name;
      int weight = carbDropdownController.dropDownValue?.value.weight;
      String weightDescription =
          carbDropdownController.dropDownValue?.value.weightDescription;
      int carbsweight = carbDropdownController.dropDownValue?.value.carbweight;

      int count = int.parse(incDecController.text);
      final carbline = CarbsLine(
        name: name,
        weight: weight,
        weightDescription: weightDescription,
        carb: carbsweight,
        onPressedFun: () {},
        count: count,
      );
      carbs = carbs + (carbsweight * count);

      allcarbs.add(carbline);
      print('length ${allcarbs.length}');
      print('total carbs  $carbs');
      update();
      carbDropdownController.dropDownValue =
          const DropDownValueModel(name: 'أضف وجبة جديدة', value: "0");
      incDecController.text = '1';
    }
    update();
  }

  @override
  removeFromSelectedCarbsList(int value) {
    // allcarbs.remove(value);
    // allcarbs.removeWhere((element) => element.name == )
    print('remove');
    allcarbs.remove(value);
    print('length ${allcarbs.length}');
  }

  @override
  getCarbsToInsulin() async {
// ProfileData
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.postData(id!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        carbstoinsulin = int.parse(response['carbstoinsulin'] ?? '15');
      }
    }
  }

  @override
  showInsulinHistory() {
    Get.toNamed(RouteApp.insulinhistorypage, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  cancelDose() {
    carbs = 0;
    dose = 0;
    allcarbs = [];
    Get.offNamed(RouteApp.morepages, arguments: {
      'id': id,
      'email': email,
    });
  }

  @override
  saveInsulinDose() async {
    bool flag = false;
    statusRequest = StatusRequest.loading;
    update();
    String time = DateTime.now().toString();

    print('time $time');
    List<String> timedata = time.split(' ');
    String datetime = '${timedata[0]}T${timedata[1]}+0300';

    if (dose != 0) {
      var response = await addLogsData.insertInsulin(
        id!,
        dose.toString(),
        datetime,
      );
      statusRequest = handlingData(response);
      print("response after handle= $response");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          // showdialog("", "تمت الإضافة بنجاح");
          Get.defaultDialog(
            title: '',
            titleStyle: const TextStyle(
                color: ColorApp.blue, fontWeight: FontWeight.bold),
            middleText: "تمت الإضافة بنجاح",
            actions: [
              TextButton(
                onPressed: () {
                  carbs = 0;
                  dose = 0;
                  allcarbs = [];
                  Get.offNamed(RouteApp.morepages, arguments: {
                    'id': id,
                    'email': email,
                  });
                },
                child: const Text(
                  "تم",
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorApp.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }
      }
    } else {
      showdialog(' حدث خطأ !', "  نسبة السكر يجب ان يكون ارقاما فقط");
    }
  }
}
