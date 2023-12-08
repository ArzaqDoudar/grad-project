import '/core/class/handlingdataview.dart';
import 'package:get/get.dart';

import '../../controller/doctor/patientinformationcontroller.dart';
import '/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageasset.dart';
import 'sectopbar.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PatientInformationControllerImp());
    return GetBuilder<PatientInformationControllerImp>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SecTopBar(
            label: 'معلومات المريض',
          ),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            image: AssetImage(controller.gender == 'male'
                                ? ImageAsset.avatarPatient
                                : ImageAsset.avatarPatientfemale),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        controller.patientName!,
                        style:
                            const TextStyle(fontSize: 18, color: ColorApp.red),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'المعلومات العامة:',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorApp.red,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'العمر : ${controller.patientAge}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'الجنس : ${controller.patientGender}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'رقم الجوال : ${controller.patientPhone}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'نوع السكري : ${controller.diabetesType!}',
                          style: const TextStyle(
                              fontSize: 18,
                              color: ColorApp.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'المعلومات الصحية:',
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorApp.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: controller.diseaselist,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: ButtonAuth(
                      label: 'التقرير',
                      onPressedFun: () => controller.goToPatientReport(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
