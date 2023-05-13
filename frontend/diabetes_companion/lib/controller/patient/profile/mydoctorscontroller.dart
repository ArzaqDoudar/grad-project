import 'package:diabetes_companion/linkapi.dart';
import 'package:diabetes_companion/view/screen/patient/profile/addnewdoctor.dart';
import 'package:get/get.dart';

import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../view/widget/mydoctorline.dart';

abstract class MyDoctorsController extends GetxController {
  goToAddNewDoctor();
  getPatientsDoctors();
  backToProfile();
}

class MyDoctorsControllerImp extends MyDoctorsController {
  late String? id;
  late String? email;

  StatusRequest statusRequest = StatusRequest.none;

  ProfileData profileData = ProfileData(Get.find());

  late List<MyDoctorLine> mydoctorslist = [];

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getPatientsDoctors();
    update();
    super.onInit();
  }

  @override
  getPatientsDoctors() {
    final doctors = Get.arguments['doctors'];
    for (var doctor in doctors) {
      final doctorEmail = doctor['email'];
      final doctorName = doctor['name'];
      final doctorLocation = doctor['location'];
      final doctorPhone = doctor['phone'];
      final doctorSpeciality = doctor['speciality'];

      final mydoctorWedget = MyDoctorLine(
        email: doctorEmail,
        name: doctorName,
        phone: doctorPhone.toString(),
        specialty: doctorSpeciality,
        location: doctorLocation,
      );
      mydoctorslist.add(mydoctorWedget);
      update();
    }
  }

  @override
  goToAddNewDoctor() {
    Get.toNamed(RouteApp.addnewdoctor, arguments: {
      'id': id,
    });
  }

  @override
  backToProfile() {
    Get.offNamed(RouteApp.profile, arguments: {
      'id': id,
      'email': email,
    });
  }
}
