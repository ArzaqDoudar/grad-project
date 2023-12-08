// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import '/view/screen/doctor/patients.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controller/doctor/mainscreendoctorcontroller.dart';
// import '../../../core/constant/color.dart';
// import '../../widget/topbar.dart';
// import 'addadvice.dart';
// import 'homepage.dart';
// import 'profile/profilepage.dart';

// // ignore: must_be_immutable
// class MainScreenDoctor extends StatelessWidget {
//   MainScreenDoctor({super.key});
//   final screens = [
//     HomeDoctor(),
//     const AddAdvicePage(),
//     const ProfilePageDoctor(),
//     const PatientsPage()
//   ];
//   final GlobalKey<CurvedNavigationBarState> navigationKeyPatient =
//       GlobalKey<CurvedNavigationBarState>();
//   // get getIndex => index;

//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     MainScreenDoctorControllerImp controller = MainScreenDoctorControllerImp();

//     Get.put(controller);
//     return GetBuilder<MainScreenDoctorControllerImp>(
//       builder: (controller) => Scaffold(
//         backgroundColor: ColorApp.white,
//         extendBody: true,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(50.0),
//           child: TopBar(
//             fun: () => controller.goToChatAllPatients(),
//           ),
//         ),
//         body: screens[controller.index],
//         bottomNavigationBar: CurvedNavigationBar(
//           key: navigationKeyPatient,
//           items: controller.items,
//           height: 60,
//           index: controller.index,
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: ColorApp.blue,
//           animationDuration: const Duration(milliseconds: 500),
//           color: const Color(0xFFe0e9ef),
//           onTap: (index)
//               //  controller.changeIndex(indexm)
//               {
//             this.index = controller.index;
//             // print('********************');
//             // print('object index = ');
//             // print(this.index);
//             // print('********************');
//             // print('controller index = ');
//             // print(controller.index);
//             // print('********************');
//             // print('********************');
//             controller.changeIndex(index);

//             // Get.appUpdate();
//             // });
//           },
//         ),
//       ),
//     );
//   }
// }













// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // import 'package:flutter/material.dart';
// // import '../../../core/constant/color.dart';
// // import '../../widget/topbardoctor.dart';
// // import 'addadvice.dart';
// // import 'homepage.dart';
// // import 'patients.dart';
// // import 'profile/profilepage.dart';

// // class MainScreenDoctor extends StatelessWidget {
// //   MainScreenDoctor({super.key});
// //   final screens = [
// //     HomeDoctor(),
// //     const AddAdvicePage(),
// //     const ProfilePageDoctor(),
// //     const PatientsPage()
// //   ];
// //   GlobalKey<CurvedNavigationBarState> navigationKeyDoctor =
// //       GlobalKey<CurvedNavigationBarState>();
// //   int index = 0;
// //   get getIndex => index;

// //   @override
// //   Widget build(BuildContext context) {
// //     // BottomBar bottomBar = const BottomBar();
// //     // int index = bottomBar.getIndex();
// //     final items = <Widget>[
// //       Icon(
// //         Icons.home,
// //         color: index == 0 ? Colors.white : ColorApp.blue,
// //         size: 26,
// //       ),
// //       Icon(
// //         Icons.add_circle_outlined,
// //         color: index == 1 ? Colors.white : ColorApp.blue,
// //         size: 26,
// //       ),
// //       Icon(
// //         Icons.account_circle_rounded,
// //         color: index == 2 ? Colors.white : ColorApp.blue,
// //         size: 26,
// //       ),
// //       Icon(
// //         Icons.medical_services,
// //         color: index == 3 ? Colors.white : ColorApp.blue,
// //         size: 26,
// //       ),
// //     ];
// //     return Scaffold(
// //         backgroundColor: ColorApp.white,
// //         extendBody: true,
// //         appBar: const PreferredSize(
// //           preferredSize: Size.fromHeight(50.0),
// //           child: TopBarDoctor(),
// //         ),
// //         body: screens[index],
// //         bottomNavigationBar: CurvedNavigationBar(
// //           key: navigationKeyDoctor,
// //           items: items,
// //           height: 60,
// //           index: index,
// //           backgroundColor: Colors.transparent,
// //           buttonBackgroundColor: ColorApp.blue,
// //           animationDuration: const Duration(milliseconds: 500),
// //           color: const Color(0xFFe0e9ef),
// //           onTap: (index) {
// //             // setState(() {
// //             this.index = index;
// //             // });
// //           },
// //         ));
// //   }
// // }
