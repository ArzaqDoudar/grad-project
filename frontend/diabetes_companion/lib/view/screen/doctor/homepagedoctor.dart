import 'package:diabetes_companion/core/constant/imageasset.dart';

import '../../../controller/doctor/homedoctorcontroller.dart';
import '../../widget/bottombardoctor.dart';
import '../../widget/topbardoctor.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    Get.put(HomeDoctorControllerImp());
    return GetBuilder<HomeDoctorControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBarDoctor(
            id: controller.id!,
            email: controller.email!,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  // AdviceCard(
                  //   text: adviceModelList[1].text,
                  //   image: adviceModelList[1].image,
                  // ),
                  Text('Doctor'),
                  Image(
                    image: AssetImage(ImageAsset.homePageCoverDoctor),
                    // fit: BoxFit.cover,
                    // height: double.infinity,
                    // width: double.infinity,
                  )
                  // AssetImage(Image.asset(ImageAsset.homePageCoverDoctor))
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBarDoctor(
            id: controller.id!, email: controller.email!, index: index),
      ),
    );
  }
}
