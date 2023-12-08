import '/view/widget/topbardoctor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/imageasset.dart';
import '../../../../controller/doctor/profiledoctorcontroller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../data/model/patientmodel.dart';
import '../../../widget/bottombardoctor.dart';
import '../../../widget/profilemenu.dart';
import '../../auth/login.dart';

class ProfilePageDoctor extends StatelessWidget {
  const ProfilePageDoctor({super.key});
  static String gender = 'female';
  static int index = 3;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileDoctorControllerImp());
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<ProfileDoctorControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBarDoctor(id: controller.id!, email: controller.email!),
        ),
        body: HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: SingleChildScrollView(
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
                      child: const Image(
                        image: AssetImage(ImageAsset.avatarDoctor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    controller.name!,
                    style:
                        const TextStyle(fontSize: 35, color: ColorApp.darkBlue),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //Menu

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
                    onPress: () => controller.goToEditProfileDoctor(),
                    title: 'تعديل المعلومات الشخصية',
                  ),
                  GeneralMenu(
                    icon: Icons.settings,
                    onPress: () {},
                    title: 'الاعدادات',
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
                ],
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
