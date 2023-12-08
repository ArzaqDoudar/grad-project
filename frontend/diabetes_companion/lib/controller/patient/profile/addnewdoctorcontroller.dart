import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../view/widget/mydoctorline.dart';

abstract class AddNewDoctorController extends GetxController {
  addNewDoctor();
  goToMyDoctors();
}

class AddNewDoctorControllerImp extends AddNewDoctorController {
  late String? id;
  late String? myemail;
  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController location;
  late TextEditingController specialty;
  // late SingleValueDropDownController diabetestype;
  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());

  @override
  void onInit() {
    id = Get.arguments['id'];
    myemail = Get.arguments['email'];

    name = TextEditingController();
    email = TextEditingController();
    location = TextEditingController();
    specialty = TextEditingController();
    phone = TextEditingController();

    update();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    location.dispose();
    specialty.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  addNewDoctor() async {
    statusRequest = StatusRequest.loading;
    update();
    if (name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        specialty.text.isNotEmpty) {
      var response = await profileData.addNewDoctor(id!, name.text,
          specialty.text, email.text, phone.text, location.text);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          update();
          goToMyDoctors();
        } else {
          Get.defaultDialog(
            title: 'تحذير',
            middleText: 'حدث خطأ , يرجى المحاولة مرة اخرى!',
          );
        }
      } else {
        Get.defaultDialog(
          title: 'خطأ ',
          middleText: 'حدث خطأ , يرجى المحاولة مرة اخرى!',
        );
      }
    } else {
      String msg = '';
      if (name.text.isEmpty) {
        msg = 'حقل الإسم لا يمكن ان يكون فارغ, يرجى ادخال اسم';
      } else if (phone.text.isEmpty) {
        msg = 'حقل الهاتف لا يمكن ان يكون فارغ, يرجى ادخال الرقم';
      } else if (specialty.text.isEmpty) {
        msg = 'حقل الإختصاص لا يمكن ان يكون فارغ, يرجى ادخال اختصاص الطبيب';
      }
      Get.defaultDialog(
        title: 'تحذير',
        middleText: msg,
      );
    }
  }

  @override
  goToMyDoctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.getPatientsDoctors(id!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        List<MyDoctorLine> mydoctorslist = [];
        final doctors = response['doctors'];
        for (var doctor in doctors) {
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
          update();
        }
        Get.offNamed(RouteApp.mydoctors, arguments: {
          'id': id,
          'email': myemail,
          'doctors': mydoctorslist,
        });
      } else {
        Get.offNamed(RouteApp.mydoctors, arguments: {
          'id': id,
          'email': myemail,
          'doctors': null,
        });
      }
    }
  }
}
