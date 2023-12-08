import 'dart:async';

// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import '../../../core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

abstract class StoreLocationController extends GetxController {
  getData();
  getCurrentLocation();
  addMarker(LatLng latLng);
  // Future getPermission();
  // Future<void> getLatAndLong();
}

class StoreLocationControllerImp extends StoreLocationController {
  StatusRequest statusRequest = StatusRequest.loading;

  // Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? completerController;
  List<Marker> marker = [];
  String? storeId;
  String? id;
  String? email;
  String? name;
  String? location;
  double? lat;
  double? long;

  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    name = Get.arguments['name'];
    location = Get.arguments['location'];
    lat = Get.arguments['lat'] ?? 32.22504;
    long = Get.arguments['long'] ?? 35.26097099999993;
    getCurrentLocation();

    update();
    super.onInit();
  }

  @override
  getData() {
    print('get data');
  }

  @override
  getCurrentLocation() async {
    // position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(target: LatLng(lat!, long!), zoom: 14);
    addMarker(LatLng(lat!, long!));

    statusRequest = StatusRequest.success;
  }

  @override
  addMarker(latLng) {
    marker.clear();
    // marker.add(Marker(markerId: const MarkerId('1'), position: latLng));
    marker.add(Marker(
      markerId: const MarkerId("1"),
      position: latLng,
      infoWindow: InfoWindow(
        title: name,
        snippet: location ?? '',
      ),
    ));

    print('Markers $marker');
    update();
  }

  // @override
  // Future getPermission() async {
  //   bool services;
  //   LocationPermission permission;
  //   services = await Geolocator.isLocationServiceEnabled();
  //   if (!services) {
  //     return Get.snackbar('تنبيه', 'يجب تفعيل تحديد الموقع الجغرافي');
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Get.snackbar('تنبيه', 'الرجاء تفعيل تحديد الموقع الجغرافي');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Get.snackbar('تنبيه', 'لا يمكن استعمال الخريطة');
  //   }
  //   print('permission $permission');

  //   return permission;
  // }
}




























  // @override
  // Future getPermission() async {
  //   bool services;
  //   LocationPermission permission;
  //   services = await Geolocator.isLocationServiceEnabled();
  //   if (services == false) {
  //     //   AwesomeDialog(
  //     //       context: context,
  //     //       // dialogType: DialogType.info,
  //     //       title: 'Services',
  //     //       body: const Text('Services Not Enabled'))
  //     //     ..show();
  //     // }
  //     permission = await Geolocator.checkPermission();
  //     if (permission == LocationPermission.denied) {
  //       permission = await Geolocator.requestPermission();
  //       //TODO
  //     }
  //     print('permission $permission');

  //     return permission;
  //   }
  // }

  // @override
  // Future<void> getLatAndLong() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   currentPosition =
  //       await Geolocator.getCurrentPosition().then((value) => value);
  //   lat = currentPosition!.latitude;
  //   long = currentPosition!.longitude;
  //   kGooglePlex = CameraPosition(
  //     target: LatLng(lat, long),
  //     zoom: 8.4746,
  //   );
  //   print('lat $lat');
  //   print('long $long');
  //   statusRequest = StatusRequest.success;

  //   update();
  // }