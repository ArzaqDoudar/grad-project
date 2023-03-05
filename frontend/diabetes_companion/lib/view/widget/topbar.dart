import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/localization/changelocal.dart';

class TopBar extends GetView<LoacleController> {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          // TODO
        },
        icon: const Icon(Icons.message),
      ),
      title: const Text('رفيق السكري'),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // TODO
          },
        )
      ],
      backgroundColor: ColorApp.blue,
    );
  }
}
