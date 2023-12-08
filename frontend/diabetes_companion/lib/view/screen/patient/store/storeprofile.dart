import 'package:diabetes_companion/core/class/handlingdataview.dart';
import 'package:diabetes_companion/core/constant/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../controller/patient/store/storeprofilecontroller.dart';
import '../../../widget/sectopbar.dart';

class StoreProfile extends StatelessWidget {
  const StoreProfile({super.key});

//   @override
//   State<StoreProfile> createState() => StoreProfileState();
// }

// class StoreProfileState extends State<StoreProfile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHigh = MediaQuery.of(context).size.height;
    Get.put(StoreProfileControllerImp());
    return Scaffold(
        backgroundColor: ColorApp.white,
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: '',
          ),
        ),
        body: GetBuilder<StoreProfileControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    // image: AssetImage(ImageAsset.afia),
                                    image: AssetImage(controller.storeAvatar!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${controller.storeName} ',
                            // controller.storeName!,
                            style: const TextStyle(
                                fontFamily: 'Amiri',
                                color: ColorApp.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          Text(
                            controller.storePhone!,
                            style: const TextStyle(
                                fontFamily: 'Amiri',
                                color: ColorApp.blue,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          Text(
                            controller.storeLocation!,
                            style: const TextStyle(
                                fontFamily: 'Amiri',
                                color: ColorApp.blue,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RouteApp.storelocation, arguments: {
                                'name': controller.storeName,
                                'location': controller.storeLocation,
                                'lat': controller.lat,
                                'long': controller.long,
                              });
                            },
                            child: const Text(
                              'اظهار الموقع على الخريطة',
                              style: TextStyle(
                                  fontFamily: 'Amiri',
                                  color: ColorApp.blue,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Column(
                              children: controller.productWidgets.isNotEmpty
                                  ? controller.productWidgets
                                  : [
                                      const Text(
                                        'لا يوجد منتجات',
                                        style: TextStyle(color: ColorApp.blue),
                                      )
                                    ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //     ]
            // ),
            // )

            // Container(
            //   height: screenHigh,
            //   width: screenWidth,
            //   child: SingleChildScrollView(
            //     physics: ScrollPhysics(),
            //     scrollDirection: Axis.vertical,
            //     child: Container(
            //       padding: (kIsWeb)
            //           ? EdgeInsets.symmetric(horizontal: screenWidth * 0.1)
            //           : const EdgeInsets.symmetric(horizontal: 25),
            //       child: Column(
            //         children: [
            //           const SizedBox(
            //             height: 20,
            //           ),
            //           Stack(
            //             children: [
            //               SizedBox(
            //                 width: 120,
            //                 height: 120,
            //                 child: ClipRRect(
            //                   borderRadius: BorderRadius.circular(100),
            //                   child: Image(
            //                     // image: AssetImage(ImageAsset.afia),
            //                     image: AssetImage(controller.storeAvatar!),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //           const SizedBox(
            //             height: 10,
            //           ),
            //           Text(
            //             '${controller.storeName} ${controller.storeId}',
            //             // controller.storeName!,
            //             style: const TextStyle(
            //                 fontFamily: 'Amiri',
            //                 color: ColorApp.blue,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 30),
            //             maxLines: 2,
            //             textAlign: TextAlign.center,
            //             softWrap: true,
            //           ),
            //           Text(
            //             controller.storeLocation!,
            //             style: const TextStyle(
            //                 fontFamily: 'Amiri',
            //                 color: ColorApp.blue,
            //                 fontWeight: FontWeight.normal,
            //                 fontSize: 20),
            //             maxLines: 2,
            //             textAlign: TextAlign.center,
            //             softWrap: true,
            //           ),
            //           Text(
            //             controller.storePhone!,
            //             style: const TextStyle(
            //                 fontFamily: 'Amiri',
            //                 color: ColorApp.blue,
            //                 fontWeight: FontWeight.normal,
            //                 fontSize: 20),
            //             maxLines: 2,
            //             textAlign: TextAlign.center,
            //             softWrap: true,
            //           ),
            //           TextButton(
            //             onPressed: () {
            //               Get.toNamed(RouteApp.storelocation);
            //             },
            //             child: const Text(
            //               'Location',
            //               style: TextStyle(
            //                   fontFamily: 'Amiri',
            //                   color: ColorApp.blue,
            //                   fontWeight: FontWeight.normal,
            //                   fontSize: 20),
            //               maxLines: 2,
            //               textAlign: TextAlign.center,
            //               softWrap: true,
            //             ),
            //           ),
            //           const Divider(),
            //           // const SizedBox(
            //           //   height: 20,
            //           // ),
            //           // GridView.count(
            //           //   primary: false,
            //           //   padding: const EdgeInsets.all(20),
            //           //   crossAxisSpacing: 10,
            //           //   mainAxisSpacing: 10,
            //           //   crossAxisCount: 2,
            //           //   children: <Widget>[
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[100],
            //           //       child: const Text("He'd have you all unravel at the"),
            //           //     ),
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[200],
            //           //       child: const Text('Heed not the rabble'),
            //           //     ),
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[300],
            //           //       child: const Text('Sound of screams but the'),
            //           //     ),
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[400],
            //           //       child: const Text('Who scream'),
            //           //     ),
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[500],
            //           //       child: const Text('Revolution is coming...'),
            //           //     ),
            //           //     Container(
            //           //       padding: const EdgeInsets.all(8),
            //           //       color: Colors.teal[600],
            //           //       child: const Text('Revolution, they...'),
            //           //     ),
            //           //   ],
            //           // )
            // Expanded(
            //   child: GridView.builder(
            //       physics: const NeverScrollableScrollPhysics(),
            //       gridDelegate:
            //           const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2, childAspectRatio: 0.75),
            //       itemCount: controller.productWidgets.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return controller.productWidgets[index];
            //       }),
            // ),

            //           // Container(
            //           //   // width: screenWidth,
            //           //   // height: 500,
            //           //   child: Expanded(
            //           //     child: GridView.builder(
            //           //         physics: const NeverScrollableScrollPhysics(),
            //           //         gridDelegate:
            //           //             const SliverGridDelegateWithFixedCrossAxisCount(
            //           //                 crossAxisCount: 2, childAspectRatio: 0.75),
            //           //         itemCount: controller.productWidgets.length,
            //           //         itemBuilder: (BuildContext context, int index) {
            //           //           return controller.productWidgets[index];
            //           //         }),
            //           //   ),
            //           // ),
            //           // SingleChildScrollView(
            //           //   child: Column(
            //           //     // scrollDirection: Axis.vertical,
            //           //     children: controller.productWidgets,
            //           //     // shrinkWrap: true,
            //           //     // physics: const NeverScrollableScrollPhysics(),
            //           //     // itemCount: controller.productWidgets.length,
            //           //     // // gridDelegate:
            //           //     // //     const SliverGridDelegateWithFixedCrossAxisCount(
            //           //     // //         crossAxisCount: 2, childAspectRatio: 0.55),
            //           //     // itemBuilder: (context, index) {

            //           //     // },
            //           //     // gridDelegate:
            //           //     // itemBuilder: ((context, index) {
            //           //     //   return InkWell(
            //           //     //     child: Card(
            //           //     //       child: Padding(
            //           //     //         padding: const EdgeInsets.all(10),
            //           //     //         child: Column(
            //           //     //             mainAxisAlignment: MainAxisAlignment.center,
            //           //     //             crossAxisAlignment:
            //           //     //                 CrossAxisAlignment.center,
            //           //     //             children: controller.productWidgets),
            //           //     //       ),
            //           //     //     ),
            //           //     //   );
            //           //     // })
            //           //   ),
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          );
        }));
  }
}
