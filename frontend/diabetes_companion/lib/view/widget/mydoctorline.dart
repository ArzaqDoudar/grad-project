import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class MyDoctorLine extends StatelessWidget {
  const MyDoctorLine({
    super.key,
    required this.name,
    required this.specialty,
    required this.phone,
    this.email,
    this.location,
    // required this.onPressedFun,
    // this.receiver
  });
  final String name;
  final String specialty;
  final String phone;
  final String? email;
  final String? location;

  // final VoidCallback onPressedFun;
  // final bool? receiver;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressedFun,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "الإسم: $name",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "التخصص: $specialty",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'رقم الهاتف: 0$phone ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),

                  email != null
                      ? Text(
                          "$email : البريد الإلكتروني ",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        )
                      : Container(),
                  location != null
                      ? Text(
                          'العنوان: $location ',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        )
                      : Container(),
                  // Text(
                  //   'العنوان: ${location ?? "-----"}',
                  //   style: const TextStyle(fontSize: 16, color: ColorApp.grey),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            const CircleAvatar(
              foregroundImage: NetworkImage(ImageAsset.avatarDoctor2),
              radius: 39,
            ),
            const SizedBox(
              width: 20,
            ),
            // const Icon(Icons.arrow_forward_ios_rounded),
          ]),
        ),
      ),
    );
  }
}
