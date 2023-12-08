import 'package:diabetes_companion/data/datasource/remote/storedata.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/functions/handlingdatacontroller.dart';
import '../../../view/widget/storewidget.dart';

abstract class StoreController extends GetxController {
  getData();
}

class StoreControllerImp extends StoreController {
  StatusRequest statusRequest = StatusRequest.none;

  StoreData storeData = StoreData(Get.find());

  String? id;
  String? email;
  String? name;

  List<StoreWidget> storeWidgets = [];

  @override
  void onInit() {
    super.onInit();
    // storeId = Get.arguments['storeId'];
    id = Get.arguments['id'];
    email = Get.arguments['email'];
    getData();
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeData.getAllStores();
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        print('data =${response['result']}');
        final collection = response['result'] ?? [];
        for (var store in collection) {
          var storewidget = StoreWidget(
            storeId: store['id'],
            storeName: store['name'],
            storeLocation: store['location'],
            storeLogo: store['avatar'],
            storePhone: store['phone'],
            lat: double.parse(store['lat'] ?? 32.22504.toString()),
            long: double.parse(store['long'] ?? 35.26097099999993.toString()),
            // lat: 32.22504,
            // long: 35.26097099999993,
            initialRating: double.parse(store['rate']),
          );
          storeWidgets.add(storewidget);
        }
        update();
        print('store length = ${storeWidgets.length}');
      }
    }
  }
}
