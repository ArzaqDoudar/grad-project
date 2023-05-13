import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:diabetes_companion/view/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../controller/patient/maincontrollers/mainscreencontroller.dart';
import '../../../controller/patient/maincontrollers/reportcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../widget/topbar.dart';

class ReportPage extends StatelessWidget {
  // final String? id;
  int index = 1;
  ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MainScreenControllerImp mainScreenControllerImp = MainScreenControllerImp();
    Get.put(ReportControllerImp());
    return GetBuilder<ReportControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: GetBuilder<ReportControllerImp>(
            builder: (controller) => Column(
              children: [
                Row(
                  children: [
                    const Text('id ='),
                    Text(controller.id!),
                  ],
                ),
                Center(
                  child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('Jan', 30),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
            id: controller.id!, email: controller.email!, index: index),
        // bottomNavigationBar: CurvedNavigationBar(
        //   // key: navigationKeyPatient,
        //   items: mainScreenControllerImp.items,
        //   height: 60,
        //   index: mainScreenControllerImp.index,
        //   backgroundColor: Colors.transparent,
        //   buttonBackgroundColor: ColorApp.blue,
        //   animationDuration: const Duration(milliseconds: 500),
        //   color: const Color(0xFFe0e9ef),
        //   onTap: (index) {
        //     this.index = mainScreenControllerImp.index;
        //     // Get.put(controllersList[index]);
        //     // print('********************');
        //     // print('object index = ');
        //     // print(this.index);
        //     // print('********************');
        //     // print('controller index = ');
        //     // print(controller.index);
        //     // print('********************');
        //     mainScreenControllerImp.changeIndex(index);
        //     if (index == 0) {
        //       Get.toNamed(RouteApp.home, arguments: {
        //         'id': mainScreenControllerImp.id,
        //         'email': mainScreenControllerImp.email,
        //       });
        //     } else if (index == 1) {
        //       Get.toNamed(RouteApp.reportspages, arguments: {
        //         'id': mainScreenControllerImp.id,
        //         'email': mainScreenControllerImp.email,
        //       });
        //     } else if (index == 2) {
        //       Get.toNamed(RouteApp.morepages, arguments: {
        //         'id': mainScreenControllerImp.id,
        //         'email': mainScreenControllerImp.email,
        //       });
        //     } else if (index == 3) {
        //       Get.toNamed(RouteApp.profile, arguments: {
        //         'id': mainScreenControllerImp.id,
        //         'email': mainScreenControllerImp.email,
        //       });
        //     } else if (index == 4) {
        //       Get.toNamed(RouteApp.storespages, arguments: {
        //         'id': mainScreenControllerImp.id,
        //         'email': mainScreenControllerImp.email,
        //       });
        //     }
        //     // print('********************');
        //   },
        // ),
      );
    });
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
