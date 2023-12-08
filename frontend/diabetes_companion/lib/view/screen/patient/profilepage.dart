import 'package:flutter/foundation.dart';

import '../../../core/class/handlingdataview.dart';
import '/controller/patient/maincontrollers/profilecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/patientmodel.dart';
import '../../widget/bottombar.dart';
import '../../widget/profilemenu.dart';
import '../../widget/topbar.dart';

class ProfilePage extends StatelessWidget {
  static int index = 3;

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: ColorApp.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: (kIsWeb)
                  ? EdgeInsets.symmetric(horizontal: (screenWidth * 0.5) - 250)
                  : const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage(controller.gender == 'female'
                            ? ImageAsset.avatarPatientfemale
                            : ImageAsset.avatarPatient),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.name!,
                    style:
                        const TextStyle(fontSize: 35, color: ColorApp.darkBlue),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      GeneralMenu(
                        endIcon: false,
                        icon: Icons.arrow_drop_down_circle_outlined,
                        onPress: () => controller.showHideData(),
                        title: 'المعلومات الشخصية',
                      ),
                      Visibility(
                        visible: controller.dataVisible,
                        child: Column(
                          children: [
                            const Divider(
                              color: Colors.blueGrey,
                            ),
                            StreamBuilder<PatientModel>(
                              builder: (context, patientModel) {
                                return ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: controller.data,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                      ),
                      GeneralMenu(
                        icon: Icons.person,
                        onPress: () => controller.goToEditProfile(),
                        title: 'تعديل المعلومات الشخصية',
                      ),
                      // GeneralMenu(
                      //   icon: Icons.calendar_month_rounded,
                      //   onPress: () => controller.goToMyAppointments(),
                      //   title: 'مواعيدي',
                      // ),
                      GeneralMenu(
                        icon: Icons.medical_services,
                        onPress: () => controller.goToMyDoctors(),
                        title: 'أطبائي',
                      ),
                      GeneralMenu(
                        icon: Icons.medication_outlined,
                        onPress: () => controller.showInsuline(),
                        title: 'ارشيف الأنسولين',
                      ),
                      const Divider(
                        color: Colors.blueGrey,
                      ),
                      GeneralMenu(
                        endIcon: false,
                        icon: Icons.logout,
                        onPress: () => controller.signOut(),
                        title: 'تسجيل الخروج',
                        color: ColorApp.red,
                      ),
                      const SizedBox(
                        height: 170,
                      ),
                    ],
                  ),
                ],
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
