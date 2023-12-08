// import 'package:flutter/material.dart';
// import 'package:get/state_manager.dart';

// import '../../../controller/onboardingcontroller.dart';
// import '../../../core/constant/color.dart';
// import '../../../data/datasource/static/onboardinglist.dart';

// class CustomeDotController extends StatelessWidget {
//   const CustomeDotController({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<OnBoardingControllerImp>(
//       builder: (controller) => Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 25),
//           ...List.generate(
//             onBoardingList.length,
//             (index) => AnimatedContainer(
//               margin: const EdgeInsets.only(right: 7),
//               duration: const Duration(microseconds: 900),
//               width: controller.currentPage == index ? 20 : 6,
//               height: 6,
//               decoration: BoxDecoration(
//                 color: ColorApp.blue,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
