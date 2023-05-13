import 'package:diabetes_companion/core/constant/color.dart';

import '../../controller/testcontroller.dart';
import '/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../view/widget/testwidget.dart';
import '../constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final TestControllerImp controller = TestControllerImp();
  final Widget widget;
  HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});
  void retry() {
    // statusRequest = StatusRequest.none;
  }

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAsset.loadingLottie))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: TestWidget(label: 'offlinefailure'))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(ImageAsset.serverNotFoundLottie),
                      ElevatedButton(
                        onPressed: controller.relode(),
                        // () {
                        // controller.setStatusRequest(statusRequest);

                        // Get.offNamed(RouteApp.login);
                        // },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ColorApp.blue)),
                        child: const Text('اعد المحاولة'),
                      ),
                    ],
                  ))
                // :statusRequest == StatusRequest.failure
                //     ?Center(child: Lottie.asset(ImageAsset.noDataLottie))
                : widget;
  }
}
