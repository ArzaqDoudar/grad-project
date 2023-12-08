import 'package:dartz/dartz_unsafe.dart';
import '/core/constant/color.dart';
import 'package:flutter/material.dart';

import '../../../core/class/glocosedata.dart';
import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/addlogs.dart';
import '../../../view/widget/historyline.dart';

abstract class PatientReportController extends GetxController {
  getData();
}

class PatientReportControllerImp extends PatientReportController {
  StatusRequest statusRequest = StatusRequest.none;

  // ProfileData profileData = ProfileData(Get.find());

  LogsData logsData = LogsData(Get.find());

  String? id;
  String? email;
  String? patientName;

  List<GlocoseData> historydatalist = [];

  List<HistoryLine> history = [];

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
    patientName = Get.arguments['name'];
    getData();
    update();
  }

  @override
  getData() async {
    history = [];
    historydatalist = [];

    statusRequest = StatusRequest.loading;
    update();
    var response = await logsData.getGlocose(
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
          Color color = data['description'] == 'normal'
              ? ColorApp.green
              : data['description'] == 'low'
                  ? ColorApp.red
                  : data['description'] == 'high'
                      ? ColorApp.yellow
                      : ColorApp.orange;

          print('blood_glocose =${data['blood_glocose']}');
          List<String> timedata = data['time'].toString().split('T');
          List<String> timedata1 = timedata[1].split(':');
          var houre = int.parse(timedata1[0]);
          var min = int.parse(timedata1[1]);
          if (houre >= 12) {
            houre = houre - 12;
          }
          houre = houre + 3;
          final historyline = HistoryLine(
            data: data['blood_glocose'],
            color: color,
            time: '$houre : $min',
            date: timedata[0],
          );
          final historydatalistitem =
              GlocoseData('$houre : $min', data['blood_glocose'], color);

          historydatalist.add(historydatalistitem);
          history.add(historyline);
          update();
        }
      }
    }
    update();
  }
}
