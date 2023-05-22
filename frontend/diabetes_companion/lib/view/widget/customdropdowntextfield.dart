import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    required this.controller,
    required this.items,
  });

  final List<DropDownValueModel> items;
  final SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
            color: ColorApp.blue, width: 1), //border of dropdown button
        borderRadius:
            BorderRadius.circular(12), //border raiuds of dropdown button
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropDownTextField(
            controller: controller,
            clearOption: true,
            dropDownItemCount: items.length,
            enableSearch: true,
            dropDownList: items,
            onChanged: (val) {},
            textStyle: const TextStyle(
              fontSize: 20,
              color: ColorApp.blue,
            ),
          ),
        ),
      ),
    );
  }
}
