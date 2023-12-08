// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';

// import '../../core/constant/color.dart';
// import '../widget/topbar.dart';
// // import 'home.dart';
// // import 'morepage.dart';
// import 'patient/home.dart';
// import 'patient/morepage.dart';
// import 'patient/profile/profilepage.dart';
// import 'patient/reportpage.dart';
// import 'patient/storespage.dart';
// // import 'reportpage.dart';
// // import 'storespage.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   final screens = [
//     Home(),
//     const ReportPage(),
//     const StorePage(),
//     const ProfilePage(),
//     const MorePage(),
//   ];
//   final navigationKey = GlobalKey<CurvedNavigationBarState>();
//   int index = 0;
//   get getIndex => index;

//   @override
//   Widget build(BuildContext maincontext) {
//     // BottomBar bottomBar = const BottomBar();
//     // int index = bottomBar.getIndex();
//     final items = <Widget>[
//       Icon(
//         Icons.home,
//         color: index == 0 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.bar_chart_rounded,
//         color: index == 1 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.store,
//         color: index == 2 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.account_circle_rounded,
//         color: index == 3 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//       Icon(
//         Icons.add_circle_rounded,
//         color: index == 4 ? Colors.white : ColorApp.blue,
//         size: 26,
//       ),
//     ];
//     return Scaffold(
//         backgroundColor: ColorApp.white,
//         extendBody: true,
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
//           child: TopBar(),
//         ),
//         body: screens[index],
//         bottomNavigationBar: CurvedNavigationBar(
//           key: navigationKey,
//           items: items,
//           height: 60,
//           index: index,
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: ColorApp.blue,
//           animationDuration: const Duration(milliseconds: 500),
//           color: const Color(0xFFe0e9ef),
//           onTap: (index) {
//             setState(() {
//               this.index = index;
//             });
//           },
//         ));
//   }
// }
