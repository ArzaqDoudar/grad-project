import 'package:diabetes_companion/data/datasource/remote/advice.dart';
import 'package:diabetes_companion/data/model/advicemodel.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageasset.dart';
import '../../../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  getAdvice();
  getData();
}

class HomeControllerImp extends HomeController {
  StatusRequest statusRequest = StatusRequest.none;

  AdviceData adviceData = AdviceData(Get.find());
  // ProfileData profileData = ProfileData(Get.find());

  String? id;
  String? email;
  String? name;
  // advice
  String text = "";
  String image = "";
  String description = "";
  AdviceModel adviceModel = AdviceModel(image: '', text: '');
  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getAdvice();
    update();
    super.onInit();
  }

  @override
  getAdvice() async {
    statusRequest = StatusRequest.loading;
    update();
    String tag = "";
    var response = await adviceData.getAdvice(tag);
    print('response = $response');

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        text = response['advicetext'];
        image = response['adviceimage'] ?? ImageAsset.adviceDefultImage;
        description = response['advicedescription'] ?? '';

        print('description $description');
        // adviceModel = AdviceModel(
        //   text: text,
        //   title: description,
        //   image: ImageAsset.adviceImageOne,
        // );
        update();
      }
    } else {
      print('get advice else');
    }
  }

  @override
  getData() {
    // TODO: implement getData
    // throw UnimplementedError();
  }
}
