// StoreProfileControllerImp

import 'package:diabetes_companion/data/datasource/remote/storedata.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/functions/handlingdatacontroller.dart';
import '../../../view/widget/productwidget.dart';
import '../../../view/widget/storewidget.dart';

abstract class StoreProfileController extends GetxController {
  getData();
  getProducts();
}

class StoreProfileControllerImp extends StoreProfileController {
  StatusRequest statusRequest = StatusRequest.none;

  StoreData storeData = StoreData(Get.find());
// d
  String? id;
  String? email;
  String? storeId;
  String? storeName;
  String? storePhone;
  String? storeLocation;
  String? storeAvatar;
  double? lat;
  double? long;
  List<ProductWidget> productWidgets = [];

  @override
  void onInit() {
    super.onInit();
    storeId = Get.arguments['storeId'];
    print('storeId $storeId');
    getData();
    getProducts();

    print('id $storeId');
    print('name $storeName');
    print('phone $storePhone');
    print('location $storeLocation');
    print('avatar $storeAvatar');
    print('lat $lat');
    print('long $long');
    update();
  }

  @override
  getData() async {
    storeName = Get.arguments['storeName'];
    storePhone = Get.arguments['storePhone'];
    storeLocation = Get.arguments['storeLocation'];
    storeAvatar = Get.arguments['storeLogo'];
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    // var response = await storeData.getStore(storeId!);
    // statusRequest = handlingData(response);
    // print("response after handle= $response");
    // if (statusRequest == StatusRequest.success) {
    //   if (response['status'] == true) {
    //     storeName = response['name'];
    //     storePhone = response['phone'];
    //     storeLocation = response['avatar'];
    //     storeAvatar = response['location'];
    //     lat = response['lat'];
    //     long = response['long'];

    //     print('name2222 ${response['name']}');
    //     // print('name $storeName');
    //     // print('phone $storePhone');
    //     // print('location $storeLocation');
    //     // print('avatar $storeAvatar');
    //     // print('lat $lat');
    //     // print('long $long');
    //   }
    // }
    update();
  }

  @override
  getProducts() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeData.getStoreProducts(storeId!);
    statusRequest = handlingData(response);
    print("response after handle= $response");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == true) {
        print('data =${response['products']}');
        final products = response['products'] ?? [];
        for (var product in products) {
          var productWidget = ProductWidget(
            productIngredient: product['ingredient'],
            productDescription: product['description'],
            productImage: product['image'],
            productName: product['name'],
            productPrice: product['price'].toString(),
            productStore: product['store_id'],
          );
          productWidgets.add(productWidget);
        }

        print('product length = ${productWidgets.length}');
      }
      statusRequest == StatusRequest.success;
      update();
    }
  }
}
