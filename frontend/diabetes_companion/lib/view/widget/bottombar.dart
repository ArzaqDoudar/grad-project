import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class BottomBar extends StatelessWidget {
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
        icon: Icon(
          Icons.store,
          color: index == 4 ? ColorApp.blue : ColorApp.grey,
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
