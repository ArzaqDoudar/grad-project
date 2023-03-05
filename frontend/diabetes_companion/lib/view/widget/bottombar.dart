// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:diabetes_companion/view/screen/home.dart';
// import 'package:diabetes_companion/view/screen/onboarding.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../core/localization/changelocal.dart';

// // class BottomBar extends GetView<LoacleController> {
// //   const BottomBar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     int index = 0;
// //     final items = <Widget>[
// //       const Icon(Icons.home),
// //       const Icon(Icons.bar_chart_rounded),
// //       const Icon(Icons.store),
// //       const Icon(Icons.account_circle_rounded),
// //       const Icon(Icons.menu_rounded),
// //     ];
// //     return CurvedNavigationBar(
// //       items: items,
// //       height: 60,
// //       index: index,
// //       backgroundColor: Colors.transparent,
// //       buttonBackgroundColor: Colors.pink,

// //       animationDuration: Duration(milliseconds: 500),

// //       color: Colors.blue,
// //       // onTap: (index) {
// //       //   this.i
// //       // },
// //     );
// //     // return BottomNavigationBar(
// //     //   items: <BottomNavigationBarItem>[
// //     //     BottomNavigationBarItem(
// //     //         icon: const Icon(Icons.home), label: 'bottomBarItemLabelHome'.tr),
// //     //     BottomNavigationBarItem(
// //     //       icon: const Icon(Icons.bar_chart_rounded),
// //     //       label: 'bottomBarItemLabelReport'.tr,
// //     //     ),
// //     //     BottomNavigationBarItem(
// //     //         icon: const Icon(Icons.account_circle_rounded),
// //     //         label: 'bottomBarItemLabelProfile'.tr),
// //     //     BottomNavigationBarItem(
// //     //         icon: const Icon(Icons.menu), label: 'bottomBarItemLabelMore'.tr),
// //     //   ],
// //     //   selectedItemColor: Colors.blue[700],
// //     //   unselectedItemColor: const Color(0xFF005A8D),
// //     //   // elevation: 0,
// //     //   showUnselectedLabels: true,
// //     // );
// //   }
// // }

// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   final navigationKey = GlobalKey<CurvedNavigationBarState>();
//   int index = 0;
//   get getIndex => index;
//   // final screens = [Home(), OnBoarding()];
//   @override
//   Widget build(BuildContext context) {
//     final items = <Widget>[
//       const Icon(Icons.home),
//       const Icon(Icons.bar_chart_rounded),
//       const Icon(Icons.store),
//       const Icon(Icons.account_circle_rounded),
//       const Icon(Icons.menu_rounded),
//     ];
//     return CurvedNavigationBar(
//       key: navigationKey,
//       items: items,
//       height: 60,
//       index: index,
//       backgroundColor: Colors.transparent,
//       buttonBackgroundColor: Colors.pink,
//       animationDuration: Duration(milliseconds: 500),
//       color: Colors.blue,
//       onTap: (index) {
//         setState(() {
//           this.index = index;
//         });
//       },
//     );
//   }
// }
