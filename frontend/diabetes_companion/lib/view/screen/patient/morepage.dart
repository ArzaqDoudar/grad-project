import 'package:diabetes_companion/controller/patient/maincontrollers/addlogscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widget/bottombar.dart';
import '../../widget/topbar.dart';
import 'loginfo/alarmpage.dart';
import 'loginfo/bloodglocosepage.dart';
import 'loginfo/carbspage.dart';
import 'loginfo/medicinepage.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});
  static int index = 2;

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    Get.put(AddLogsControllerImp());
    return GetBuilder<AddLogsControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TopBar(id: controller.id!, email: controller.email!),
        ),
        // color: ColorApp.white,
        // debugShowCheckedModeBanner: false,
        body: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: ColorApp.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: SafeArea(
                child: Column(
                  children: const [
                    TabBar(
                      unselectedLabelColor: ColorApp.blue,
                      labelColor: ColorApp.red,
                      indicatorColor: ColorApp.red,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      tabs: [
                        Tab(
                          text: 'نسبة السكر',
                          icon: Icon(Icons.water_drop),
                        ),
                        Tab(
                            text: 'الجرعات',
                            icon: Icon(Icons.medication_rounded)),
                        Tab(
                            text: 'الكربوهيدرات',
                            icon: Icon(Icons.fastfood_sharp)),
                        Tab(text: 'منبه', icon: Icon(Icons.alarm)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                BloodGlucosePage(controller: controller),
                MedicinePage(controller: controller),
                CarbsPage(controller: controller),
                AlarmPage(controller: controller),
              ],
            ),
          ),
        ),
        bottomNavigationBar: screenwidth < 1000
            ? BottomBar(
                id: controller.id!, email: controller.email!, index: index)
            : null,
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class MorePage extends StatelessWidget {
//   const MorePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       // bottomNavigationBar: Cu(),
//       body: Text(
//         'More',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }
