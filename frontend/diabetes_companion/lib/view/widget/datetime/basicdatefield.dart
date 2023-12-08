import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import '/core/constant/color.dart';

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  final TextEditingController controller;
  BasicDateField({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      elevation: 2,
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: DateTimeField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: ColorApp.blue,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: ColorApp.blue,
              ),
            ),
            label: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "تاريخ الميلاد",
                style: TextStyle(
                  fontSize: 20,
                  color: ColorApp.blue,
                ),
              ),
            ),
            // iconColor: ColorApp.blue,
            // prefixIcon: const Icon(
            //   Icons.date_range_outlined,
            //   color: ColorApp.blue,
            // ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
          format: format,
          // onChanged: (value) => {dateFunction(textEditingController)},
          onShowPicker: (context, currentValue) async {
            return await showDatePicker(
              context: context,
              confirmText: 'تم',
              cancelText: 'الغاء',
              helpText: "",
              firstDate: DateTime(1930),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime.now(),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: ColorApp.blue, // <-- SEE HERE
                      onPrimary: ColorApp.white, // <-- SEE HERE
                      onSurface: ColorApp.darkBlue, // <-- SEE HERE
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: ColorApp.blue, // button text color
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
