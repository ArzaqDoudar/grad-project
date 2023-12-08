import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/doctor/doctor.dart';

abstract class HomeDoctorController extends GetxController {
  // getAdvice();
  getData();
}

class HomeDoctorControllerImp extends HomeDoctorController {
  StatusRequest statusRequest = StatusRequest.none;

  DoctorData doctorData = DoctorData(Get.find());

  String? id;
  String? email;
  String? name;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    name = '';
    getData();
    update();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await doctorData.getDoctor(id!);
    // print('response = $response');

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      //
      if (response['status'] == true) {
        name = response["name"];
      }
    }
    update();
  }
}
