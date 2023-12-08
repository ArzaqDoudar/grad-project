// InsulinControllerImp

import 'package:dartz/dartz_unsafe.dart';
import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:diabetes_companion/view/widget/insulinline.dart';
import '/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/class/glocosedata.dart';
import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/addlogs.dart';
import '../../../view/widget/historyline.dart';

abstract class InsulinController extends GetxController {
  getData();
  // showInsulinHistory();
}

class InsulinControllerImp extends InsulinController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  LogsData logsData = LogsData(Get.find());

  String? id;
  String? email;
  String? name;

  List<InsulinLine> insulinhistory = [];

  String _time = '1';
  String get time => _time;
  set time(String value) {
    _time = value;
    print("time $_time");
    getData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getData();
    update();
  }

  @override
  getData() async {
    insulinhistory = [];
    statusRequest = StatusRequest.loading;
    update();
    var response = await logsData.getInsulin(
      id!,
      time,
    );
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        print('data =${response['data']}');
        final collection = response['data'] ?? [];
        for (var data in collection) {
          List<String> timedata = data['time'].toString().split('T');
          List<String> timedata1 = timedata[1].split(':');
          var houre = int.parse(timedata1[0]);
          var min = int.parse(timedata1[1]);
          // if (houre >= 12) {
          //   houre = houre - 12;
          // }
          houre = houre + 3;
          final historyline = InsulinLine(
            doseUnits: double.parse(data['dose_units'].toString()),
            color: ColorApp.blue,
            time: '$houre : $min',
            date: timedata[0],
          );

          insulinhistory.add(historyline);
          update();
        }
      }
    }
    update();
  }
}
