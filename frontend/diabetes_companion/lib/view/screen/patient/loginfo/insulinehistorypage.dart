import 'package:diabetes_companion/view/widget/sectopbar.dart';

import '../../../../controller/patient/maincontrollers/insulincontroller.dart';
import '../../../../controller/patient/maincontrollers/reportcontroller.dart';
import '../../../../core/constant/color.dart';
import '/core/class/handlingdataview.dart';
import 'package:flutter/foundation.dart';

import '/view/widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsulinHistoryPage extends StatelessWidget {
  // final String? id;
  // static int index = 1;
  const InsulinHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InsulinControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<InsulinControllerImp>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorApp.white,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'رفيق السكري',
          ),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Padding(
              padding: (kIsWeb)
                  ? EdgeInsets.symmetric(horizontal: (screenWidth * 0.5) - 500)
                  : const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'أرشيف جرعات الأنسولين',
                      style: TextStyle(fontSize: 24, color: ColorApp.blue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: ColorApp.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         const Text('عالي جدا'),
                    //         Container(
                    //           color: Colors.orange,
                    //           height: 10,
                    //           width: 20,
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         const Text('عالي '),
                    //         Container(
                    //           color: Colors.yellow[600],
                    //           height: 10,
                    //           width: 20,
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         const Text('طبيعي'),
                    //         Container(
                    //           color: Colors.green,
                    //           height: 10,
                    //           width: 20,
                    //         ),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         const Text('منخفض'),
                    //         Container(
                    //           color: Colors.red,
                    //           height: 10,
                    //           width: 20,
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    const Divider(
                      color: ColorApp.blue,
                    ),

                    Padding(
                      padding: (kIsWeb)
                          ? const EdgeInsets.symmetric(horizontal: 200)
                          : const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: controller.insulinhistory.isEmpty
                            ? [const Text('no data')]
                            : controller.insulinhistory,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
