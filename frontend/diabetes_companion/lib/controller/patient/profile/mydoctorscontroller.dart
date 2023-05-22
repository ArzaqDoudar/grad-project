import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/routes.dart';
import '../../../data/datasource/remote/patient/profile/profile.dart';
import '../../../view/widget/mydoctorline.dart';

abstract class MyDoctorsController extends GetxController {
  goToAddNewDoctor();
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
    mydoctorslist = Get.arguments['doctors'] ?? [];
    update();
    super.onInit();
  }

  @override
  goToAddNewDoctor() {
    Get.offNamed(RouteApp.addnewdoctor, arguments: {
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
