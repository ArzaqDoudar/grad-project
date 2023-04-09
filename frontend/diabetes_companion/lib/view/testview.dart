import '/controller/testcontroller.dart';
import '/core/class/statusrequest.dart';
import '/view/widget/testwidget.dart';
import 'package:get/get.dart';

import '../core/class/handlingdataview.dart';
import '/view/widget/datetime/basicdatetimefield.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('for testing'),
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text('${controller.data}');
                // return TestWidget(label: '${controller.data}');
              }),
        );
      }),
    );
  }
}
