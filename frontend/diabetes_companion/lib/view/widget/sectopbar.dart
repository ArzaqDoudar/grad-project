import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/localization/changelocal.dart';

class SecTopBar extends GetView<LoacleController> {
  const SecTopBar({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorApp.blue,
      title: Text(label),
      centerTitle: true,
      // leading: IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {},
      // ),
    );
  }
}
