import 'package:get/get.dart';

import '../../../../controller/patient/profile/mydoctorscontroller.dart';
import '../../../../core/constant/routes.dart';
import '../../../widget/mydoctorline.dart';
import '/view/widget/buttonauth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';
import '../../../widget/sectopbar.dart';
import 'addnewdoctor.dart';

class MyDoctors extends StatelessWidget {
  MyDoctors({super.key});

  // List<MyDoctorLine> data = [
  //   const MyDoctorLine(
  //     name: 'ارزاق زياد',
  //     phone: '0568175591',
  //     specialty: 'كلى',
  //   ),
  //   const MyDoctorLine(
  //     name: 'ارزاق زياد',
  //     phone: '0568175591',
  //     email: 'arzaqwin10@gmail.com',
  //     specialty: 'قلب',
  //   ),
  //   const MyDoctorLine(
  //     name: 'ارزاق زياد',
  //     phone: '0568175591',
  //     location: 'نابلس - دوار الشهداء',
  //     specialty: 'عظام',
  //   ),
  //   const MyDoctorLine(
  //     name: 'ارزاق زياد',
  //     phone: '0568175591',
  //     email: 'arzaqwin10@gmail.com',
  //     location: 'نابلس - دوار الشهداء',
  //     specialty: 'السكري',
  //   ),
  // ];
  @override
  Widget build(BuildContext context) {
    Get.put(MyDoctorsControllerImp());
    return GetBuilder<MyDoctorsControllerImp>(
        builder: (controller) => Scaffold(
            extendBody: true,
            appBar: AppBar(
              backgroundColor: ColorApp.blue,
              title: const Text('أطبائي'),
              centerTitle: true,
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => controller.backToProfile()),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Form(
                          child: Column(children: [
                            Center(
                              child: Column(
                                children: [
                                  const Text(
                                    'أضف طبيب جديد',
                                    style: TextStyle(
                                        fontFamily: 'Amiri',
                                        color: ColorApp.blue,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 30),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
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
                                    onPressed: () =>
                                        controller.goToAddNewDoctor(),
                                    child: const Icon(Icons.add),
                                  ),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  const Divider(
                                    color: Colors.blueGrey,
                                  ),
                                  if (controller.mydoctorslist.isNotEmpty)
                                    Column(
                                      children: controller.mydoctorslist,
                                    )
                                  else
                                    const Center(
                                      child: Text(
                                        'لا يوجد معلومات',
                                        style: TextStyle(
                                          color: ColorApp.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
