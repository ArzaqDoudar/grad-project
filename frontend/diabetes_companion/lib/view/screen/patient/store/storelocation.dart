// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:diabetes_companion/core/class/handlingdataview.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/constant/color.dart';
import '../../../../controller/patient/store/storelocationcontroller.dart';
import '../../../widget/sectopbar.dart';

class StoreLocation extends StatefulWidget {
  const StoreLocation({super.key});

  @override
  State<StoreLocation> createState() => StoreLocationState();
}

class StoreLocationState extends State<StoreLocation> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHigh = MediaQuery.of(context).size.height;
    Get.put(StoreLocationControllerImp());
    return GetBuilder<StoreLocationControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorApp.white,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: SecTopBar(
            label: controller.name ?? 'Store',
          ),
        ),
        body: SingleChildScrollView(
          child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SizedBox(
              width: screenWidth,
              height: screenHigh - 80,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: controller.marker.toSet(),
                // onTap: (latLng) {
                //   controller.addMarker(latLng);
                // },
                initialCameraPosition: controller.kGooglePlex!,
                onMapCreated: (GoogleMapController googleMapController) {
                  controller.completerController!.complete(googleMapController);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
