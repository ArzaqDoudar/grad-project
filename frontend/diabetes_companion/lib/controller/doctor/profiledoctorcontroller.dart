import '/core/constant/color.dart';
import '/data/datasource/remote/doctor/doctor.dart';
import 'package:flutter/material.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/functions/calculateage.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../linkapi.dart';
import '../../../view/widget/mydoctorline.dart';
import '../../../view/widget/profileline.dart';
import '/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class ProfileDoctorController extends GetxController {
  goToEditProfileDoctor();
  // goToMyAppointments();
  // goToMyDoctors();
  // getData();
  goToSettings();
  showHideData();
  signOut();
  getData();
}

class ProfileDoctorControllerImp extends ProfileDoctorController {
  StatusRequest statusRequest = StatusRequest.none;

  DoctorData doctorData = DoctorData(Get.find());

  String? id;
  String? name;
  String? email;
  String? phone;
  String? specialty;

  bool dataVisible = false;
  late List<ProfileLine> data = [];
  @override
  void onInit() {
    id = Get.arguments["id"]; // change this to id
    email = Get.arguments["email"]; // change this to id
    name = '';
    phone = '';
    specialty = '';

    getData();
    update();
    super.onInit();
  }

  @override
  getData() async {
    // print('getData');
    // print('id in doctor profile controller = $id');
    statusRequest = StatusRequest.loading;
    update();
    var response = await doctorData.getDoctor(id!);
    // print('response = $response');

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      //
      if (response['status'] == true) {
        name = response["name"];
        phone = response["phone"].toString();
        specialty = response["specialty"].toString();

        // print("data name");
        // print("data $name");
        // print("data $phone");
        // print("data $specialty");
        data = [
          ProfileLine(
            title: 'الايميل',
            value: email!,
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
            swap: true,
          ),
          ProfileLine(
              title: 'رقم الهاتف',
              value: phone ?? 'غير معرف',
              icon: const Icon(
                Icons.label_important,
                color: ColorApp.red,
              ),
              phone: true),
          ProfileLine(
            title: ' الإختصاص',
            value: specialty!,
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
        ];
        update();
      } else {
        print('empty');
      }
    } else {
      print('not success');
    }
  }

  @override
  goToEditProfileDoctor() {
    Get.offNamed(RouteApp.editprofiledoctor, arguments: {
      'id': id,
      'email': email,
      'name': name,
      'specialty': specialty,
      'phone': phone,
    });
  }

  // @override
  // goToMyDoctors() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await profileData.getPatientsDoctors(id!);

  //   statusRequest = handlingData(response);
  //   print("response after handle= $response");
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == true) {
  //       List<MyDoctorLine> mydoctorslist = [];
  //       final doctors = response['doctors'];
  //       for (var doctor in doctors) {
  //         print(doctor['name']);
  //         print(doctor);
  //         final doctorName = doctor['name'];
  //         final doctorPhone = doctor['phone'];
  //         final doctorSpeciality = doctor['speciality'];
  //         final doctorLocation = doctor['location'] ?? '';
  //         final doctorEmail = doctor['email'] ?? '';

  //         final mydoctorWedget = MyDoctorLine(
  //           name: doctorName,
  //           phone: doctorPhone.toString(),
  //           specialty: doctorSpeciality,
  //           email: doctorEmail,
  //           location: doctorLocation,
  //         );
  //         mydoctorslist.add(mydoctorWedget);
  //         print('mydoctorslist $mydoctorslist');
  //         // update();
  //       }
  //       Get.offNamed(RouteApp.mydoctors, arguments: {
  //         'id': id,
  //         'email': email,
  //         'doctors': mydoctorslist,
  //       });
  //     } else {
  //       Get.offNamed(RouteApp.mydoctors, arguments: {
  //         'id': id,
  //         'email': email,
  //         'doctors': null,
  //       });
  //     }
  //   }
  // }

  @override
  goToSettings() {
    Get.offNamed(RouteApp.mainscreen);
  }

  @override
  showHideData() {
    dataVisible = !dataVisible;
    update();
  }

  @override
  signOut() {
    print('signout');
    Get.offNamed(RouteApp.login);
  }
}
