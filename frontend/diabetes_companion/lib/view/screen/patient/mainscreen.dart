// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import '/controller/patient/maincontrollers/addlogscontroller.dart';
// import '/controller/patient/maincontrollers/homecontroller.dart';
// import '/controller/patient/maincontrollers/profilecontroller.dart';
// import '/controller/patient/maincontrollers/reportcontroller.dart';
// import '/controller/patient/maincontrollers/storecontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../controller/patient/maincontrollers/mainscreencontroller.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/constant/routes.dart';
// import '../../widget/topbar.dart';
// import 'home.dart';
// import 'morepage.dart';
// import 'profilepage.dart';
// import 'reportpage.dart';
// import 'storespage.dart';

// // ignore: must_be_immutable
// class MainScreen extends StatelessWidget {
//   MainScreen({super.key});

//   // final controllersList = [
//   //   HomeControllerImp(),
//   //   ReportControllerImp(),
//   //   AddLogsControllerImp(),
//   //   ProfileControllerImp(),
//   //   StoreControllerImp(),
//   // ];

//   final GlobalKey<CurvedNavigationBarState> navigationKeyPatient =
//       GlobalKey<CurvedNavigationBarState>();
//   int index = 0;
//   // get getIndex => index;

//   @override
//   Widget build(BuildContext context) {
//     MainScreenControllerImp controller = MainScreenControllerImp();
//     final screens = [
//       Home(),
//       ReportPage(
//           // id: controller.id,
//           ),
//       const MorePage(),
//       const ProfilePage(
//           // id: controller.id!,
//           ),
//       const StorePage(),
//     ];
//     Get.put(controller);
//     return GetBuilder<MainScreenControllerImp>(
//       builder: (controller) => Scaffold(
//         backgroundColor: ColorApp.white,
//         extendBody: true,
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
//           child: TopBar(

//               // fun: () => controller.goToChatScreen(),
//               ),
//         ),
//         body: screens[controller.index],
//         bottomNavigationBar: CurvedNavigationBar(
//           // key: navigationKeyPatient,
//           items: controller.items,
//           height: 60,
//           index: controller.index,
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: ColorApp.blue,
//           animationDuration: const Duration(milliseconds: 500),
//           color: const Color(0xFFe0e9ef),
//           onTap: (index) {
//             this.index = controller.index;
//             // Get.put(controllersList[index]);
//             // print('********************');
//             // print('object index = ');
//             // print(this.index);
//             // print('********************');
//             // print('controller index = ');
//             // print(controller.index);
//             // print('********************');
//             controller.changeIndex(index);

//             // print('********************');
//           },
//         ),
//       ),
//     );
//   }
// }
