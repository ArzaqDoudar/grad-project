import 'package:diabetes_companion/controller/bottombarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class BottomBar extends StatelessWidget {
  // final BottomBarControllerImp controller;
  final int index;
  final String id;
  final String email;
  const BottomBar({
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
          Get.offNamed(RouteApp.home, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.home,
          color: index == 0 ? ColorApp.blue : ColorApp.grey,
          // size: index == 0 ? 32 : 26,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.reportspages, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.bar_chart_rounded,
          color: index == 1 ? ColorApp.blue : ColorApp.grey,
          // size: index == 1 ? 32 : 26,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.morepages, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.add_circle_outlined,
          color: index == 2 ? ColorApp.blue : ColorApp.grey,
          // size: index == 2 ? 32 : 26,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.profile, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon: Icon(
          Icons.account_circle_rounded,
          color: index == 3 ? ColorApp.blue : ColorApp.grey,
          // size: index == 3 ? 32 : 26,
          size: 26,
        ),
      ),
      IconButton(
        onPressed: () {
          Get.offNamed(RouteApp.storespages, arguments: {
            'id': id,
            'email': email,
          });
        },
        icon:
            // Container(
            //   height: index == 4 ? 35 : 0,
            //   width: index == 4 ? 35 : 0,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(100),
            //     color: ColorApp.blue.withOpacity(0.1),
            //   ),
            //   child:
            Icon(
          Icons.store,
          color: index == 4 ? ColorApp.blue : ColorApp.grey,
          // size: index == 4 ? 32 : 26,
          size: 26,
        ),
      ),
      // ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // color: ColorApp.blue.withOpacity(0.1),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.blue, width: 2),
          borderRadius: BorderRadius.circular(25),
          // color: ColorApp.blue.withOpacity(0.1),
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
