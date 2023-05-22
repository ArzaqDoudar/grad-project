import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

showdialog(String title, String text) {
  Get.defaultDialog(
    title: title,
    titleStyle:
        const TextStyle(color: ColorApp.blue, fontWeight: FontWeight.bold),
    middleText: text,
    // actions: [
    //   ElevatedButton(
    //       style: ButtonStyle(
    //           backgroundColor: MaterialStateProperty.all(ColorApp.blue)),
    //       onPressed: () {
    //         exit(0);
    //       },
    //       child: const Text("تاكيد")),
    //   ElevatedButton(
    //       style: ButtonStyle(
    //           backgroundColor: MaterialStateProperty.all(ColorApp.blue)),
    //       onPressed: () {
    //         Get.back();
    //       },
    //       child: const Text("الغاء"))
    // ]
  );
}
