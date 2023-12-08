import 'package:animated_fab_button_menu/animated_fab_button_menu.dart';

import '/view/screen/firebase/chatscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/topbarcontroller.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/patient/patient.dart';

class TopBar extends StatelessWidget {
  final String id;
  final String email;
  TopBar({
    required this.id,
    required this.email,
    super.key,
  });

  StatusRequest statusRequest = StatusRequest.none;
  PatientData patientData = PatientData(Get.find());

  late String? secondEmail;
  late String? secondName;

  @override
  Widget build(BuildContext context) {
    goToChatScreen() async {
      statusRequest = StatusRequest.loading;
      var response = await patientData.getPatientDoctor(id);
      statusRequest = handlingData(response);
      print("response after handle= $response");
      print('arzaq email');
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == true) {
          secondEmail = response['doctor_email'];
          secondName = response['doctor_name'];
          print('secondEmail');
          print(secondEmail);
          print(response['doctor_name']);
          Get.toNamed(RouteApp.chatting, arguments: {
            'id': id,
            'email': email,
            'secondEmail': secondEmail,
            'secondName': secondName,
          });
        } else {
          print(response['msg']);
          print('no email');
          Get.toNamed(RouteApp.nodoctorchat, arguments: {
            'id': id,
          });
        }
      } else {
        print('statusRequest');
        print(statusRequest);
        // print(response['msg']);
        Get.toNamed(RouteApp.nodoctorchat, arguments: {
          'id': id,
        });
      }
      print('email from go to chat screen $email');
    }

    final screenwidth = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 1,
      leading: IconButton(
        onPressed: () => goToChatScreen(),
        icon: const Icon(
          Icons.message,
          // color: ColorApp.blue,
        ),
      ),
      title: const Text(
        (kIsWeb) ? '' : 'رفيق السكري ',
        style: TextStyle(
            // color: ColorApp.blue,
            ),
      ),
      centerTitle: true,
      actions: <Widget>[
        if (kIsWeb)
          SizedBox(
            width: screenwidth * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offNamed(RouteApp.home, arguments: {
                      'id': id,
                      'email': email,
                    });
                  },
                  icon: const Icon(
                    Icons.home,
                    color: ColorApp.white,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.offNamed(RouteApp.reportspages, arguments: {
                      'id': id,
                      'email': email,
                    });
                  },
                  icon: const Icon(
                    Icons.bar_chart_rounded,
                    color: ColorApp.white,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.offNamed(RouteApp.morepages, arguments: {
                      'id': id,
                      'email': email,
                    });
                  },
                  icon: const Icon(
                    Icons.add_circle_outlined,
                    color: ColorApp.white,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.offNamed(RouteApp.profile, arguments: {
                      'id': id,
                      'email': email,
                    });
                  },
                  icon: const Icon(
                    Icons.account_circle_rounded,
                    color: ColorApp.white,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.offNamed(RouteApp.storespages, arguments: {
                      'id': id,
                      'email': email,
                    });
                  },
                  icon: const Icon(
                    Icons.store,
                    color: ColorApp.white,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        // (kIsWeb)
        //     ? Container()
        //     // : IconButton(
        //     //     icon: const Icon(
        //     //       Icons.notifications,
        //     //       // color: ColorApp.blue,
        //     //     ),
        //     //     onPressed: () {
        //     // TODO notifications

        //     : FabMenu(
        //         fabBackgroundColor: ColorApp.blue,
        //         elevation: 0,
        //         // fabAlignment: Alignment.bottomCenter,
        //         fabIcon: const Icon(Icons.menu),
        //         closeMenuButton: const Icon(
        //           Icons.close,
        //           size: 40,
        //           color: Colors.white,
        //         ),
        //         overlayOpacity: 0.75,
        //         overlayColor: ColorApp.blue,
        //         children: [
        //             MenuItem(
        //               title: 'ارشيف الأنسولين',
        //               onTap: () {
        //                 Get.offNamed(RouteApp.insulinhistorypage, arguments: {
        //                   'id': id,
        //                   'email': email,
        //                 });
        //               },
        //               style: const TextStyle(
        //                   color: ColorApp.white,
        //                   fontSize: 24,
        //                   fontWeight: FontWeight.bold),
        //             ),
        //           ])
        //   },
        // ),
      ],
      backgroundColor: ColorApp.blue,
    );
  }
}
