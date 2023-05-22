import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../controller/doctor/patientscontroller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/bottombardoctor.dart';
import '../../widget/topbardoctor.dart';

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});
  static int index = 2;
  @override
  Widget build(BuildContext context) {
    Get.put(PatientsControllerImp());
    return GetBuilder<PatientsControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBarDoctor(
            id: controller.id!,
            email: controller.email!,
            // title: 'المرضــى',
          ),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'أضف مريض ',
                      style: TextStyle(
                        color: ColorApp.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    FilledButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        textStyle: const TextStyle(fontSize: 20),
                        alignment: const Center().alignment,
                      ),
                      onPressed: () => controller.goToAddNewPatient(),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: Colors.blueGrey,
                    ),
                    Column(
                      children: controller.patentWedgets,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomBarDoctor(
            id: controller.id!, email: controller.email!, index: index),
      ),
    );
  }
}
