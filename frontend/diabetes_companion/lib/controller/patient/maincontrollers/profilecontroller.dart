import '/core/constant/color.dart';
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

abstract class ProfileController extends GetxController {
  goToEditProfile();
  goToMyAppointments();
  goToMyDoctors();
  goToSettings();
  showHideData();
  getData();
  showInsuline();
  signOut();
}

class ProfileControllerImp extends ProfileController {
  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());

  String? id;
  String? name;
  String? email;
  String? phone;
  String? diabetestype;
  String? diabetestypeData;
  String? gender;
  String? genderdata;
  String? birthdate;
  String? birthdatedata;
  String? avatar;
  bool dataVisible = false;
  int? birthyear;
  int? age;
  String? weight;
  String? carbstoinsulin;

  String? heartdisease; // امراض القلب
  String? bloodpressure; // ضغط الدم
  String? kidneydisease; // امراض الكلى
  String? greasy;

  late List<ProfileLine> data = [];
  @override
  void onInit() {
    id = Get.arguments["id"]; // change this to id
    email = Get.arguments["email"]; // change this to id
    name = '';

    getData();
    update();
    super.onInit();
  }

  @override
  getData() async {
    print('getData');
    print('id in profile controller = $id');
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.postData(id!);
    print('response = $response');

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      //
      if (response['status'] == true) {
        print("data name");
        name = response["name"];
        email = response["email"];
        phone = response["phone"].toString();
        diabetestype = response["diabetes_type"];
        gender = response["gender"];
        avatar = response["avatar"];
        birthdate = response["birthdate"];
        heartdisease = response["heartdisease"];
        bloodpressure = response["bloodpressure"];
        kidneydisease = response["kidneydisease"];
        greasy = response["greasy"];
        weight = response["weight"].toString();
        carbstoinsulin = response["carbstoinsulin"].toString();

        if (diabetestype == "1") {
          diabetestypeData = ' النوع الاول';
        } else if (diabetestype == "2") {
          diabetestypeData = ' النوع الثاني';
        } else {
          diabetestypeData = 'غير معرف';
        }
        if (gender == "male") {
          genderdata = 'ذكر';
        } else if (gender == "female") {
          genderdata = 'انثى';
        } else {
          genderdata = 'غير معرف';
        }
        if (birthdate != null) {
          List<String> date = birthdate!.split('T');
          List<String> ageData = date[0].split('-');
          birthdatedata = date[0];

          age = calculateAge(int.parse(ageData[2]), int.parse(ageData[1]),
              int.parse(ageData[0]));
          birthdatedata = "$birthdatedata { $age عام}";
        }
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
            title: 'نوع السكري',
            value: diabetestypeData!,
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
          ProfileLine(
            title: 'الجنس',
            value: genderdata!,
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
          ProfileLine(
            title: 'تاريخ الميلاد',
            value: birthdatedata ?? 'غير معرًف',
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
          ProfileLine(
            title: 'الوزن',
            value: weight ?? 'غير معرًف',
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
          ProfileLine(
            title: 'الكاربوهيدرات لوحدة انسولين',
            value: carbstoinsulin ?? 'غير معرًف',
            icon: const Icon(
              Icons.label_important,
              color: ColorApp.red,
            ),
          ),
          if (heartdisease == 'true')
            ProfileLine(
              title: 'امراض القلب',
              value: '  ',
              icon: const Icon(
                Icons.label_important,
                color: ColorApp.red,
              ),
              trueIcon: heartdisease == 'true' ? true : false,
            ),
          if (bloodpressure == 'true')
            ProfileLine(
              title: 'ضغط الدم',
              value: '  ',
              icon: const Icon(
                Icons.label_important,
                color: ColorApp.red,
              ),
              trueIcon: bloodpressure == 'true' ? true : false,
            ),
          if (kidneydisease == 'true')
            ProfileLine(
              title: 'امراض الكلـى',
              value: '  ',
              icon: const Icon(
                Icons.label_important,
                color: ColorApp.red,
              ),
              trueIcon: kidneydisease == 'true' ? true : false,
            ),
          if (greasy == 'true')
            ProfileLine(
              title: 'الدهنيات',
              value: '  ',
              icon: const Icon(
                Icons.label_important,
                color: ColorApp.red,
              ),
              trueIcon: greasy == 'true' ? true : false,
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
  goToEditProfile() {
    Get.offNamed(RouteApp.editprofile, arguments: {
      'id': id,
      'email': email,
      'name': name,
      'birthdate': birthdate,
      'gender': gender,
      'diabetestype': diabetestype,
      'phone': phone,
      'avatar': avatar,
      'heartdisease': heartdisease,
      'bloodpressure': bloodpressure,
      'kidneydisease': kidneydisease,
      'greasy': greasy,
      'weight': weight,
      'carbstoinsulin': carbstoinsulin,
    });
  }

  @override
  goToMyDoctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getPatientsDoctors(id!);

    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        List<MyDoctorLine> mydoctorslist = [];
        final doctors = response['doctors'];
        for (var doctor in doctors) {
          print(doctor['name']);
          print(doctor);
          final doctorName = doctor['name'];
          final doctorPhone = doctor['phone'];
          final doctorSpeciality = doctor['speciality'];
          final doctorLocation = doctor['location'] ?? '';
          final doctorEmail = doctor['email'] ?? '';

          final mydoctorWedget = MyDoctorLine(
            name: doctorName,
            phone: doctorPhone.toString(),
            specialty: doctorSpeciality,
            email: doctorEmail,
            location: doctorLocation,
          );
          mydoctorslist.add(mydoctorWedget);
          print('mydoctorslist $mydoctorslist');
          // update();
        }
        Get.offNamed(RouteApp.mydoctors, arguments: {
          'id': id,
          'email': email,
          'doctors': mydoctorslist,
        });
      } else {
        Get.offNamed(RouteApp.mydoctors, arguments: {
          'id': id,
          'email': email,
          'doctors': null,
        });
      }
    }
  }

  @override
  goToMyAppointments() {
    Get.toNamed(RouteApp.myappointments, arguments: {
      'id': id,
    });
  }

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

  @override
  showInsuline() {
    Get.toNamed(RouteApp.insulinhistorypage, arguments: {
      'id': id,
      'email': email,
    });
  }
}
