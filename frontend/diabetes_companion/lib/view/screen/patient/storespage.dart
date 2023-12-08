import '../../../controller/patient/store/storecontroller.dart';
import '/view/widget/topbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/imageasset.dart';
import '../../widget/bottombar.dart';
import '../../widget/storewidget.dart';
import '/core/constant/color.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});
  int index = 4;
  String image = 'lowcarb';
  @override
  Widget build(BuildContext context) {
    Get.put(StoreControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<StoreControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        body: Padding(
          padding: (kIsWeb)
              ? EdgeInsets.symmetric(horizontal: (screenWidth * 0.5) - 250)
              : const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: controller.storeWidgets,
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
      ),
    );
  }
}
