import '/core/constant/color.dart';
import '/core/constant/imageasset.dart';

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
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBarDoctor(
            id: controller.id!,
            email: controller.email!,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // AdviceCard(
              //   text: adviceModelList[1].text,
              //   image: adviceModelList[1].image,
              // ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        ' دكتور ${controller.name}',
                        style:
                            const TextStyle(fontSize: 35, color: ColorApp.blue),
                      ),
                      const Text(
                        'اهلا بعودتك',
                        style: TextStyle(fontSize: 35, color: ColorApp.blue),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '',
                    style: TextStyle(fontSize: 20, color: ColorApp.grey1),
                  ),
                ],
              ),
              const Image(
                image: AssetImage(ImageAsset.homePageCoverDoctor),
                // fit: BoxFit.cover,
                // height: double.infinity,
                // width: double.infinity,
              )
              // AssetImage(Image.asset(ImageAsset.homePageCoverDoctor))
            ],
          ),
        ),
        bottomNavigationBar: BottomBarDoctor(
            id: controller.id!, email: controller.email!, index: index),
      ),
    );
  }
}
