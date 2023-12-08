import '/core/class/handlingdataview.dart';
import 'package:flutter/foundation.dart';

import '/view/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../controller/patient/maincontrollers/reportcontroller.dart';
import '../../../core/class/glocosedata.dart';
import '../../../core/constant/color.dart';
import '../../widget/topbar.dart';

class ReportPage extends StatelessWidget {
  // final String? id;
  static int index = 1;
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReportControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ReportControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GetBuilder<ReportControllerImp>(
              builder: (controller) => Padding(
                padding: (kIsWeb)
                    ? EdgeInsets.symmetric(
                        horizontal: (screenWidth * 0.5) - 500)
                    : const EdgeInsets.symmetric(horizontal: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => controller.time = '1',
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.time == '1'
                                    ? ColorApp.blue
                                    : ColorApp.white,
                                border: controller.time == '1'
                                    ? Border.all(color: ColorApp.blue, width: 2)
                                    : Border.all(
                                        color: ColorApp.nocolor, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'يوم 1',
                                  style: TextStyle(
                                    color: controller.time == '1'
                                        ? ColorApp.white
                                        : ColorApp.grey,
                                    fontSize: controller.time == '1' ? 20 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.time = '7',
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.time == '7'
                                    ? ColorApp.blue
                                    : ColorApp.white,
                                border: controller.time == '7'
                                    ? Border.all(color: ColorApp.blue, width: 2)
                                    : Border.all(
                                        color: ColorApp.nocolor, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '7 ايام',
                                  style: TextStyle(
                                    color: controller.time == '7'
                                        ? ColorApp.white
                                        : ColorApp.grey,
                                    fontSize: controller.time == '7' ? 20 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.time = '14',
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.time == '14'
                                    ? ColorApp.blue
                                    : ColorApp.white,
                                border: controller.time == '14'
                                    ? Border.all(color: ColorApp.blue, width: 2)
                                    : Border.all(
                                        color: ColorApp.nocolor, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '14 يوم',
                                  style: TextStyle(
                                    color: controller.time == '14'
                                        ? ColorApp.white
                                        : ColorApp.grey,
                                    fontSize: controller.time == '14' ? 20 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.time = '30',
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.time == '30'
                                    ? ColorApp.blue
                                    : ColorApp.white,
                                border: controller.time == '30'
                                    ? Border.all(color: ColorApp.blue, width: 2)
                                    : Border.all(
                                        color: ColorApp.nocolor, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '30 يوم',
                                  style: TextStyle(
                                    color: controller.time == '30'
                                        ? ColorApp.white
                                        : ColorApp.grey,
                                    fontSize: controller.time == '30' ? 20 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.time = '90',
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.time == '90'
                                    ? ColorApp.blue
                                    : ColorApp.white,
                                border: controller.time == '90'
                                    ? Border.all(color: ColorApp.blue, width: 2)
                                    : Border.all(
                                        color: ColorApp.nocolor, width: 2),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  '90 يوم',
                                  style: TextStyle(
                                    color: controller.time == '90'
                                        ? ColorApp.white
                                        : ColorApp.grey,
                                    fontSize: controller.time == '90' ? 20 : 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <LineSeries<GlocoseData, String>>[
                            LineSeries<GlocoseData, String>(
                                // Bind data source
                                dataSource: controller.historydatalist,
                                xValueMapper: (GlocoseData glocoseData, _) =>
                                    glocoseData.time,
                                yValueMapper: (GlocoseData glocoseData, _) =>
                                    glocoseData.data,
                                pointColorMapper: (GlocoseData data, int i) =>
                                    ColorApp.blue,
                                markerSettings: const MarkerSettings(
                                    isVisible: true,
                                    shape: DataMarkerType.circle,
                                    borderColor: ColorApp.blue),
                                color: ColorApp.blue,
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: true)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Text('عالي جدا'),
                              Container(
                                color: Colors.orange,
                                height: 10,
                                width: 20,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('عالي '),
                              Container(
                                color: Colors.yellow[600],
                                height: 10,
                                width: 20,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('طبيعي'),
                              Container(
                                color: Colors.green,
                                height: 10,
                                width: 20,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('منخفض'),
                              Container(
                                color: Colors.red,
                                height: 10,
                                width: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('الأرشيف'),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: (kIsWeb)
                            ? const EdgeInsets.symmetric(horizontal: 200)
                            : const EdgeInsets.symmetric(horizontal: 0),
                        child: Column(
                          children: controller.history.isEmpty
                              ? [const Text('no data')]
                              : controller.history,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: (kIsWeb)
            ? null
            : BottomBar(
                id: controller.id!,
                email: controller.email!,
                index: index,
              ),
      );
    });
  }
}
