import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class ProfileLine extends StatelessWidget {
  ProfileLine({
    super.key,
    required this.title,
    required this.value,
    this.icon,
    this.swap,
    this.phone,
    this.trueIcon,
  });
  final String title;
  final String value;
  final Icon? icon;
  final bool? trueIcon;
  bool? swap;
  bool? phone;

  @override
  Widget build(BuildContext context) {
    // swap = swap ?? false;
    // phone = phone ?? false;
    return ListTile(
      focusColor: Colors.red,
      leading: icon,
      title: Directionality(
        textDirection: swap == true ? TextDirection.rtl : TextDirection.rtl,
        child: Row(
          children: [
            Text(
              textAlign: TextAlign.right,
              phone == true ? "$title : 0$value" : "$title : $value",
              style: const TextStyle(
                  color: ColorApp.grey1,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            trueIcon == true
                ? const Icon(
                    Icons.done_outline_sharp,
                    color: Colors.green,
                    size: 20,
                  )
                : Container(),
          ],
        ),
      ),

      // Text(
      //   // textAlign: TextAlign.right,
      //   swap == true ? Directionality("$title 1: $value") : "$value : $title",
      //   style: const TextStyle(
      //       color: ColorApp.grey1, fontSize: 18, fontWeight: FontWeight.bold),
      // ),
    );
  }
}
