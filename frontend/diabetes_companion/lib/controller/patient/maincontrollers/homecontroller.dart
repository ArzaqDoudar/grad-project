import '../../../core/constant/routes.dart';
import '../../../data/datasource/remote/patient/addlogs.dart';
import '/data/datasource/remote/advice.dart';
import '/data/model/advicemodel.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/imageasset.dart';
import '../../../core/functions/handlingdatacontroller.dart';

abstract class HomeController extends GetxController {
  getAdvice();
  getMinMax();
  // getInsulinDosesLength();
  showInsulinHistory();
}

class HomeControllerImp extends HomeController {
  StatusRequest statusRequest = StatusRequest.none;

  AdviceData adviceData = AdviceData(Get.find());
  // ProfileData profileData = ProfileData(Get.find());
  LogsData logsData = LogsData(Get.find());

  String? id;
  String? email;
  String? name;
  // advice
  String text = "";
  String image = "";
  String description = "";
  AdviceModel adviceModel = AdviceModel(image: '', text: '');

  int high = 0;
  int veryhigh = 0;
  int low = 0;
  int normal = 0;
  int dosesNum = 0;
  int dosesUnits = 0;

  num min = 0;
  num avg = 0;
  num max = 0;

  @override
  void onInit() {
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getMinMax();
    // getInsulinDosesLength();

    update();
    super.onInit();
  }

  @override
  getAdvice() async {
    statusRequest = StatusRequest.loading;
    // update();
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
        // update();
      }
    } else {
      print('get advice else');
    }
  }

  @override
  getMinMax() async {
    getAdvice();
    print(
        '*****------*****------*****------*****------*****------*****------*****------');
    statusRequest = StatusRequest.loading;
    // update();
    var response = await logsData.getGlocose(
      id!,
      '1', // before 1 day
    );
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        final collection = response['data'] ?? [];
        int collectionlength = response['datalength'];
        // doses = collectionlength;
        // update();
        num sum = 0;
        print("length ${response['datalength']}");
        for (var data in collection) {
          print("descrip ${data['description']}");
          if (data['description'] == 'normal') {
            normal++;
          } else if (data['description'] == 'high') {
            high++;
          } else if (data['description'] == 'low') {
            low++;
          } else {
            veryhigh++;
          }

          if (data['blood_glocose'] < min || min == 0) {
            min = data['blood_glocose'];
          }
          if (data['blood_glocose'] > max) {
            max = data['blood_glocose'];
          }
          sum = sum + data['blood_glocose'];
        }
        avg = num.parse(
            (int.parse(sum.toString()) / collectionlength).floor().toString());
        // avg =num.parse (sum / collectionlength).toString());
      }
      var response1 = await logsData.getInsulin(
        id!,
        '1', // before 1 day
      );
      statusRequest = handlingData(response1);
      print("response after handle= $response1");
      if (statusRequest == StatusRequest.success) {
        if (response1['status'] == true) {
          final collection1 = response1['data'] ?? [];
          int sum = 0;
          dosesNum = response1['datalength'];
          for (var data1 in collection1) {
            num temp = data1['dose_units'];
            sum = sum + temp.toInt();
          }
          dosesUnits = sum;
        }
        // update();
      }
      update();
    }
  }

  @override
  showInsulinHistory() {
    Get.toNamed(RouteApp.insulinhistorypage, arguments: {
      'id': id,
      'email': email,
    });
  }

  // @override
  // getInsulinDosesLength() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await logsData.getInsulin(
  //     id!,
  //     '1', // before 1 day
  //   );
  //   statusRequest = handlingData(response);
  //   print("response after handle= $response");
  //   if (statusRequest == StatusRequest.success) {
  //     if (response['status'] == true) {
  //       doses = response['datalength'];
  //     }
  //     // update();
  //   }
  // }
}
