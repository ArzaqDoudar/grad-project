import 'package:diabetes_companion/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../widget/onboarding/coustomslider.dart';
import '../../widget/onboarding/custombtn.dart';
import '../../widget/onboarding/customedotcontroller.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: CoustomeSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const CustomeDotController(),
                  const Spacer(flex: 2),
                  const CustomeBtn(),
                  TextButton(
                    onPressed: () {
                      controller.skip();
                    },
                    child: const Text(
                      'تخطى',
                      style: TextStyle(
                        color: ColorApp.blue,
                        fontSize: 16,
                        // decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
