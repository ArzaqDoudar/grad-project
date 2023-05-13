import 'package:diabetes_companion/view/screen/firebase/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/localization/changelocal.dart';
import '../screen/chat.dart';

class TopBarDoctor extends GetView<LoacleController> {
  const TopBarDoctor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          icon: const Icon(Icons.message),
        );
      }),
      title: const Text('رفيق السكري'),
      centerTitle: true,
      backgroundColor: ColorApp.blue,
    );
  }
}
