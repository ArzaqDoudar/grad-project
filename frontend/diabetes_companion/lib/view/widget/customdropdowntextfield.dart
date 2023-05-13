import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomDropDownTextField extends StatelessWidget {
  const CustomDropDownTextField({
    super.key,
    // this.textFieldFocusNode,
    // this.searchFocusNode,
    required this.controller,
    required this.items,
  });

  final List<DropDownValueModel> items;
  final SingleValueDropDownController controller;
  // final FocusNode? textFieldFocusNode;
  // final FocusNode? searchFocusNode;

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
            // const DropDownValueModel(name: ' اختر نوع السكري', value: "0"),
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
    //   return
    // DropDownTextField(
    //     controller: controller,
    //     clearOption: true,
    //     dropDownItemCount: 8,
    //     // searchShowCursor: false,
    //     enableSearch: true,
    //     // searchKeyboardType: TextInputType.number,
    //     dropDownList: const [
    //       DropDownValueModel(name: 'النوع الأول', value: "1"),
    //       DropDownValueModel(name: 'النوع الثاني', value: "2")
    //     ],
    //     onChanged: (val) {},
    //     textStyle: const TextStyle(
    //       fontSize: 20,
    //       color: ColorApp.blue,
    //     ),
    //   );
    // }
  }
}
