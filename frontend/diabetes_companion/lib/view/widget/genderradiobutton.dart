// import '/controller/genderradiobuttoncontroller.dart';
// import '/core/constant/color.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// class GenderRadioButton extends StatelessWidget {
//   final String value;
//   final String title;

//   const GenderRadioButton(
//       {super.key, required this.value, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(GenderRadioButtonController());
//     return GetBuilder<GenderRadioButtonController>(builder: (controller) {
//       return InkWell(
//         onTap: () => controller.gender = value,
//         child: Row(
//           children: [
//             Radio(
//               value: value,
//               groupValue: controller.gender,
//               onChanged: (String? val) {},
//               activeColor: ColorApp.blue,
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             Text(title),
//             const SizedBox(
//               width: 10,
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
