import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class BottomBarDoctor extends StatelessWidget {
  final int index;
  final String id;
  final String email;
  const BottomBarDoctor({
    required this.id,
    required this.email,
    required this.index,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    List<Widget> items = <Widget>[
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.homedoctor, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.home,
          color: index == 0 ? ColorApp.blue : ColorApp.grey,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.addadvice, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.add_comment_outlined,
          color: index == 1 ? ColorApp.blue : ColorApp.grey,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.patient, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          // Icons.,
          Icons.people_outline_rounded,
          color: index == 2 ? ColorApp.blue : ColorApp.grey,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.profiledoctor, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.account_circle_rounded,
          color: index == 3 ? ColorApp.blue : ColorApp.grey,
          size: 26,
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.blue, width: 2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}
