import 'package:diabetes_companion/controller/patient/maincontrollers/storecontroller.dart';
import 'package:diabetes_companion/view/widget/topbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/bottombar.dart';
import '../../widget/store.dart';
import '/core/constant/color.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});
  int index = 4;

  @override
  Widget build(BuildContext context) {
    Get.put(StoreControllerImp());
    return GetBuilder<StoreControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: const [
                SizedBox(
                  height: 30,
                ),
                Store(
                  storeLocation: 'رام الله',
                  storeLogo: ImageAsset.store1,
                  storeName: 'متجر شوفانكم',
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 10,
                ),
                Store(
                  storeLocation: 'رام الله',
                  storeLogo: ImageAsset.store1,
                  storeName: 'متجر شوفانكم',
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
            id: controller.id!, email: controller.email!, index: index),
      ),
    );
  }
}
