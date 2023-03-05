import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../controller/onboardingcontroller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/onboardinglist.dart';

class CoustomeSlider extends GetView<OnBoardingControllerImp> {
  const CoustomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              onBoardingList[i].title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Image.asset(
            onBoardingList[i].image!,
            width: 300,
            height: 270,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 90),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2, color: ColorApp.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
