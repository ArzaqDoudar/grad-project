import 'package:diabetes_companion/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../widget/insulinline.dart';
import '../../widget/summarycard.dart';
import '../../widget/minmaxglocoseline.dart';
import '/controller/patient/maincontrollers/homecontroller.dart';
import '/view/widget/bottombar.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../widget/advicecard.dart';
import 'package:flutter/material.dart';
import '../../widget/topbar.dart';
// import 'auth/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static int index = 0;
  static int counter = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(
            id: controller.id!,
            email: controller.email!,
          ),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Padding(
                padding: (kIsWeb)
                    ? EdgeInsets.symmetric(
                        horizontal: (screenWidth * 0.5) - 500)
                    : const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    AdviceCard(
                      text: controller.text,
                      description: controller.description,
                      image: controller.image,
                    ),
                    SummaryCard(
                      screenWidth: screenWidth,
                      doses: controller.dosesUnits,
                      high: controller.high,
                      low: controller.low,
                      normal: controller.normal,
                      veryhigh: controller.veryhigh,
                    ),
                    MinMaxGlocoseLine(
                      min: controller.min,
                      avg: controller.avg,
                      max: controller.max,
                      // onPress: () => controller.showInsulinHistory(),
                    ),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       flutterLocalNotificationsPlugin.show(
                    //           0,
                    //           '${counter++}',
                    //           'test notification',
                    //           NotificationDetails(
                    //               android: AndroidNotificationDetails(
                    //                   channel.id, channel.name,
                    //                   channelDescription: channel.description,
                    //                   color: ColorApp.blue,
                    //                   playSound: true,
                    //                   icon: '@mipmap/ic_launcher')));
                    //     },
                    //     child: Text('notification')),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: (kIsWeb)
            ? null
            : BottomBar(
                id: controller.id!,
                email: controller.email!,
                index: index,
              ),
      ),
    );
  }
}
