import '/data/datasource/remote/doctor/doctor.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class AddPatientController extends GetxController {
  // goToTest();
  addPatient();
  scanning();
}

class AddPatientControllerImp extends AddPatientController {
  late String? id;
  late String? email;
  late String? barcode;

  late TextEditingController patientId;
  late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;

  DoctorData doctorData = DoctorData(Get.find());

  @override
  void onInit() {
    print('AddPatientControllerImp 1');
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    print('AddPatientControllerImp 2');
    patientId = TextEditingController();
    barcode = '';
    print('AddPatientControllerImp 3');
    update();
    super.onInit();
  }

  @override
  void dispose() {
    patientId.dispose();
    super.dispose();
  }

  @override
  addPatient() async {
    // addDoctor
    print('add patient');

    statusRequest = StatusRequest.loading;
    update();
    if (patientId.text.isNotEmpty) {
      var response = await doctorData.addDoctor(
        patientId.text,
        id!,
      );
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          Get.offNamed(RouteApp.homedoctor, arguments: {
            'id': id,
            'email': email,
          });
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

  @override
  scanning() async {
    print('AddPatientControllerImp 4');
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
      if (barcodeScanRes == '-1') {
        print('barcodeScanRes=================');
        return;
      }
      barcode = barcodeScanRes;
      patientId.text = barcodeScanRes;
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    } catch (e) {
      print('catch  4');
      print(e);
    }
  }
}
