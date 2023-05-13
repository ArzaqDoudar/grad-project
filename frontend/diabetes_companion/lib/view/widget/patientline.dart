import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class PatientLine extends StatelessWidget {
  const PatientLine({
    super.key,
    required this.name,
    required this.email,
    this.diabetestype,
    this.avatar,
    required this.onPressedFun,
    // this.receiver
  });
  final String name;
  final String email;
  final int? diabetestype;
  final String? avatar;

  final VoidCallback onPressedFun;
  // final bool? receiver;

  @override
  Widget build(BuildContext context) {
    String diabetestypeData;
    if (diabetestype == 1) {
      diabetestypeData = ' النوع الاول';
    } else if (diabetestype == 2) {
      diabetestypeData = ' النوع الثاني';
    } else {
      diabetestypeData = 'غير معرف';
    }
    return GestureDetector(
      onTap: onPressedFun,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              foregroundImage:
                  NetworkImage(avatar ?? ImageAsset.adviceDefultImage),
              radius: 39,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16, color: ColorApp.grey),
                  ),
                  Text(
                    diabetestypeData,
                    style: const TextStyle(fontSize: 16, color: ColorApp.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ]),
        ),
      ),
    );
  }
}
